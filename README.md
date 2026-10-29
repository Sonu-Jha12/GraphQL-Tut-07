# GraphQL Tutorial 07

## Overview

This project demonstrates the implementation of GraphQL using Node.js, Apollo Server, and MySQL. It provides a simple system to manage authors and books through GraphQL queries and mutations.

## Technologies Used

- **Node.js** – JavaScript runtime environment
- **Apollo Server** – GraphQL server implementation
- **GraphQL** – API query language
- **MySQL** – Relational database
- **HTML, CSS, JavaScript** – Frontend interface

## Features

- Retrieve all books from the database.
- Retrieve authors and their associated books.
- Use GraphQL queries to request specific data.
- Add new books using GraphQL mutations.
- Store and retrieve data using MySQL.
- Interact with the GraphQL API through a frontend interface.

## Project Structure

```text
GraphQL_Tut_07/
├── db.js
├── index.html
├── schema.sql
├── server.js
├── style.css
├── package.json
├── package-lock.json
├── .gitignore
└── README.md
```

## Prerequisites

Make sure the following are installed:

- Node.js and npm
- MySQL Server

## Installation and Setup

### 1. Clone the repository

```bash
git clone https://github.com/Sonu-Jha12/GraphQL-Tut-07.git
cd GraphQL-Tut-07
```

### 2. Install dependencies

```bash
npm install
```

### 3. Configure the database

Create the MySQL database and tables using the provided SQL script:

```bash
mysql -u root -p
```

Then, inside the MySQL prompt, run:

```sql
SOURCE schema.sql;
```

Enter your MySQL password when prompted.

### 4. Configure environment variables

Create a `.env` file in the project root directory:

```env
DB_USER=root
DB_PASSWORD=your_mysql_password
```

Replace `your_mysql_password` with your actual MySQL password. Do not upload the `.env` file to GitHub.

Ensure that `server.js` loads environment variables using `require('dotenv').config();` and that `dotenv` is installed.

### 5. Start the server

```bash
node server.js
```

Open the GraphQL endpoint in your browser, typically:

http://localhost:4000

Use the configured GraphQL interface to execute queries and mutations.

## Example GraphQL Query

```graphql
query {
  books {
    id
    title
    year
    author {
      id
      name
    }
  }
}
```

## Example GraphQL Mutation

```graphql
mutation {
  addBook(title: "GraphQL Basics", year: 2025, authorId: 1) {
    id
    title
    year
  }
}
```

*Note: The query and mutation fields must match the definitions in `server.js`.*

## Learning Objectives

- Understand GraphQL schemas, types, queries, and mutations.
- Connect a Node.js application to a MySQL database.
- Retrieve related records using GraphQL resolvers.
- Build a basic frontend for interacting with a GraphQL API.

## Author

**Sonu Jha**  
MCA Student, IIIT Vadodara

---

This project was developed as part of a GraphQL learning assignment.
