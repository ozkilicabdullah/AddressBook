import { Injectable, OnInit } from "@angular/core";
import { Address } from '../Address';
import { RestService } from './rest.service';

@Injectable()
export class AddressRepository implements OnInit {

    private address: Address[] = [];
    constructor(private restService: RestService) {
        this.restService.getAddress().subscribe(data => {
            for(let key in data){
                this.address.push(data[key])
              }
        })
    }
    ngOnInit() {

    }
    getAddress(): Address[] {
        console.log(this.address,'11');
        return this.address;
    }
    getPersonAdress(personId: number): Address[] {
        return this.address.filter(i => i.personId == personId)
    }

    

}
