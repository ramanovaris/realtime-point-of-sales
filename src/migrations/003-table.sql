CREATE TABLE public.tables (
    id serial NOT NULL,
    name text,
    description text,
    capacity numeric,
    STATUS text,
    created_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
    updated_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE
    public.tables enable ROW LEVEL SECURITY;