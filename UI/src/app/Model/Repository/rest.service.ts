import { Injectable } from "@angular/core";
import { HttpHeaders, HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { Person } from '../Person';
import { Address } from '../Address';
import { City } from '../City';
import { NumberType } from '../NumberType';
import { PhoneNumber } from '../PhoneNumber';
import { catchError, tap } from 'rxjs/operators';

@Injectable()
export class RestService {
    baseUrl: String = "https://localhost:44367/";
    httpOptions = {
        headers: new HttpHeaders({
            'Content-Type': 'application/json',
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "DELETE, POST, GET",
            "Access-Control-Allow-Headers": "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With",
            
            'Access-Control-Allow-Credentials': 'true',
        

        })
    };
    constructor(private http: HttpClient) {

    }


    getPerson():Observable<Person[]>{
        return this.http.get<Person[]>(this.baseUrl+"person").pipe();
    }

    getAddress():Observable<Address[]>{
        return this.http.get<Address[]>('https://localhost:44367/address').pipe(catchError(this.handleError));

    }
    getCtiy():Observable<City[]>{
        return this.http.get<City[]>(this.baseUrl+"city").pipe();

    }
    getNumberType():Observable<NumberType[]>{
        return this.http.get<NumberType[]>(this.baseUrl+"numbertype").pipe();

    }
    getPhoneNumbers():Observable<PhoneNumber[]>{
        return this.http.get<PhoneNumber[]>(this.baseUrl+"phonenumber").pipe();

    }

    addPhoneNumbers(phoneNumber:any):Observable<PhoneNumber>{
        return this.http.post<PhoneNumber>("https://localhost:44367/phonenumber",JSON.stringify(phoneNumber),this.httpOptions).pipe();
    }


    //Error Management
    handleError(err: HttpErrorResponse) {
        let errorMessage = '';
        if (err.error instanceof ErrorEvent) {
            errorMessage = 'Error occured ' + err.error.message;
        } else {
            errorMessage = ' Systematic error has occurred';
        }
        return throwError(errorMessage)
    }


}
