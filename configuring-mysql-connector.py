import mysql.connector as connector

connection = connector.connect(host='127.0.0.1',database='sakila',user='root',password='root',port=3306)

cursor = connection.cursor()

customer_insert="""INSERT INTO CUSTOMER VALUES(600,2,"PRAKASH","KUMAR","PRAKASHKUMAR@META.COM",
                600,1,"2006-02-14 22:04:36","2024-02-01 22:04:36")"""
#cursor.execute(customer_insert)

select_customer="""SELECT * FROM CUSTOMER"""
#cursor.execute(select_customer)

#result=cursor.fetchall()

#for cust in result:
#    print(cust)

delete_customer="""DELETE FROM CUSTOMER WHERE CUSTOMER_ID=600"""
cursor.execute(delete_customer)
connection.commit()

connection.close()