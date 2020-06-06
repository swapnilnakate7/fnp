import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  ENDPOINT = '/employees/';



  constructor(private http: HttpClient) { }

  getEmployees(index:number): Observable<any> {
    return this.http.get(environment.HOST + this.ENDPOINT + index);
  }
}
