-- Wrote by Ryan Putranda Kristianto
-- Lecture of Informatics Science Department
-- Universitas Katolik Darma Cendika Surabaya



-- Cek tabel Customers setelah diberi akses Grant Select
SELECT * FROM Customers

-- Sekarang coba lakukan perintah lain misalkan DELETE data di tabel Customers, apakah bisa ?
DELETE FROM Customers WHERE customer_id = 'CUS-000001'

-- Kembali ke user DBA / SuperAdmin

---------------------- Coba di user DBA / SuperAdmin -----------------------

SELECT * FROM Customers

---------------------- Coba di user DBA / SuperAdmin -----------------------

-- Coba untuk drop table testingTrigger
DROP TABLE dbo.testingTrigger

-- Buat lagi tablenya di sini (coba)
CREATE TABLE testingTrigger(
	id_testing INT
)

-- Rubah struktural table di sini (coba)
ALTER TABLE testingTrigger
	ADD id_trigger INT

-- Cabut role membership db_ddladmin nya dan hapus GRANT permissionnya

---------------------- Coba di user DBA / SuperAdmin -----------------------

-- Coba hapus table
DROP TABLE dbo.testingTrigger