-- Created by Vertabelo (http://vertabelo.com)

-- tables
-- Table: account
CREATE TABLE account (
    account_id serial  NOT NULL,
    account_subgroup_id int  NOT NULL,
    company_id int  NOT NULL,
    account_code int  NOT NULL,
    account_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT account_pk PRIMARY KEY (account_id)
);

-- Table: account_category
CREATE TABLE account_category (
    account_category_id serial  NOT NULL,
    account_category_code int  NOT NULL,
    account_category_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT account_category_pk PRIMARY KEY (account_category_id)
);

-- Table: account_group
CREATE TABLE account_group (
    account_group_id serial  NOT NULL,
    company_id int  NOT NULL,
    account_category_id int  NOT NULL,
    account_group_code int  NOT NULL,
    account_group_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT account_group_pk PRIMARY KEY (account_group_id)
);

-- Table: account_subgroup
CREATE TABLE account_subgroup (
    account_subgroup_id serial  NOT NULL,
    account_group_id int  NOT NULL,
    company_id int  NOT NULL,
    account_subgroup_code int  NOT NULL,
    account_subgroup_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT account_subgroup_pk PRIMARY KEY (account_subgroup_id)
);

-- Table: accountant
CREATE TABLE accountant (
    accountant_id serial  NOT NULL,
    kc_uuid varchar(50)  NOT NULL,
    accountant_name varchar(100)  NOT NULL,
    s3_profile_picture int  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT accountant_pk PRIMARY KEY (accountant_id)
);

-- Table: accounting_assistant
CREATE TABLE accounting_assistant (
    accounting_assistant_id serial  NOT NULL,
    kc_uuid varchar(50)  NOT NULL,
    assistant_name varchar(100)  NOT NULL,
    s3_profile_picture int  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT accounting_assistant_pk PRIMARY KEY (accounting_assistant_id)
);

-- Table: attachment
CREATE TABLE attachment (
    attachment_id serial  NOT NULL,
    company_id int  NOT NULL,
    content_type varchar(50)  NOT NULL,
    filename varchar(255)  NOT NULL,
    file_data bytea  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT attachment_pk PRIMARY KEY (attachment_id)
);

-- Table: business_entity
CREATE TABLE business_entity (
    business_entity_id serial  NOT NULL,
    business_entity_name varchar(100)  NOT NULL,
    description varchar(255)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT business_entity_pk PRIMARY KEY (business_entity_id)
);

-- Table: client
CREATE TABLE client (
    client_id serial  NOT NULL,
    kc_uuid varchar(50)  NOT NULL,
    client_name varchar(100)  NOT NULL,
    s3_profile_picture int  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (client_id)
);

-- Table: company
CREATE TABLE company (
    company_id serial  NOT NULL,
    industry_id int  NOT NULL,
    business_entity_id int  NOT NULL,
    accountant_id int  NOT NULL,
    company_name varchar(100)  NOT NULL,
    company_nit varchar(50)  NOT NULL,
    company_address varchar(255)  NOT NULL,
    phone_number varchar(50)  NOT NULL,
    s3_company_logo int  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT company_pk PRIMARY KEY (company_id)
);

-- Table: company_accounting_assistant
CREATE TABLE company_accounting_assistant (
    company_id int  NOT NULL,
    aaccounting_assistant_id int  NOT NULL,
    CONSTRAINT company_accounting_assistant_pk PRIMARY KEY (company_id,aaccounting_assistant_id)
);

-- Table: company_client
CREATE TABLE company_client (
    company_id int  NOT NULL,
    client_id int  NOT NULL,
    CONSTRAINT company_client_pk PRIMARY KEY (company_id,client_id)
);

-- Table: company_tax
CREATE TABLE company_tax (
    susubaccount_id int  NOT NULL,
    tax_id int  NOT NULL,
    CONSTRAINT company_tax_pk PRIMARY KEY (susubaccount_id,tax_id)
);

-- Table: currency_type
CREATE TABLE currency_type (
    currency_type_id serial  NOT NULL,
    currency_code varchar(50)  NOT NULL,
    currency_name varchar(50)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT currency_type_pk PRIMARY KEY (currency_type_id)
);

-- Table: document_type
CREATE TABLE document_type (
    document_type_id serial  NOT NULL,
    document_type_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
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
    CONSTRAINT exchange_rate_pk PRIMARY KEY (exchange_rate_id)
);

-- Table: industry
CREATE TABLE industry (
    industry_id serial  NOT NULL,
    industry_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT industry_pk PRIMARY KEY (industry_id)
);

-- Table: journal_entry
CREATE TABLE journal_entry (
    journal_entry_id serial  NOT NULL,
    company_id int  NOT NULL,
    document_type_id int  NOT NULL,
    journal_entry_number int  NOT NULL,
    entry_date timestamp  NOT NULL,
    gloss varchar(255)  NOT NULL,
    journal_entry_accepted boolean  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT journal_entry_pk PRIMARY KEY (journal_entry_id)
);

-- Table: report
CREATE TABLE report (
    report_id serial  NOT NULL,
    company_id int  NOT NULL,
    report_type_id int  NOT NULL,
    currency_type_id int  NOT NULL,
    atattachment_id int  NOT NULL,
    kc_uuid varchar(100)  NOT NULL,
    ledger_date timestamp  NOT NULL,
    period_start_date date  NOT NULL,
    period_end_date date  NOT NULL,
    description varchar(255)  NOT NULL,
    is_finantial_statement boolean  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT report_pk PRIMARY KEY (report_id)
);

-- Table: report_type
CREATE TABLE report_type (
    report_type_id serial  NOT NULL,
    report_name varchar(50)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT report_type_pk PRIMARY KEY (report_type_id)
);

-- Table: s3_object
CREATE TABLE s3_object (
    s3_object_id serial  NOT NULL,
    content_type varchar(50)  NOT NULL,
    bucket varchar(50)  NOT NULL,
    filename varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT s3_object_pk PRIMARY KEY (s3_object_id)
);

-- Table: subaccount
CREATE TABLE subaccount (
    subaccount_id serial  NOT NULL,
    account_id int  NOT NULL,
    company_id int  NOT NULL,
    subacount_code int  NOT NULL,
    subaccount_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT subaccount_pk PRIMARY KEY (subaccount_id)
);

-- Table: tax
CREATE TABLE tax (
    tax_id serial  NOT NULL,
    year int  NOT NULL,
    tax_percentage decimal(5,2)  NOT NULL,
    tax_name varchar(100)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT tax_pk PRIMARY KEY (tax_id)
);

-- Table: transaction
CREATE TABLE transaction (
    transaction_id serial  NOT NULL,
    journal_entry_id int  NOT NULL,
    transaction_date date  NOT NULL,
    description varchar(255)  NOT NULL,
    status boolean  NOT NULL,
    CONSTRAINT transaction_pk PRIMARY KEY (transaction_id)
);

-- Table: transaction_attachment
CREATE TABLE transaction_attachment (
    transaction_id int  NOT NULL,
    attachment_id int  NOT NULL,
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
    CONSTRAINT transaction_detail_pk PRIMARY KEY (transaction_detail_id)
);

-- foreign keys
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

-- Reference: company_accountant (table: company)
ALTER TABLE company ADD CONSTRAINT company_accountant
    FOREIGN KEY (accountant_id)
    REFERENCES accountant (accountant_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: company_accounting_assistant_accounting_assistant (table: company_accounting_assistant)
ALTER TABLE company_accounting_assistant ADD CONSTRAINT company_accounting_assistant_accounting_assistant
    FOREIGN KEY (aaccounting_assistant_id)
    REFERENCES accounting_assistant (accounting_assistant_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: company_accounting_assistant_company (table: company_accounting_assistant)
ALTER TABLE company_accounting_assistant ADD CONSTRAINT company_accounting_assistant_company
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

-- Reference: company_client_client (table: company_client)
ALTER TABLE company_client ADD CONSTRAINT company_client_client
    FOREIGN KEY (client_id)
    REFERENCES client (client_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: company_client_company (table: company_client)
ALTER TABLE company_client ADD CONSTRAINT company_client_company
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)  
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

-- Reference: company_tax_subaccount (table: company_tax)
ALTER TABLE company_tax ADD CONSTRAINT company_tax_subaccount
    FOREIGN KEY (susubaccount_id)
    REFERENCES subaccount (subaccount_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: company_tax_tax (table: company_tax)
ALTER TABLE company_tax ADD CONSTRAINT company_tax_tax
    FOREIGN KEY (tax_id)
    REFERENCES tax (tax_id)  
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

