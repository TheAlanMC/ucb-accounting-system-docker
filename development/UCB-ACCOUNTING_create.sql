-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-03 15:40:49.589

-- tables
-- Table: account
CREATE TABLE account (
    account_id serial  NOT NULL,
    account_subgroup_id int  NOT NULL,
    company_id int  NOT NULL,
    account_code int  NOT NULL,
    account_name varchar(100)  NOT NULL,
    is_editable boolean  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT account_pk PRIMARY KEY (account_id)
);

-- Table: account_category
CREATE TABLE account_category (
    account_category_id serial  NOT NULL,
    account_category_code int  NOT NULL,
    account_category_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT account_category_pk PRIMARY KEY (account_category_id)
);

-- Table: account_group
CREATE TABLE account_group (
    account_group_id serial  NOT NULL,
    company_id int  NOT NULL,
    account_category_id int  NOT NULL,
    account_group_code int  NOT NULL,
    account_group_name varchar(100)  NOT NULL,
    is_editable boolean  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT account_group_pk PRIMARY KEY (account_group_id)
);

-- Table: account_subgroup
CREATE TABLE account_subgroup (
    account_subgroup_id serial  NOT NULL,
    account_group_id int  NOT NULL,
    company_id int  NOT NULL,
    account_subgroup_code int  NOT NULL,
    account_subgroup_name varchar(100)  NOT NULL,
    is_editable boolean  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT account_subgroup_pk PRIMARY KEY (account_subgroup_id)
);

-- Table: attachment
CREATE TABLE attachment (
    attachment_id serial  NOT NULL,
    company_id int  NOT NULL,
    content_type varchar(50)  NOT NULL,
    filename varchar(255)  NOT NULL,
    file_data bytea  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT attachment_pk PRIMARY KEY (attachment_id)
);

-- Table: business_entity
CREATE TABLE business_entity (
    business_entity_id serial  NOT NULL,
    business_entity_name varchar(100)  NOT NULL,
    description varchar(255)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT business_entity_pk PRIMARY KEY (business_entity_id)
);

-- Table: company
CREATE TABLE company (
    company_id serial  NOT NULL,
    industry_id int  NOT NULL,
    business_entity_id int  NOT NULL,
    company_name varchar(100)  NOT NULL,
    company_nit varchar(50)  NOT NULL,
    company_address varchar(255)  NOT NULL,
    phone_number varchar(50)  NOT NULL,
    s3_company_logo int  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT company_pk PRIMARY KEY (company_id)
);

-- Table: currency_type
CREATE TABLE currency_type (
    currency_type_id serial  NOT NULL,
    currency_code varchar(50)  NOT NULL,
    currency_name varchar(50)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT currency_type_pk PRIMARY KEY (currency_type_id)
);

-- Table: customer
CREATE TABLE customer (
    customer_id serial  NOT NULL,
    company_id int  NOT NULL,
    subaccount_id int  NOT NULL,
    prefix varchar(50)  NOT NULL,
    display_name varchar(100)  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    company_name varchar(100)  NOT NULL,
    company_email varchar(50)  NOT NULL,
    company_phone_number varchar(50)  NOT NULL,
    company_address varchar(255)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);

-- Table: document_type
CREATE TABLE document_type (
    document_type_id serial  NOT NULL,
    document_type_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT document_type_pk PRIMARY KEY (document_type_id)
);

-- Table: exchange_rate
CREATE TABLE exchange_rate (
    exchange_rate_id serial  NOT NULL,
    company_id int  NOT NULL,
    currency_from varchar(50)  NOT NULL,
    currency_to varchar(50)  NOT NULL,
    rate decimal(10,6)  NOT NULL,
    exchange_month int  NOT NULL,
    exchange_year int  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT exchange_rate_pk PRIMARY KEY (exchange_rate_id)
);

