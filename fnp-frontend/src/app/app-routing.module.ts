import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EmployeeListComponent } from './components/employee-list/employee-list.component';
import { EmployeeResolver } from './guards/employee.resolver';
import { EmployeeComponent } from './components/employee/employee.component';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'employees/1' },
  {
    path: 'employees/:index', component: EmployeeListComponent,
    resolve: {
      data: EmployeeResolver
    }
  },
  { path: 'employee', component: EmployeeComponent },
  {
    path: '**', component: EmployeeListComponent
  }];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
