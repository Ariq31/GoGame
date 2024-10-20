-- SCENARIO 1
-- On May 6 2023, A new male customer named "Muhammad Sumbul" buys 5 different games. 
-- He was born on 2 April 1999. His phone number is 08128392810.
-- This transaction was handled by a staff named "Maximilian Franklin".

INSERT INTO customer (CustomerID, CustomerName, CustomerGender, CustomerDoB, CustomerPhoneNumber)
VALUES ('CU011', 'Muhammad Sumbul', 'Male', '1999-04-02', '08128392810')

INSERT INTO sales_header (SalesID, CustomerID, StaffID, TransactionDate)
VALUES ('SA016', 'CU011', 'ST010', '2023-05-06')

INSERT INTO sales_detail (SalesID, GameID, Quantity)
VALUES ('SA016', 'GA003', 1),
       ('SA016', 'GA004', 1),
       ('SA016', 'GA005', 1),
       ('SA016', 'GA002', 1),
       ('SA016', 'GA010', 1)


-- SCENARIO 2
-- On April 2, 2023, GoGame staff member "Maximilian Franklin" restocked the shop's games.
-- He purchased 10 different games from a supplier named "Turner Games", buying 20 copies of each game.

INSERT INTO purchase_header (PurchaseID, StaffID, SupplierID, PurchaseDate)
VALUES ('PU016', 'ST010', 'SU007', '2023-04-02');

INSERT INTO purchase_detail (PurchaseID, GameID, Quantity)
VALUES ('PU016', 'GA001', 20),
       ('PU016', 'GA002', 20),
       ('PU016', 'GA003', 20),
       ('PU016', 'GA004', 20),
       ('PU016', 'GA005', 20),
       ('PU016', 'GA006', 20),
       ('PU016', 'GA007', 20),
       ('PU016', 'GA008', 20),
       ('PU016', 'GA009', 20),
       ('PU016', 'GA010', 20);