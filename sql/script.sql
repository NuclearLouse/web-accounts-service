CREATE DATABASE web_accounts_service;
GO
USE web_accounts_service;
CREATE TABLE Account (
    Id VARCHAR(36) NOT NULL PRIMARY KEY,
    UserId VARCHAR(22) NOT NULL, -- тут нужен референс на таблицу клиентов
    Number text NOT NULL,
    Balance money NOT NULL DEFAULT 0,
    Currency VARCHAR(3) NOT NULL,
    LastTransaction datetime2 
);

INSERT INTO web_accounts_service.dbo.Account 
VALUES (
    '54947df8-0e9e-4471-a2f9-9af509fb5889',
    '3LEZyAZQaxrivkU9BK4TAf',
    'MD58VI225911910011729304',
    5585.29,
    'MDL',
    '2020-09-01 12:10:16.1234567');

INSERT INTO web_accounts_service.dbo.Account 
VALUES (
    '067e6162-3b6f-4ae2-a171-2470b63dff00', 
    '3LEZyAZQaxrivkU9BK4TAf',
    'MD05VI225911904241304048',
    420.62,
    'USA',
    '2020-07-15 23:07:22.1234567');
----------------------------------------------------------------------
USE web_accounts_service;
GO
CREATE PROCEDURE GetAccounts 
@inUserId VARCHAR(22)
AS
SELECT * FROM Account WHERE UserId=@inUserId
RETURN
GO
