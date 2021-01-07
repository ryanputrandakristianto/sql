-- Wrote by Ryan Putranda Kristianto
-- Lecture of Informatics Science Department
-- Universitas Katolik Darma Cendika Surabaya





-- LANGKAH - LANGKAH SKENARIO DATABASE SECURITY - DCL

-- Buat dulu username, password dan sekalian default databasenya yang dikasih akses
CREATE LOGIN ryan WITH PASSWORD = 'ryan',
DEFAULT_DATABASE = RetailDb_New

-- Cek kalau sudah ada di record system SQL Server
SELECT createdate,name,dbname FROM syslogins
WHERE year(createdate)='2021'

-- Atau bisa juga

-- Cek di folder logins sudah ada atau blm dan cek propertiesnya
-- Buat user untuk login ryan dan password ryan
CREATE USER admin_ryan FOR LOGIN ryan

-- Skenario dimulai..
-- Coba login dengan menggunakan username dan passwd yg sudah dibuat sebelumnya
-- Jika sudah berhasil akseslah tabel - tabel pada database RetailDb_New apakah bisa ?

---------------------- Coba di user admin_ryan -----------------------

-- Jika tidak, kita berikan akses untuk admin_ryan agar hanya bisa mengakses tabel Customers
-- dan user tsb hanya bisa melihat saja tanpa bisa melakukan DELETE INSERT UPDATE
GRANT SELECT ON Customers TO admin_ryan

-- Coba cek pada user admin_ryan dengan menampilkan data tabel Customers, apakah bisa ?

---------------------- Coba di user admin_ryan -----------------------

-- Coba revoke akses SELECT yang sudah diberikan ke admin_ryan
REVOKE SELECT ON Customers TO admin_ryan

-- Sekarang coba cek di user admin_ryan apakah bisa SELECT tabel customers lagi ?

---------------------- Coba di user admin_ryan -----------------------

-- Coba beri akses DDL ke admin_ryan
CREATE TABLE testingTrigger(
	id_testing INT
)

GRANT ALTER ON OBJECT :: testingTrigger TO admin_ryan

-- Beri membership role ke admin_ryan agar bisa DDL
-- note : db_ddladmin adalah membership role agar user dapat melakukan perintah DDL
EXEC sp_addrolemember 'db_ddladmin', 'admin_ryan'

---------------------- Coba di user admin_ryan -----------------------

-- Cabut role membership db_ddladmin nya dan hapus GRANT permissionnya

REVOKE ALTER ON OBJECT :: testingTrigger TO admin_ryan
EXEC sp_droprolemember 'db_ddladmin', 'admin_ryan'

-- Cek di admin_ryan masih bisa atau tidak

---------------------- Coba di user admin_ryan -----------------------