import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { EmployeeService } from 'src/app/shared/employee.service';

@Component({
  selector: 'app-employee-list',
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.scss'],
  host: {
    class: 'empList'
  }
})
export class EmployeeListComponent implements OnInit {
  employees: any[] = [];

  constructor(private route: ActivatedRoute, private router: Router, private service: EmployeeService) { }

  ngOnInit(): void {

    this.route.data.subscribe(response => {
      this.employees = response.data;
    });
  }

  getNextEmployees() {
    console.log(this.route.snapshot.params['index']);
    let index = parseInt(this.route.snapshot.params['index']);


    if (index == undefined || isNaN(index)) {
      index = 0;
    } else {

      index = index + 3;
    }

    console.log("index", index);

    this.router.navigate(['employees', index]);

  }

}
