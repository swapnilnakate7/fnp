import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot, RouterStateSnapshot, Router, ActivatedRoute } from '@angular/router';
import { EmployeeService } from 'src/app/shared/employee.service';

import { map, catchError } from 'rxjs/operators';
import { of, Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class EmployeeResolver implements Resolve<any> {
  constructor(private service: EmployeeService, private router: Router) { }
  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {


    let index = parseInt(route.params['index']);
    if (!index || isNaN(index)) {
      index = 0;
    }

    console.log('calling', index);
    return this.service.getEmployees(index);

  }

}