-- Table: expense_transaction
CREATE TABLE expense_transaction (
    expense_transaction_id serial  NOT NULL,
    transaction_type_id int  NOT NULL,
    journal_entry_id int  NOT NULL,
    company_id int  NOT NULL,
    supplier_id int  NOT NULL,
    subaccount_id int  NOT NULL,
    expense_transaction_number int  NOT NULL,
    expense_transaction_date date  NOT NULL,
    description varchar(255)  NOT NULL,
    gloss varchar(255)  NOT NULL,
    expense_transaction_accepted boolean  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    payment_type_payment_type_id int  NOT NULL,
    CONSTRAINT expense_transaction_pk PRIMARY KEY (expense_transaction_id)
);

-- Table: expense_transaction_detail
CREATE TABLE expense_transaction_detail (
    expense_transaction_detail_id serial  NOT NULL,
    expense_transaction_id int  NOT NULL,
    subaccount_id int  NOT NULL,
    quantity int  NOT NULL,
    unit_price_bs money  NOT NULL,
    amount_bs money  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT expense_transaction_detail_pk PRIMARY KEY (expense_transaction_detail_id)
);

-- Table: industry
CREATE TABLE industry (
    industry_id serial  NOT NULL,
    industry_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT industry_pk PRIMARY KEY (industry_id)
);

-- Table: journal_entry
CREATE TABLE journal_entry (
    journal_entry_id serial  NOT NULL,
    company_id int  NOT NULL,
    document_type_id int  NOT NULL,
    journal_entry_number int  NOT NULL,
    gloss varchar(255)  NOT NULL,
    journal_entry_accepted boolean  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT journal_entry_pk PRIMARY KEY (journal_entry_id)
);

-- Table: kc_group
CREATE TABLE kc_group (
    kc_group_id serial  NOT NULL,
    kc_group_name varchar(50)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT kc_group_pk PRIMARY KEY (kc_group_id)
);

-- Table: kc_user
CREATE TABLE kc_user (
    kc_uuid varchar(50)  NOT NULL,
    s3_profile_picture int  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT kc_user_pk PRIMARY KEY (kc_uuid)
);

-- Table: kc_user_company
CREATE TABLE kc_user_company (
    kc_uuid varchar(50)  NOT NULL,
    company_id int  NOT NULL,
    kc_group_id int  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT kc_user_company_pk PRIMARY KEY (kc_uuid,company_id)
);

-- Table: payment_type
CREATE TABLE payment_type (
    payment_type_id serial  NOT NULL,
    payment_type_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT payment_type_pk PRIMARY KEY (payment_type_id)
);

-- Table: report
CREATE TABLE report (
    report_id serial  NOT NULL,
    company_id int  NOT NULL,
    report_type_id int  NOT NULL,
    currency_type_id int  NOT NULL,
    atattachment_id int  NOT NULL,
    period_start_date date  NOT NULL,
    period_end_date date  NOT NULL,
    description varchar(255)  NOT NULL,
    is_finantial_statement boolean  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT report_pk PRIMARY KEY (report_id)
);

-- Table: report_type
CREATE TABLE report_type (
    report_type_id serial  NOT NULL,
    report_name varchar(50)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT report_type_pk PRIMARY KEY (report_type_id)
);

-- Table: s3_object
CREATE TABLE s3_object (
    s3_object_id serial  NOT NULL,
    content_type varchar(50)  NOT NULL,
    bucket varchar(50)  NOT NULL,
    filename varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT s3_object_pk PRIMARY KEY (s3_object_id)
);

-- Table: sale_transaction
CREATE TABLE sale_transaction (
    sale_transaction_id serial  NOT NULL,
    transaction_type_id int  NOT NULL,
    payment_type_id int  NOT NULL,
    journal_entry_id int  NOT NULL,
    company_id int  NOT NULL,
    customer_id int  NOT NULL,
    subaccount_id int  NOT NULL,
    sale_transaction_number int  NOT NULL,
    sale_transaction_date date  NOT NULL,
    description varchar(255)  NOT NULL,
    gloss varchar(255)  NOT NULL,
    sale_transaction_accepted boolean  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT sale_transaction_pk PRIMARY KEY (sale_transaction_id)
);

-- Table: sale_transaction_detail
CREATE TABLE sale_transaction_detail (
    sale_transaction_detail_id serial  NOT NULL,
    sale_transaction_id int  NOT NULL,
    subaccount_id int  NOT NULL,
    quantity int  NOT NULL,
    unit_price_bs money  NOT NULL,
    amount_bs money  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT sale_transaction_detail_pk PRIMARY KEY (sale_transaction_detail_id)
);

