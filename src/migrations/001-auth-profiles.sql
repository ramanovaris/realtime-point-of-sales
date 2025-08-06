-- create table profiles
CREATE TABLE public.profiles (
    id uuid NOT NULL REFERENCES auth.users ON DELETE CASCADE,
    name text,
    role text,
    avatar_url text,
    created_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
    updated_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE
    public.profiles enable ROW LEVEL SECURITY;
-- insert a row into public.profiles when user is created
CREATE FUNCTION public.handle_new_user () RETURNS trigger language plpgsql SECURITY DEFINER
SET
    search_path = '' AS $ $ BEGIN
INSERT INTO
    public.profiles (id, name, role, avatar_url)
VALUES
    (
        new.id,
        new.raw_user_meta_data ->> 'name',
        new.raw_user_meta_data ->> 'role',
        new.raw_user_meta_data ->> 'avatar_url'
    );
RETURN new;
END;
$ $;
-- trigger the function every time a user is created
CREATE trigger on_auth_user_created
AFTER
INSERT
    ON auth.users FOR each ROW EXECUTE PROCEDURE public.handle_new_user();
-- delete a row from public.profiles
CREATE FUNCTION public.handle_delete_user() RETURNS trigger language plpgsql SECURITY DEFINER
SET
    search_path = '' AS $ $ BEGIN
DELETE FROM
    public.profiles
WHERE
    id = old.id;
RETURN old;
END;
$ $;
-- trigger the function every time a user is deleted
CREATE trigger on_auth_user_deleted
AFTER
    DELETE ON auth.users FOR each ROW EXECUTE PROCEDURE public.handle_delete_user();