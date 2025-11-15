CREATE DATABASE loja;

USE loja;

CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NULL
);

CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    url_image VARCHAR(255) NULL,
    id_categoria INT NULL,
    
    FOREIGN KEY (id_categoria) 
        REFERENCES Categoria(id)
        ON DELETE SET NULL
);