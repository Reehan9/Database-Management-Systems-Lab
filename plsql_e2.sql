declare
Cursor curr is select * from supply; counter int ;
rows supply%rowtype;
begin
open curr;
loop
fetch curr into rows;
exit when curr%notfound;
insert into supply_copy values(rows.sid, rows.pid, rows.quantity); end loop
counter:= curr%rowcount;
close curr; dbms_output.put_line(counter||”rows inserted”);
end;
/
