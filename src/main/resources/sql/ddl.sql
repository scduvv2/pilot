alter table Product drop foreign key FK50C664CF2AC8144B;
alter table Product_ProductCategory drop foreign key FK1E4F837D4BF6FC89;
alter table Product_ProductCategory drop foreign key FK1E4F837D906AA64F;
alter table Product_Supplier drop foreign key FKBA8235CDC2426B0;
alter table Product_Supplier drop foreign key FKBA8235C4BF6FC89;
alter table Supplier drop foreign key FKA0B65DEC669036AB;
alter table Supplier drop foreign key FKA0B65DEC172E269;
alter table Supplier drop foreign key FKA0B65DECDCCA4D2B;
alter table Supplier drop foreign key FKA0B65DEC7080B723;
alter table Supplier_Email drop foreign key FKCE16FB69E799AF54;
alter table Supplier_Email drop foreign key FKCE16FB69474FCEEB;
alter table Supplier_Product drop foreign key FKF375BD7C8A9FA7F4;
alter table Supplier_Product drop foreign key FKF375BD7C474FCEEB;
drop table if exists Address;
drop table if exists Email;
drop table if exists Manufacturer;
drop table if exists PhoneNumber;
drop table if exists Product;
drop table if exists ProductCategory;
drop table if exists Product_ProductCategory;
drop table if exists Product_Supplier;
drop table if exists Supplier;
drop table if exists Supplier_Email;
drop table if exists Supplier_Product;
create table Address (id bigint not null auto_increment, addressLine1 varchar(255), addressLine2 varchar(255), city varchar(255), country varchar(255), state varchar(255), zipcode varchar(255), primary key (id)) ENGINE=InnoDB;
create table Email (id bigint not null auto_increment, email varchar(255), primary key (id)) ENGINE=InnoDB;
create table Manufacturer (id bigint not null auto_increment, name varchar(255), primary key (id)) ENGINE=InnoDB;
create table PhoneNumber (id bigint not null auto_increment, number bigint, primary key (id)) ENGINE=InnoDB;
create table Product (id bigint not null auto_increment, description varchar(255), name varchar(255), otherDetails varchar(255), sellingUnit varchar(255), unitPrice double precision, manufacturer_id bigint, primary key (id)) ENGINE=InnoDB;
create table ProductCategory (id bigint not null auto_increment, description varchar(255), name varchar(255), primary key (id)) ENGINE=InnoDB;
create table Product_ProductCategory (Product_id bigint not null, productCatagories_id bigint not null) ENGINE=InnoDB;
create table Product_Supplier (Product_id bigint not null, suppliers_id bigint not null) ENGINE=InnoDB;
create table Supplier (id bigint not null auto_increment, name varchar(255), otherDetails varchar(255), address_id bigint, alternatePhoneNumber_id bigint, primaryEmail_id bigint, primaryPhoneNumber_id bigint, primary key (id)) ENGINE=InnoDB;
create table Supplier_Email (Supplier_id bigint not null, alternateEmails_id bigint not null, unique (alternateEmails_id)) ENGINE=InnoDB;
create table Supplier_Product (Supplier_id bigint not null, products_id bigint not null) ENGINE=InnoDB;
alter table Product add index FK50C664CF2AC8144B (manufacturer_id), add constraint FK50C664CF2AC8144B foreign key (manufacturer_id) references Manufacturer (id);
alter table Product_ProductCategory add index FK1E4F837D4BF6FC89 (Product_id), add constraint FK1E4F837D4BF6FC89 foreign key (Product_id) references Product (id);
alter table Product_ProductCategory add index FK1E4F837D906AA64F (productCatagories_id), add constraint FK1E4F837D906AA64F foreign key (productCatagories_id) references ProductCategory (id);
alter table Product_Supplier add index FKBA8235CDC2426B0 (suppliers_id), add constraint FKBA8235CDC2426B0 foreign key (suppliers_id) references Supplier (id);
alter table Product_Supplier add index FKBA8235C4BF6FC89 (Product_id), add constraint FKBA8235C4BF6FC89 foreign key (Product_id) references Product (id);
alter table Supplier add index FKA0B65DEC669036AB (primaryPhoneNumber_id), add constraint FKA0B65DEC669036AB foreign key (primaryPhoneNumber_id) references PhoneNumber (id);
alter table Supplier add index FKA0B65DEC172E269 (address_id), add constraint FKA0B65DEC172E269 foreign key (address_id) references Address (id);
alter table Supplier add index FKA0B65DECDCCA4D2B (primaryEmail_id), add constraint FKA0B65DECDCCA4D2B foreign key (primaryEmail_id) references Email (id);
alter table Supplier add index FKA0B65DEC7080B723 (alternatePhoneNumber_id), add constraint FKA0B65DEC7080B723 foreign key (alternatePhoneNumber_id) references PhoneNumber (id);
alter table Supplier_Email add index FKCE16FB69E799AF54 (alternateEmails_id), add constraint FKCE16FB69E799AF54 foreign key (alternateEmails_id) references Email (id);
alter table Supplier_Email add index FKCE16FB69474FCEEB (Supplier_id), add constraint FKCE16FB69474FCEEB foreign key (Supplier_id) references Supplier (id);
alter table Supplier_Product add index FKF375BD7C8A9FA7F4 (products_id), add constraint FKF375BD7C8A9FA7F4 foreign key (products_id) references Product (id);
alter table Supplier_Product add index FKF375BD7C474FCEEB (Supplier_id), add constraint FKF375BD7C474FCEEB foreign key (Supplier_id) references Supplier (id);
