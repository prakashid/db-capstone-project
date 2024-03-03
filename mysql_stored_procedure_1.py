import mysql.connector as connector
connection = connector.connect(host='127.0.0.1',database='little_lemon_db',user='root',password='root',port=3306)
cursor = connection.cursor()

mysql_procedure="""
CREATE PROCEDURE PeakHours()
BEGIN
    SELECT HOUR(BookingSlot) my_hour, COUNT(HOUR(BookingSlot)) No_bookings 
    from Bookings 
    GROUP BY my_hour 
    ORDER BY No_bookings DESC;
END
"""

cursor.execute(mysql_procedure)
cols=cursor.column_names
cursor.callproc("PeakHours")

results=next(cursor.stored_results())
dataset=results.fetchall()
cursor.fetchall()
print(cols)
for hour in dataset:
    print(hour)
