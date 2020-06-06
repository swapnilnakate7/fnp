package in.swapnil.fnp.controllers;

import in.swapnil.fnp.beans.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.logging.Logger;

@RestController
@CrossOrigin
public class EmployeeController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    Logger logger = Logger.getLogger(EmployeeController.class.getName());

    @RequestMapping(method = RequestMethod.GET, path = "/employees/{firstIndex}")
    public ResponseEntity<List<Employee>> getEmployees(@PathVariable() int firstIndex) {
        List<Employee> employees = new ArrayList<>(retrieveEmployees());
        logger.info("firstIndex: " + firstIndex);

        int lastIndex = firstIndex+2;
        int startIndex = firstIndex-1;
        if(lastIndex > employees.size()){
            lastIndex = employees.size();
        }

        if(startIndex < 0 || startIndex >= employees.size()){
            startIndex = 0;
        }

        List<Employee> subList = null;
        if(employees.size() >0){
            subList =employees.subList(startIndex, lastIndex);
        }else{
            subList = new ArrayList<>();
        }

        return ResponseEntity.ok(subList);
    }

    private Collection<Employee> retrieveEmployees() {
        Map<String, Employee> employeeMap = new LinkedHashMap<>();
        jdbcTemplate.query("select e.id,e.firstname,e.lastname,eh.age,eh.doj,eh.department,eh.salary,p.name from EMP e inner join EMP_HR eh on e.id =eh.id inner join EMP_PROJECT ep on e.id = ep.id inner join PROJECT p on\n" +
                "p.id = ep.project_id", resultSet -> {
            String empId = resultSet.getString("id");
            Employee employee = employeeMap.get(empId);
            if (null != employee) {
                employee.getProjects().add(resultSet.getString("name"));
            } else {
                employee = new Employee();
                employee.setEmpid(empId);
                employee.setFirstName(resultSet.getString("firstname"));
                employee.setLastName(resultSet.getString("lastname"));
                employee.setAge(resultSet.getInt("age"));
                employee.setDateOfJoining(resultSet.getDate("doj"));
                employee.setDepartment(resultSet.getString("department"));
                employee.setSalary(resultSet.getString("salary"));
                employee.getProjects().add(resultSet.getString("name"));
            }
            employeeMap.put(empId, employee);
        });
        return employeeMap.values();
    }

}
