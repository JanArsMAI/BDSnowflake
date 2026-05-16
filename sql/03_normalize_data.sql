INSERT INTO stores(name, location, city, state, country, phone, email)
SELECT DISTINCT
    store_name AS name,
    store_location AS location,
    store_city AS city,
    store_state AS state,
    store_country AS country,
    store_phone AS phone,
    store_email AS email
FROM raw_data;


INSERT INTO pet(category)
SELECT DISTINCT
    pet_category AS category
FROM raw_data;

INSERT INTO supplier(name, contact, email, phone, address, city, country)
SELECT DISTINCT
    supplier_name AS name,
    supplier_contact AS contact,
    supplier_email AS email,
    supplier_phone AS phone,
    supplier_address AS address,
    supplier_city AS city,
    supplier_country AS country
FROM raw_data;






INSERT INTO customer(first_name, last_name, age, email, country, postal_code, pet_type, pet_name, pet_breed)
SELECT DISTINCT
    customer_first_name AS first_name,
    customer_last_name AS last_name,
    customer_age  AS age,
    customer_email  AS email,
    customer_country  AS country,
    customer_postal_code AS postal_code,
    customer_pet_type  AS pet_type,
    customer_pet_name  AS pet_name,
    customer_pet_breed AS pet_breed
FROM raw_data;


INSERT INTO sellers(first_name, last_name, email, country, postal_code)
SELECT DISTINCT
    seller_first_name AS first_name,
    seller_last_name AS last_name,
    seller_email AS email,
    seller_country AS country,
    seller_postal_code AS postal_code
FROM raw_data;

INSERT INTO products(
    name, 
    category, 
    weight, 
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date,
    color, 
    size, 
    brand, 
    material, 
    description
)
SELECT DISTINCT
    product_name AS name,
    product_category AS category,
    product_weight AS weight,
    product_rating AS product_rating,
    product_reviews AS product_reviews,
    product_release_date AS product_release_date,
    product_expiry_date AS product_expiry_date,
    product_color AS color,
    product_size AS size,
    product_brand AS brand,
    product_material AS material,
    product_description AS description
FROM raw_data;



INSERT INTO sales(
    date,
    quantity,
    product_quantity,
    total_price,
    customer_id,
    seller_id,
    product_id,
    store_id,
    pet_id,
    supplier_id
) 
SELECT
    s.sale_date AS date,
    s.sale_quantity AS quantity,
    s.product_quantity AS product_quantity,
    s.total_price AS total_price,
    c.id AS customer_id,
    sl.id AS seller_id,
    p.id AS product_id,
    st.id AS store_id,
    pt.id AS pet_id,
    sp.id AS supplier_id
FROM raw_data AS s
LEFT JOIN customer AS c
    ON s.customer_email = c.email
LEFT JOIN sellers AS sl
    ON s.seller_email = sl.email
LEFT JOIN products AS p
    ON s.product_name = p.name 
    AND s.product_category = p.category 
    AND s.product_brand = p.brand 
    AND s.product_description = p.description 
    AND s.product_size = p.size 
    AND s.product_weight = p.weight
    AND s.product_rating = p.product_rating
    AND s.product_release_date = p.product_release_date
LEFT JOIN stores AS st
    ON s.store_phone = st.phone 
    AND s.store_email = st.email
LEFT JOIN pet AS pt 
    ON s.pet_category = pt.category
LEFT JOIN supplier AS sp
    ON s.supplier_phone = sp.phone 
    AND s.supplier_email = sp.email;