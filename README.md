# Minitask 1 - Library
### DB Diagram
![Library](library.png)
```DB Diagram
Table Book {
  id int [pk]
  title string
  publisher string
  category_id int [ref: > Category.id]
  bookshelf_id int [ref: > Bookshelf.id]
}

Table Category {
  id int [pk]
  name string
}

Table Bookshelf {
  id int [pk]
  name string
}

Table Staff {
  id int [pk]
  name string
}

Table Borrow {
  id int [pk]
  borrower_name string
  book_id int [ref: > Book.id]
  staff_id int [ref: > Staff.id]
}
```

```mermaid
erDiagram
    Book {
        int id PK
        string title
        string publisher
        int category_id  FK
        int bookshelf_id FK
    }
    Category {
        int id PK
        string name
    }
    Bookshelf {
        int id PK
        string name
    }
    Staff {
        int id PK
        string name
    }
    Borrow {
        int id PK
        string borrower_name
        int book_id FK
        int staff_id FK
    }

    Category ||--o{ Book : contains
    Bookshelf ||--o{ Book : have
    Borrow ||--o{ Book : takes
    Staff ||--o{ Borrow : record
```

# Minitask 2 - E-Commerce
### DB Diagram
![E-Commerce](e-commerce.png)
```DB Diagram
Table Users {
  id int [pk]
  name string
  email string
  phone_number string
  address string
  isSeller bool [default: false]
}

Table Products {
  id int [pk]
  name string
  price decimal
  category_id int [ref: > Categories.id]
}

Table Categories {
  id int [pk]
  name string
}

Table OrderItems {
  product_id int [ref: > Products.id]
  order_id int [ref: - Orders.id]
  quantity int
  price_at_purchase decimal
}

Table Orders {
  id int [pk]
  total_price decimal
  user_id int [ref: > Users.id]
  payment_id int [ref: > Payment.id]
}

Enum PaymentMethod {
  bank
  wallet
}

Table Payment {
  id int [pk]
  name string
  method PaymentMethod
}
```

```mermaid
erDiagram
    Users {
        id int PK
        name string
        email string
        phone_number string
        address string
        isSeller bool
    }

    Products {
        id int PK
        name string
        price decimal
        category_id int FK
    }

    Categories {
        id int PK
        name string
    }

    OrderItems {
        product_id int FK
        order_id int FK
        quantity int
        price_at_purchase decimal
    }

    Orders {
        id int PK
        total_price decimal
        user_id int FK
        payment_id int FK
    }

    Payment {
        id int PK
        name string
        method PaymentMethod
    }

    Categories ||--o{ Products : contains
    Products ||--o{ OrderItems : has
    Orders ||--o{ OrderItems : has
    Users ||--o{ Orders : place
    Payment ||--o{ Orders : "paid via"
```