CREATE TABLE public.menus (
    id serial NOT NULL,
    name text,
    description text,
    price numeric,
    discount numeric,
    image_url text,
    category text,
    is_available boolean,
    created_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
    updated_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE
    public.menus enable ROW LEVEL SECURITY;