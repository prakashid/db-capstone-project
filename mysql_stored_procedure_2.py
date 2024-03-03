import mysql.connector as connector
connection = connector.connect(host='127.0.0.1',database='little_lemon_db',user='root',password='root',port=3306)
cursor = connection.cursor()

mysql_procedure="""

CREATE PROCEDURE GuestStatus()
BEGIN
	select concat(GuestFirstName," ",GuestLastName) GuestName from Bookings;
    select B.EmployeeID,E.Role,
	CASE
		WHEN E.Role="Manager" THEN "Ready to pay"
		WHEN E.Role="Assistant Manager" THEN "Ready to Pay"
		WHEN E.Role="Head Chef" THEN "Ready to Serve"
		WHEN E.Role="Assistant Chef" THEN "Preparing Order"
		WHEN E.Role="Head Waiter" THEN "Order Served"
	End AS OrderStatus
	from Bookings B INNER JOIN Employees E ON B.EmployeeID=E.EmployeeID;
    select * from Bookings B LEFT JOIN Employees E on B.EmployeeID=E.EmployeeID;
END;
"""
#cursor.execute("DROP PROCEDURE GuestStatus")
cursor.execute(mysql_procedure)

cursor.callproc("GuestStatus")

#dataset=results.fetchall()

results=next(cursor.stored_results())


for result in cursor.stored_results():
    print(result.fetchall())




