# Online Store Management System

## Overview
This is an **Online Store Management System** implemented using **SQL Server (T-SQL)**.  
It is a mock project designed for academic purposes (finals submission) and demonstrates the use of **database creation, table relationships, CRUD operations, and reporting queries**.

The system manages:

- **Customers**: Online store customers  
- **Products**: Product catalog with categories, prices, and stock  
- **Orders**: Customer orders  
- **OrderItems**: Individual products within an order  
- **Staff**: Employees handling operations  

---

## Database Structure

### Tables

| Table       | Description |
|------------|-------------|
| Customers  | Stores customer information (CustomerID, Name, Email, Phone, JoinDate) |
| Products   | Stores product information (ProductID, Name, Category, Price, Stock) |
| Orders     | Stores customer orders (OrderID, CustomerID, OrderDate, TotalAmount) |
| OrderItems | Stores products in each order (OrderItemID, OrderID, ProductID, Quantity, Price) |
| Staff      | Stores staff information (StaffID, Name, Position, Email) |

---

## Files

- `create_tables.sql` – Contains all `CREATE DATABASE` and `CREATE TABLE` statements  
- `insert_data.sql` – Contains sample `INSERT` statements to populate tables  
- `queries.sql` – Contains CRUD operations and reporting queries (e.g., total sales per product, order details)  

---

## Features / Queries

- View all orders with customer information and total amounts  
- View all items in an order  
- Add, update, and delete products, customers, or orders  
- Track product stock and sales  
- Generate reports such as total sales per product  

---

## How to Use

1. Open **SQL Server Management Studio (SSMS)**.  
2. Create a new query and paste the SQL scripts in the following order:
   1. `create_tables.sql`  
   2. `insert_data.sql`  
   3. `queries.sql`  
3. Execute the scripts.  
4. The database `OnlineStoreDB` with all tables, sample data, and queries will be ready.  

---

## Notes

- This project uses **T-SQL (SQL Server syntax)**. Syntax like `IDENTITY` for auto-increment and `GETDATE()` for current date may need adjustment for other SQL systems.  
- The project is intended for learning and demonstration purposes only.  

---

## Author

- Nene Matitaishvili
- Academic Project / Finals Submission
