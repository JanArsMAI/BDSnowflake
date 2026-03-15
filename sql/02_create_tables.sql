CREATE TABLE IF NOT EXISTS stores(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    location VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(200),
    UNIQUE (phone, email)
);

CREATE INDEX idx_stores ON stores(phone, email);



CREATE TABLE IF NOT EXISTS pet (
    id SERIAL PRIMARY KEY,
    category VARCHAR(50) UNIQUE
);


CREATE TABLE IF NOT EXISTS supplier (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    contact VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(50),
    address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),

    UNIQUE (phone, email)
);

CREATE INDEX idx_supplier_email ON supplier(phone, email);





CREATE TABLE IF NOT EXISTS customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT,
    email VARCHAR(255),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    pet_type VARCHAR(50),
    pet_name VARCHAR(100),
    pet_breed VARCHAR(100)
);

CREATE INDEX idx_customer_email ON customer(email);



CREATE TABLE IF NOT EXISTS sellers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    country VARCHAR(100),
    postal_code VARCHAR(20)
);

CREATE INDEX idx_sellers_email ON sellers(email);



CREATE TABLE IF NOT EXISTS products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    category VARCHAR(100),
    weight DECIMAL(10,2),
    color VARCHAR(50),
    size VARCHAR(50),
    brand VARCHAR(100),
    material VARCHAR(100),
    description TEXT
);
CREATE INDEX idx_products_name ON products(name, category);






CREATE TABLE IF NOT EXISTS sales(
    id SERIAL PRIMARY KEY,
    date DATE,
    sale_customer_id INT,
    sale_seller_id INT,
    sale_product_id INT,
    quantity INT,
    product_quantity INT,
    product_rating DECIMAL(3,2),
    product_reviews INT,
    product_release_date DATE,
    product_expiry_date DATE,
    total_price DECIMAL(10,2),
    customer_id INT REFERENCES  customer(id),
    seller_id INT REFERENCES  sellers(id),
    product_id INT REFERENCES  products(id),
    store_id INT REFERENCES  stores(id),
    pet_id INT REFERENCES  pet(id),
    supplier_id INT REFERENCES  supplier(id)
);