-- Table: subaccount
CREATE TABLE subaccount (
    subaccount_id serial  NOT NULL,
    account_id int  NOT NULL,
    company_id int  NOT NULL,
    subaccount_code int  NOT NULL,
    subaccount_name varchar(100)  NOT NULL,
    is_editable boolean  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT subaccount_pk PRIMARY KEY (subaccount_id)
);

-- Table: subaccount_tax_type
CREATE TABLE subaccount_tax_type (
    tax_type_id int  NOT NULL,
    subaccount_id int  NOT NULL,
    company_id int  NOT NULL,
    tax_rate decimal(5,2)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT subaccount_tax_type_pk PRIMARY KEY (tax_type_id,subaccount_id)
);

-- Table: supplier
CREATE TABLE supplier (
    supplier_id serial  NOT NULL,
    company_id int  NOT NULL,
    subaccount_id int  NOT NULL,
    prefix varchar(500)  NOT NULL,
    display_name varchar(100)  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    company_name varchar(100)  NOT NULL,
    company_email varchar(50)  NOT NULL,
    company_phone_number varchar(50)  NOT NULL,
    company_address varchar(255)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (supplier_id)
);

-- Table: tax_type
CREATE TABLE tax_type (
    tax_type_id serial  NOT NULL,
    tax_type_name varchar(100)  NOT NULL,
    description varchar(255)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT tax_type_pk PRIMARY KEY (tax_type_id)
);

-- Table: transaction
CREATE TABLE transaction (
    transaction_id serial  NOT NULL,
    journal_entry_id int  NOT NULL,
    transaction_date date  NOT NULL,
    description varchar(255)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT transaction_pk PRIMARY KEY (transaction_id)
);

-- Table: transaction_attachment
CREATE TABLE transaction_attachment (
    transaction_id int  NOT NULL,
    attachment_id int  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT transaction_attachment_pk PRIMARY KEY (transaction_id,attachment_id)
);

-- Table: transaction_detail
CREATE TABLE transaction_detail (
    transaction_detail_id serial  NOT NULL,
    transaction_id int  NOT NULL,
    subaccount_id int  NOT NULL,
    debit_amount_bs money  NOT NULL,
    credit_amount_bs money  NOT NULL,
    debit_amount_usd money  NOT NULL,
    credit_amount_usd money  NOT NULL,
    debit_amount_ufv decimal(15,5)  NOT NULL,
    credit_amount_ufv decimal(15,5)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT transaction_detail_pk PRIMARY KEY (transaction_detail_id)
);

-- Table: transaction_type
CREATE TABLE transaction_type (
    transaction_type_id serial  NOT NULL,
    transaction_type_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user varchar(50)  NOT NULL,
    tx_host varchar(50)  NOT NULL,
    CONSTRAINT transaction_type_pk PRIMARY KEY (transaction_type_id)
);

-- foreign keys
-- Reference: Table_40_company (table: kc_user_company)
ALTER TABLE kc_user_company ADD CONSTRAINT Table_40_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Table_40_user (table: kc_user_company)
ALTER TABLE kc_user_company ADD CONSTRAINT Table_40_user
    FOREIGN KEY (kc_uuid)
    REFERENCES kc_user (kc_uuid)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: account_account_subgroup (table: account)
