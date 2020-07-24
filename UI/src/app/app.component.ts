import { Component } from '@angular/core';
import { AddressRepository } from './Model/Repository/address.reposityoy';
import { Address } from './Model/Address';
import { HttpClient } from '@angular/common/http';
import { MatTableDataSource } from '@angular/material/table';
import { MessageService } from 'primeng/api';
import { Message } from 'primeng/api';
import { PhoneNumber } from './Model/PhoneNumber';
import { Person } from './Model/Person';
import { NumberType } from './Model/NumberType';
import { RestService } from './Model/Repository/rest.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],

  providers: [AddressRepository, MessageService]
})
export class AppComponent {
  baseUrl: String = "https://localhost:44367/address";
  //Message servis
  msgs: Message[] = [];
  // Material Table
  cols: any[];
  selectedAddress: Address;
  // Arrays
  Adreses: Address[] = []
  phoneNumbers: PhoneNumber[] = []
  persons: Person[] = [];
  numberTypes: NumberType[] = [];

  constructor(private http: HttpClient, private messageService: MessageService, private restService: RestService) {
    //Address List
    this.http.get("https://localhost:44367/address").subscribe(data => {

      for (let key in data) {
        this.Adreses.push(data[key])
      }
    })
    // Number Type List
    this.http.get("https://localhost:44367/numbertype").subscribe(data => {
      for (let key in data) {
        this.numberTypes.push(data[key])
      }
    })
    // Person List
    this.http.get("https://localhost:44367/person").subscribe(data => {
      for (let key in data) {
        this.persons.push(data[key])
      }
    })

  }
  ngOnInit() {
    //Table column
    this.cols = [
      { field: 'name', header: 'Name' },
      { field: 'lastName', header: 'Last Name' },
      { field: 'cityName', header: 'City' },
      { field: 'addressTitle', header: 'Address' }
    ];
  }

  getPhoneNumbersforPerson(personId: number) {
    this.phoneNumbers = [];
    this.http.get("https://localhost:44367/phonenumber/" + personId).subscribe(data => {
      for (let key in data) {
        this.phoneNumbers.push(data[key])
      }
    })
    console.log(personId)
  }

  display: boolean = false;
  showDialog(event) {
    this.getPhoneNumbersforPerson(event.data.personId)
    this.display = true;
  }
  selectedPersonValue = 1;
  selectPersons: any[] = [
    { value: '1', viewValue: 'Abdullah' },
    { value: '2', viewValue: 'Ahmet' },
    { value: '3', viewValue: 'Mehmet' }
  ]
  selectedNumberTypeValue = 1;

  selectNumberTypes: any[] = [
    { value: '1', viewValue: 'mobile' },
    { value: '2', viewValue: 'office' },

  ]
  toBeAddedNumber: number ;

  addPhoneNumber() {
    let data: any = {
      id: 0,
      personId: this.selectedPersonValue,
      numberTypeID: this.selectedNumberTypeValue,
      number: this.toBeAddedNumber
    }
    console.log(data, 'ekle');
    try {
    this.restService.addPhoneNumbers(data).subscribe();
      this.msgs = [];
      this.msgs.push({ severity: 'success', summary: 'Added Successful', });
    } catch{
      this.msgs = [];
      this.msgs.push({ severity: 'error', summary: 'Error occurred', });
    }


  }


}
