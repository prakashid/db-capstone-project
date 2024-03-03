import mysql.connector as connector
from mysql.connector.pooling import MySQLConnectionPool
from mysql.connector import Error

connection=connector.connect(user="root",password="root")
cursor=connection.cursor()
cursor.execute("USE little_lemon_db")

dbconfig={
    "database":"little_lemon_db",
    "user":"root",
    "password":"root"
}

try:
    pool=MySQLConnectionPool(pool_name="pool_a",pool_size=2)
    print("Connection pool is created with name: ",pool.pool_name)
    print("Connection pool size is: ",pool.pool_size)
    connection1=pool.get_connection()

except Error as er:
    print("Error code no is: ",er.errno)
    print("Error code name is: ",er.msg)