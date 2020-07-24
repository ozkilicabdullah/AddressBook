import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
// Angular Material
import {MatToolbarModule} from '@angular/material/toolbar'; 
import {MatIconModule} from '@angular/material/icon'; 


import {MatTableModule} from '@angular/material/table'; 
import { AddressRepository } from './Model/Repository/address.reposityoy';
import { RestService } from './Model/Repository/rest.service';
import {MessageModule} from 'primeng/message';
import {MessagesModule} from 'primeng/messages';
import { TableModule } from 'primeng/table';


import {MatListModule} from '@angular/material/list'; 

import {AccordionModule} from 'primeng/accordion';     
import {DialogModule} from 'primeng/dialog';
import {ListboxModule} from 'primeng/listbox';
import { AddAddressComponent } from './add-address/add-address.component';
import {DropdownModule} from 'primeng/dropdown';
import {RadioButtonModule} from 'primeng/radiobutton';
import {MatSelectModule} from '@angular/material/select'; 
import { FormsModule } from '@angular/forms';


import {MatInputModule} from '@angular/material/input'; 

import {InputTextModule} from 'primeng/inputtext';
import {MatButtonModule} from '@angular/material/button'; 
@NgModule({
  declarations: [
    AppComponent,
    AddAddressComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NoopAnimationsModule,
    HttpClientModule,
    BrowserModule,
    FormsModule,

    // Material
    MatToolbarModule,
    MatIconModule,
    MatTableModule,
    MatListModule,
    MatSelectModule,
    MatButtonModule,

    // PrimeNg
    MessageModule,
    MessagesModule,
    TableModule,
    AccordionModule,
    DialogModule,
    ListboxModule,
    DropdownModule,
    RadioButtonModule,
    MatInputModule,
    InputTextModule
    
  ],
  providers: [RestService ,AddressRepository],
  bootstrap: [AppComponent]
})
export class AppModule { }
