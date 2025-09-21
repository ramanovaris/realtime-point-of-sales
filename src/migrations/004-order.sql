CREATE TABLE public.orders (
    id serial NOT NULL,
    order_id text,
    customer_name text,
    STATUS text,
    payment_url text,
    table_id integer REFERENCES TABLES ON DELETE
    SET
        NULL,
        created_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
        updated_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
        PRIMARY KEY (id)
);
ALTER TABLE
    public.orders enable ROW LEVEL SECURITY;
CREATE TABLE public.orders_menus (
    id serial NOT NULL,
    order_id integer REFERENCES orders ON DELETE
    SET
        NULL,
        menu_id integer REFERENCES menus ON DELETE
    SET
        NULL,
        STATUS text,
        quantity integer,
        notes text,
        created_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
        updated_at timestamp WITH time zone DEFAULT timezone('utc' :: text, NOW()) NOT NULL,
        PRIMARY KEY (id)
);
ALTER TABLE
    public.orders_menus enable ROW LEVEL SECURITY;