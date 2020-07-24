import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Person } from '../Model/Person';
import { NumberType } from '../Model/NumberType';

@Component({
  selector: 'app-add-address',
  templateUrl: './add-address.component.html',
  styleUrls: ['./add-address.component.scss']
})
export class AddAddressComponent implements OnInit {

  persons:Person[]=[];
  numberTypes:NumberType[]=[];
  constructor(private http:HttpClient) { 
    this.http.get("https://localhost:44367/numbertype").subscribe(data=>{
      for(let key in data){
        this.numberTypes.push(data[key])
      }
    })
    this.http.get("https://localhost:44367/person").subscribe(data=>{
      for(let key in data){
        this.persons.push(data[key])
      }
    })
  }

  ngOnInit(): void {
  }

}
