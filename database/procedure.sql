CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieveEMPData`()
BEGIN
  select e.id,e.firstname,e.lastname,eh.age,eh.doj,eh.department,eh.salary,p.name from emp e inner join emp_hr eh on e.id =eh.id inner join emp_project ep on e.id = ep.id inner join project p on
p.id = ep.project_id ; 	
END