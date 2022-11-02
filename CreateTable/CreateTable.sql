-- Active: 1667386032292@@127.0.0.1@3306@storefront

USE storefront;

-- Product Table --
CREATE TABLE products(
    product_id INT AUTO_INCREMENT ,
    product_name VARCHAR(50) NOT NULL,
    product_price DOUBLE NOT NULL,
    product_quantity  INT DEFAULT 0 ,
    date_added DATETIME,

    PRIMARY KEY(product_id) 
    );


-- Image Table -- 
CREATE Table image(
    image_id INT AUTO_INCREMENT,
    product_id INT, 
    image_url VARCHAR(200) NOT NULL,

    PRIMARY KEY(image_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id),
);


-- Categories --
CREATE TABLE categories(
    category_id INT AUTO_INCREMENT,
    parent_id INT REFERENCES category_id,
    category_name VARCHAR(100) NOT NULL,

    PRIMARY KEY(category_id)
);


-- Product Category Linker -- 
CREATE TABLE product_categories(
    category_id INT,
    product_id INT,
    
    PRIMARY KEY(category_id, product_id),
    FOREIGN KEY(category_id) REFERENCES categories(category_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- Users Table -- 
CREATE TABLE users(
    user_id INT AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    user_email VARCHAR(100),
    user_role INT DEFAULT 0,

    PRIMARY KEY(user_id),
    UNIQUE(user_email),
);


-- User Address -- 
CREATE TABLE user_addresses(
    address_id INT AUTO_INCREMENT, 
    user_id INT,
    address VARCHAR(200) NOT NULL,

    PRIMARY KEY(address_id),
    FOREIGN key(user_id) REFERENCES users(user_id),
);


-- Orders Table --
CREATE TABLE Orders(
    order_id INT,
    user_id INT,
    address_id INT,
    order_date DATETIME,

    PRIMARY KEY(order_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(address_id) REFERENCES user_addresses(user_address),
    NOT NULL(order_date)
    );

-- Order Products -- 
CREATE TABLE order_products(
    order_id INT,
    product_id INT,
    product_quantity INT,

    FOREIGN KEY(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id),

)