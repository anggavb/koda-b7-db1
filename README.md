# Minitask 1 - Library
```DB Diagram
Table Book {
  id int [pk]
  title string
  publisher string
  category_id int [ref: > Category.id]
  bookshelf_id int [ref: - Bookshelf.id]
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
  staff_id int [ref: - Staff.id]
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

    Book ||--o{ Category : have
    Book ||--|| Bookshelf : have
    Borrow ||--o{ Book : borrowing
    Borrow ||--|| Staff : record
```

# Minitask 2 - E-Commerce
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

Table UserProduct {
  user_id int [ref: > Users.id]
  product_id int [ref: > Products.id]
  order_id int [ref: - Orders.id]
}

Table Orders {
  id int [pk]
  total_price decimal
  user_id int [ref: > Users.id]
  payment_id int [ref: - Payment.id]
}

Enum PaymentMethod {
  bank
  online
}

Table Payment {
  id int [pk]
  method PaymentMethod
}
```

```mermaid
erDiagram
    Users {
        int id PK
        string name
        email string
        string phone_number
        string address
        bool isSeller
    }
    Products {
        int id PK
        string name
        decimal price
        int category_id FK
    }
    Categories {
        int id PK
        string name
    }
    UserProduct {
        int user_id FK
        int product_id FK
        int order_id FK
    }
    Orders {
        int id PK
        decimal total_price
        int payment_id FK
    }
    Payment {
        int id PK
        enum method
    }

    Products ||--o{ Categories : have
    UserProduct ||--o{ Users : customer
    UserProduct ||--o{ Products : order
    UserProduct ||--o{ Orders : record-order
    Orders ||--|| Payment : pay
```