ALTER TABLE account ADD CONSTRAINT account_account_subgroup
    FOREIGN KEY (account_subgroup_id)
    REFERENCES account_subgroup (account_subgroup_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: account_company (table: account)
ALTER TABLE account ADD CONSTRAINT account_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: account_group_account_category (table: account_group)
ALTER TABLE account_group ADD CONSTRAINT account_group_account_category
    FOREIGN KEY (account_category_id)
    REFERENCES account_category (account_category_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: account_group_company (table: account_group)
ALTER TABLE account_group ADD CONSTRAINT account_group_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: account_subgroup_account_group (table: account_subgroup)
ALTER TABLE account_subgroup ADD CONSTRAINT account_subgroup_account_group
    FOREIGN KEY (account_group_id)
    REFERENCES account_group (account_group_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: account_subgroup_company (table: account_subgroup)
ALTER TABLE account_subgroup ADD CONSTRAINT account_subgroup_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: attachment_company (table: attachment)
ALTER TABLE attachment ADD CONSTRAINT attachment_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: company_business_entity (table: company)
ALTER TABLE company ADD CONSTRAINT company_business_entity
    FOREIGN KEY (business_entity_id)
    REFERENCES business_entity (business_entity_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: company_industry (table: company)
ALTER TABLE company ADD CONSTRAINT company_industry
    FOREIGN KEY (industry_id)
    REFERENCES industry (industry_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: customer_company (table: customer)
ALTER TABLE customer ADD CONSTRAINT customer_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: customer_subaccount (table: customer)
ALTER TABLE customer ADD CONSTRAINT customer_subaccount
    FOREIGN KEY (subaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: exchange_rate_company (table: exchange_rate)
ALTER TABLE exchange_rate ADD CONSTRAINT exchange_rate_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: expense_transaction_company (table: expense_transaction)
ALTER TABLE expense_transaction ADD CONSTRAINT expense_transaction_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: expense_transaction_detail_expense_transaction (table: expense_transaction_detail)
ALTER TABLE expense_transaction_detail ADD CONSTRAINT expense_transaction_detail_expense_transaction
    FOREIGN KEY (expense_transaction_id)
    REFERENCES expense_transaction (expense_transaction_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: expense_transaction_detail_subaccount (table: expense_transaction_detail)
ALTER TABLE expense_transaction_detail ADD CONSTRAINT expense_transaction_detail_subaccount
    FOREIGN KEY (subaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: expense_transaction_journal_entry (table: expense_transaction)
ALTER TABLE expense_transaction ADD CONSTRAINT expense_transaction_journal_entry
    FOREIGN KEY (journal_entry_id)
    REFERENCES journal_entry (journal_entry_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: expense_transaction_payment_type (table: expense_transaction)
ALTER TABLE expense_transaction ADD CONSTRAINT expense_transaction_payment_type
    FOREIGN KEY (payment_type_payment_type_id)
    REFERENCES payment_type (payment_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: expense_transaction_subaccount (table: expense_transaction)
ALTER TABLE expense_transaction ADD CONSTRAINT expense_transaction_subaccount
    FOREIGN KEY (subaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: expense_transaction_supplier (table: expense_transaction)
ALTER TABLE expense_transaction ADD CONSTRAINT expense_transaction_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES supplier (supplier_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: expense_transaction_transaction_type (table: expense_transaction)
ALTER TABLE expense_transaction ADD CONSTRAINT expense_transaction_transaction_type
    FOREIGN KEY (transaction_type_id)
    REFERENCES transaction_type (transaction_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: journal_entry_company (table: journal_entry)
ALTER TABLE journal_entry ADD CONSTRAINT journal_entry_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: journal_entry_document_type (table: journal_entry)
ALTER TABLE journal_entry ADD CONSTRAINT journal_entry_document_type
    FOREIGN KEY (document_type_id)
    REFERENCES document_type (document_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: kc_user_company_kc_group (table: kc_user_company)
ALTER TABLE kc_user_company ADD CONSTRAINT kc_user_company_kc_group
    FOREIGN KEY (kc_group_id)
    REFERENCES kc_group (kc_group_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ledger_entry_company (table: report)
ALTER TABLE report ADD CONSTRAINT ledger_entry_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ledger_report_attachment (table: report)
ALTER TABLE report ADD CONSTRAINT ledger_report_attachment
    FOREIGN KEY (atattachment_id)
    REFERENCES attachment (attachment_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: report_currency_type (table: report)
ALTER TABLE report ADD CONSTRAINT report_currency_type
    FOREIGN KEY (currency_type_id)
    REFERENCES currency_type (currency_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: report_report_type (table: report)
ALTER TABLE report ADD CONSTRAINT report_report_type
    FOREIGN KEY (report_type_id)
    REFERENCES report_type (report_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sale_transaction_company (table: sale_transaction)
ALTER TABLE sale_transaction ADD CONSTRAINT sale_transaction_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sale_transaction_customer (table: sale_transaction)
ALTER TABLE sale_transaction ADD CONSTRAINT sale_transaction_customer
    FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sale_transaction_detail_sale_transaction (table: sale_transaction_detail)
ALTER TABLE sale_transaction_detail ADD CONSTRAINT sale_transaction_detail_sale_transaction
    FOREIGN KEY (sale_transaction_id)
    REFERENCES sale_transaction (sale_transaction_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sale_transaction_detail_subaccount (table: sale_transaction_detail)
ALTER TABLE sale_transaction_detail ADD CONSTRAINT sale_transaction_detail_subaccount
    FOREIGN KEY (subaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sale_transaction_journal_entry (table: sale_transaction)
ALTER TABLE sale_transaction ADD CONSTRAINT sale_transaction_journal_entry
    FOREIGN KEY (journal_entry_id)
    REFERENCES journal_entry (journal_entry_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sale_transaction_payment_type (table: sale_transaction)
ALTER TABLE sale_transaction ADD CONSTRAINT sale_transaction_payment_type
    FOREIGN KEY (payment_type_id)
    REFERENCES payment_type (payment_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sale_transaction_subaccount (table: sale_transaction)
ALTER TABLE sale_transaction ADD CONSTRAINT sale_transaction_subaccount
    FOREIGN KEY (subaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sale_transaction_transaction_type (table: sale_transaction)
ALTER TABLE sale_transaction ADD CONSTRAINT sale_transaction_transaction_type
    FOREIGN KEY (transaction_type_id)
    REFERENCES transaction_type (transaction_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sub_account_company (table: subaccount)
ALTER TABLE subaccount ADD CONSTRAINT sub_account_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: subaccount_account (table: subaccount)
ALTER TABLE subaccount ADD CONSTRAINT subaccount_account
    FOREIGN KEY (account_id)
    REFERENCES account (account_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: subaccount_tax_tax_type (table: subaccount_tax_type)
ALTER TABLE subaccount_tax_type ADD CONSTRAINT subaccount_tax_tax_type
    FOREIGN KEY (tax_type_id)
    REFERENCES tax_type (tax_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: subaccount_tax_type_company (table: subaccount_tax_type)
ALTER TABLE subaccount_tax_type ADD CONSTRAINT subaccount_tax_type_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: subaccount_tax_type_subaccount (table: subaccount_tax_type)
ALTER TABLE subaccount_tax_type ADD CONSTRAINT subaccount_tax_type_subaccount
    FOREIGN KEY (subaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: supplier_company (table: supplier)
ALTER TABLE supplier ADD CONSTRAINT supplier_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: supplier_subaccount (table: supplier)
ALTER TABLE supplier ADD CONSTRAINT supplier_subaccount
    FOREIGN KEY (subaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: transaction_attachment_attachment (table: transaction_attachment)
ALTER TABLE transaction_attachment ADD CONSTRAINT transaction_attachment_attachment
    FOREIGN KEY (attachment_id)
    REFERENCES attachment (attachment_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: transaction_attachment_transaction (table: transaction_attachment)
ALTER TABLE transaction_attachment ADD CONSTRAINT transaction_attachment_transaction
    FOREIGN KEY (transaction_id)
    REFERENCES transaction (transaction_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: transaction_detail_subaccount (table: transaction_detail)
ALTER TABLE transaction_detail ADD CONSTRAINT transaction_detail_subaccount
    FOREIGN KEY (subaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: transaction_detail_transaction (table: transaction_detail)
ALTER TABLE transaction_detail ADD CONSTRAINT transaction_detail_transaction
    FOREIGN KEY (transaction_id)
    REFERENCES transaction (transaction_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: transaction_journal_entry (table: transaction)
ALTER TABLE transaction ADD CONSTRAINT transaction_journal_entry
    FOREIGN KEY (journal_entry_id)
    REFERENCES journal_entry (journal_entry_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

-- Query Tool
INSERT INTO account_category (account_category_code, account_category_name, status, tx_date, tx_user, tx_host) 
VALUES
  (1, 'Activo', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
  (2, 'Pasivo', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
  (3, 'Patrimonio', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
  (4, 'Ingresos', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
  (5, 'Egresos', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

INSERT INTO business_entity (business_entity_name, description, status, tx_date, tx_user, tx_host)
VALUES
    ('Único comerciante', 'Individuo que opera su propio negocio y es responsable personalmente de todas las obligaciones y deudas comerciales.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Empresa', 'Entidad comercial independiente legalmente reconocida, separada de sus propietarios.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Sociedad colectiva', 'Negocio gestionado por dos o más personas con igual responsabilidad legal.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Cooperativa o empresa comercial', 'Colaboración empresarial para beneficio mutuo y reparto de ganancias.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Asociación u organización benéfica', 'Entidad sin fines de lucro dedicada a causas caritativas, educativas o filantrópicas.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Fideicomiso', 'Acuerdo fiduciario en el que un fiduciario administra activos en beneficio de otro.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Otro', 'Categoría para estructuras comerciales diversas y menos comunes.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

INSERT INTO document_type (document_type_name, status, tx_date, tx_user, tx_host)
VALUES
    ('Ingreso', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Egreso', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Traspaso', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

INSERT INTO industry (industry_name, status, tx_date, tx_user, tx_host)
VALUES
    ('Servicios de Alojamiento y Alimentación', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Servicios Administrativos y de Apoyo', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Servicios de Arte y Recreación', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Construcción/Constructor', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Educación y Formación', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Agricultura, Silvicultura y Pesca', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Servicios Financieros y Seguros', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Manufactura', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Salud Médica / Cuidado Comunitario', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Servicios Personales, Belleza, Bienestar y Otros', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Servicios Profesionales (por ejemplo, Legal, Contabilidad, Marketing, Consultoría)', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Operadores de Propiedades y Servicios Inmobiliarios', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Alquiler y Arriendo de Servicios (no Inmobiliarios)', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Reparación y Mantenimiento (Automotriz e Inmobiliario)', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Comercio Minorista (Alimentos y Bebidas)', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Comercio Minorista y Comercio Electrónico (No Alimentario)', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Servicios de Tecnología / Telecomunicaciones', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Trabajos de Oficios (por ejemplo, Plomero, Carpintero, Electricista)', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Transporte, Logística, Correo, Almacenamiento', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Comercio Mayorista', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Otra', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

INSERT INTO kc_group (kc_group_name, status, tx_date, tx_user, tx_host)
VALUES
    ('Contador', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Asistente contable', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Cliente', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

INSERT INTO payment_type (payment_type_name, status, tx_date, tx_user, tx_host)
VALUES
    ('Efectivo', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Transferencia', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Cheque', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Tarjeta crédito', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Tarjeta débito', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Domiciliación', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

INSERT INTO s3_object (content_type, bucket, filename, status, tx_date, tx_user, tx_host)
VALUES
    ('image/jpeg','pictures','09df7de-c336-4ec4-859c-2aa7417d7cf5.jpg', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

INSERT INTO tax_type (tax_type_name, description, status, tx_date, tx_user, tx_host)
VALUES
    ('RC IVA Dependientes', 'Impuesto al Valor Agregado (IVA) para comerciantes registrados como dependientes.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('RC IVA Independientes', 'Impuesto al Valor Agregado (IVA) para trabajadores independientes registrados.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Retenciones IT', 'Retenciones del Impuesto a las Transacciones (IT) en ciertas transacciones.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Retenciones IUE', 'Retenciones del Impuesto a las Utilidades de las Empresas (IUE) en transacciones comerciales específicas.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('IT por Pagar', 'Impuesto a las Transacciones pendiente de pago.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('IUE por Pagar', 'Impuesto a las Utilidades de las Empresas pendiente de pago.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Débito fiscal IVA', 'Impuesto al Valor Agregado (IVA) por las ventas de bienes o servicios gravados.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Crédito fiscal IVA', 'Crédito fiscal por el IVA pagado en compras de bienes y servicios gravados.', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');


INSERT INTO transaction_type (transaction_type_name, status, tx_date, tx_user, tx_host)
VALUES
    ('Factura', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
    ('Recibo', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');