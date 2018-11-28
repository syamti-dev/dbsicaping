/*================================================================================*/
/* DDL SCRIPT                                                                     */
/*================================================================================*/
/*  Title    :                                                                    */
/*  FileName : bdIngresos2018.ecm                                                 */
/*  Platform : MySQL 5.6                                                          */
/*  Version  : Concept                                                            */
/*  Date     : miércoles, 28 de noviembre de 2018                                 */
/*================================================================================*/
/*================================================================================*/
/* CREATE TABLES                                                                  */
/*================================================================================*/

CREATE TABLE states (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR(200) NOT NULL,
  id_external VARCHAR(2) NOT NULL,
  capital VARCHAR(40),
  id_external_capital VARCHAR(10),
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_states PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN states.name
Nombre de la entidad
*/

/*
COMMENT ON COLUMN states.id_external
cve de la entidad
*/

/*
COMMENT ON COLUMN states.capital
capital
*/

/*
COMMENT ON COLUMN states.id_external_capital
cve de la capital
*/

CREATE TABLE municipalities (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_state INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  id_external VARCHAR(10) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_municipalities PRIMARY KEY (id)
);

CREATE TABLE localities (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_municipality INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  zipcode VARCHAR(8) NOT NULL,
  id_external VARCHAR(10) NOT NULL,
  latitude DOUBLE,
  longitude DOUBLE,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_localities PRIMARY KEY (id)
);

CREATE TABLE address (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_locality INTEGER NOT NULL,
  address VARCHAR(200) NOT NULL,
  colony VARCHAR(200),
  outdoor_number VARCHAR(20) NOT NULL,
  interior_number VARCHAR(20),
  zipcode VARCHAR(8) NOT NULL,
  latitude DOUBLE,
  longitude DOUBLE,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_address PRIMARY KEY (id)
);

CREATE TABLE areas (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR(200) NOT NULL,
  id_external VARCHAR(10) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_areas PRIMARY KEY (id)
);

CREATE TABLE banks (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR(100) NOT NULL,
  account VARCHAR(20) NOT NULL,
  accounting_account VARCHAR(21) NOT NULL,
  agreement VARCHAR(20),
  branch_office VARCHAR(40),
  nature CHAR(1) NOT NULL,
  movement CHAR(1) NOT NULL,
  creation_date TIMESTAMP NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_banks PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN banks.name
nombre del banco
*/

/*
COMMENT ON COLUMN banks.account
cuenta
*/

/*
COMMENT ON COLUMN banks.accounting_account
cuenta contable
*/

/*
COMMENT ON COLUMN banks.agreement
convenio
*/

/*
COMMENT ON COLUMN banks.nature
naturaleza
*/

/*
COMMENT ON COLUMN banks.movement
movimiento
*/

/*
COMMENT ON COLUMN banks.creation_date
fecha de creacion
*/

CREATE TABLE items (
  id INTEGER NOT NULL,
  code VARCHAR(5) NOT NULL,
  description VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_items PRIMARY KEY (id)
);

CREATE TABLE types (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_item INTEGER NOT NULL,
  code VARCHAR(5) NOT NULL,
  description VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_types PRIMARY KEY (id)
);

CREATE TABLE class (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_type INTEGER NOT NULL,
  code VARCHAR(5) NOT NULL,
  description VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_class PRIMARY KEY (id)
);

CREATE TABLE catalogs_funding_sources (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_base36 CHAR(2) NOT NULL,
  description VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_catalogs_funding_sources PRIMARY KEY (id)
);

CREATE TABLE catalogs_subfunding_sources (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_funding_source INTEGER NOT NULL,
  id_base36 CHAR(2) NOT NULL,
  description VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_catalogs_subfunding_sources PRIMARY KEY (id)
);

CREATE TABLE type_resources (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_base_36 CHAR(1) NOT NULL,
  description VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_type_resources PRIMARY KEY (id)
);

CREATE TABLE catalog_concepts (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_class INTEGER NOT NULL,
  id_base36 VARCHAR(5) NOT NULL,
  id_external VARCHAR(10) NOT NULL,
  year YEAR NOT NULL,
  id_funding_source INTEGER NOT NULL,
  id_type_resource INTEGER NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_catalog_concepts PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN catalog_concepts.id_base36
clave contable
*/

/*
COMMENT ON COLUMN catalog_concepts.id_external
cve concepto
*/

/*
COMMENT ON COLUMN catalog_concepts.year
año
*/

CREATE TABLE catalog_matrix_entry_income (
  cri VARCHAR(4) NOT NULL,
  name_cri VARCHAR(200) NOT NULL,
  charge VARCHAR(5),
  payment VARCHAR(5),
  account_charge VARCHAR(150),
  account_payment VARCHAR(150),
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_catalog_matrix_entry_income PRIMARY KEY (cri)
);

/*
COMMENT ON COLUMN catalog_matrix_entry_income.cri
clasificacador por rubro del ingreso
*/

/*
COMMENT ON COLUMN catalog_matrix_entry_income.charge
cargo
*/

/*
COMMENT ON COLUMN catalog_matrix_entry_income.payment
abono
*/

/*
COMMENT ON COLUMN catalog_matrix_entry_income.account_charge
cuenta cargo
*/

/*
COMMENT ON COLUMN catalog_matrix_entry_income.account_payment
cuenta abono
*/

CREATE TABLE types_officess (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR(200) NOT NULL,
  description VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_types_officess PRIMARY KEY (id)
);

CREATE TABLE entity_offices (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_type_office INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  id_external VARCHAR(10),
  id_base36 VARCHAR(2),
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_entity_offices PRIMARY KEY (id)
);

CREATE TABLE types_policy (
  id INTEGER AUTO_INCREMENT NOT NULL,
  description VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_types_policy PRIMARY KEY (id)
);

CREATE TABLE users (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_entity_office INTEGER NOT NULL,
  id_area INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  ine VARCHAR(20),
  rfc VARCHAR(15) NOT NULL,
  curp VARCHAR(20),
  login VARCHAR(20) NOT NULL,
  password VARCHAR(100) NOT NULL,
  registration_date TIMESTAMP NOT NULL,
  photo VARCHAR(255),
  telephone VARCHAR(20),
  cellphone VARCHAR(20),
  email VARCHAR(100),
  is_mobile BOOL NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_users PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN users.photo
codebase64
*/

/*
COMMENT ON COLUMN users.fdl
Flag delete
*/

/*
COMMENT ON COLUMN users.cbu
create by user
*/

/*
COMMENT ON COLUMN users.cat
create at timestamp
*/

/*
COMMENT ON COLUMN users.luu
last update user
*/

/*
COMMENT ON COLUMN users.uat
update at timestamp
*/

CREATE TABLE policies (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_type_policy INTEGER NOT NULL,
  id_user INTEGER NOT NULL,
  id_entity_office INTEGER NOT NULL,
  description VARCHAR(200) NOT NULL,
  amount DOUBLE NOT NULL,
  date_policy TIMESTAMP NOT NULL,
  id_external VARCHAR(10),
  status_poliza CHAR(1),
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_policies PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN policies.amount
importe total de la poliza del dia
*/

/*
COMMENT ON COLUMN policies.date_policy
fecha de la poliza
*/

/*
COMMENT ON COLUMN policies.id_external
poliza de otro sistema
*/

/*
COMMENT ON COLUMN policies.status_poliza
P= pendiente  T= Terminado
*/

CREATE TABLE detail_policies (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_policy INTEGER NOT NULL,
  description VARCHAR(200) NOT NULL,
  id_external VARCHAR(10) NOT NULL,
  accounting_account VARCHAR(21) NOT NULL,
  date_policy TIMESTAMP NOT NULL,
  amount DOUBLE NOT NULL,
  movement CHAR(1) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_detail_policies PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN detail_policies.id_external
cve del concepto
*/

/*
COMMENT ON COLUMN detail_policies.accounting_account
cuenta contable
*/

/*
COMMENT ON COLUMN detail_policies.date_policy
fecha del ingreso
*/

/*
COMMENT ON COLUMN detail_policies.movement
movimiento
*/

CREATE TABLE matrix_catalog_affectation (
  id INTEGER AUTO_INCREMENT NOT NULL,
  account_name VARCHAR(200) NOT NULL,
  accounting_account VARCHAR(5) NOT NULL,
  nature CHAR(40) NOT NULL,
  movement CHAR(40) NOT NULL,
  type_account CHAR(40) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_matrix_catalog_affectation PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN matrix_catalog_affectation.account_name
nombre de la cuenta
*/

/*
COMMENT ON COLUMN matrix_catalog_affectation.accounting_account
cuenta contable
*/

/*
COMMENT ON COLUMN matrix_catalog_affectation.nature
naturaleza
*/

/*
COMMENT ON COLUMN matrix_catalog_affectation.movement
movimiento
*/

/*
COMMENT ON COLUMN matrix_catalog_affectation.type_account
id_tipo de cuenta
*/

CREATE TABLE obligations (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_item INTEGER NOT NULL,
  description VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_obligations PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN obligations.id_item
id_rubro
*/

CREATE TABLE payment_forms (
  id INTEGER AUTO_INCREMENT NOT NULL,
  code_sat VARCHAR(2) NOT NULL,
  description VARCHAR(100) NOT NULL,
  concept VARCHAR(100) NOT NULL,
  basis VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_payment_forms PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN payment_forms.description
descripcion
*/

/*
COMMENT ON COLUMN payment_forms.concept
concepto
*/

/*
COMMENT ON COLUMN payment_forms.basis
fundamento
*/

CREATE TABLE payment_methods (
  id INTEGER NOT NULL,
  code_sat VARCHAR(3) NOT NULL,
  description VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_payment_methods PRIMARY KEY (id)
);

CREATE TABLE profiles (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR(150) NOT NULL,
  description VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_profiles PRIMARY KEY (id)
);

CREATE TABLE status_transaction (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR(100) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_status_transaction PRIMARY KEY (id)
);

CREATE TABLE transaction_h (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_user INTEGER NOT NULL,
  id_entity_office INTEGER NOT NULL,
  id_payment_method INTEGER NOT NULL,
  id_payment_form INTEGER NOT NULL,
  id_status_transaction INTEGER NOT NULL,
  transact_date TIMESTAMP NOT NULL,
  payment_date TIMESTAMP,
  bank_date TIMESTAMP,
  global_amount DOUBLE NOT NULL,
  pay_period VARCHAR(50) NOT NULL,
  note VARCHAR(200),
  leged VARCHAR(255),
  authorization VARCHAR(50),
  is_reference_global BOOL NOT NULL,
  folio VARCHAR(100),
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_transaction_h PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN transaction_h.transact_date
fecha de transaccion
*/

/*
COMMENT ON COLUMN transaction_h.payment_date
fecha de pago
*/

/*
COMMENT ON COLUMN transaction_h.bank_date
fecha de banco
*/

/*
COMMENT ON COLUMN transaction_h.authorization
numero de autorizacion
*/

/*
COMMENT ON COLUMN transaction_h.is_reference_global
cuando es una referencia global de movimientos
*/

CREATE TABLE reason_cancellation (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_transaction_h INTEGER NOT NULL,
  id_user INTEGER NOT NULL,
  reason VARCHAR(200) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_reason_cancellation PRIMARY KEY (id)
);

CREATE TABLE taxpayer_registry (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_address INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  type_person SMALLINT NOT NULL,
  ine VARCHAR(20),
  curp VARCHAR(20),
  rfc VARCHAR(15) NOT NULL,
  genere SMALLINT NOT NULL,
  telephone VARCHAR(20),
  cellphone VARCHAR(20),
  email VARCHAR(100),
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_taxpayer_registry PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN taxpayer_registry.type_person
1= fisica, 2= moral
*/

/*
COMMENT ON COLUMN taxpayer_registry.genere
genero 1= masculino, 2= Femenino
*/

CREATE TABLE taxpayer_obligations (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_taxpayer INTEGER NOT NULL,
  id_obligation INTEGER NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_taxpayer_obligations PRIMARY KEY (id)
);

CREATE TABLE transaction_detail (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_transaction_h INTEGER NOT NULL,
  id_user INTEGER NOT NULL,
  id_concept INTEGER NOT NULL,
  quanty SMALLINT NOT NULL,
  amount DOUBLE NOT NULL,
  is_discount BOOL NOT NULL,
  percentage DOUBLE NOT NULL,
  total_amount DOUBLE NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_transaction_detail PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN transaction_detail.amount
monto
*/

/*
COMMENT ON COLUMN transaction_detail.is_discount
por si existe algun descuento
*/

/*
COMMENT ON COLUMN transaction_detail.percentage
porcentage de descuento
*/

/*
COMMENT ON COLUMN transaction_detail.total_amount
monto total
*/

CREATE TABLE transaction_references (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_transaction_h INTEGER NOT NULL,
  id_bank INTEGER,
  id_user INTEGER NOT NULL,
  reference VARCHAR(50) NOT NULL,
  due_date VARCHAR(40) NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_transaction_references PRIMARY KEY (id)
);

/*
COMMENT ON COLUMN transaction_references.reference
referencia bancaria
*/

/*
COMMENT ON COLUMN transaction_references.due_date
fecha de vencimiento
*/

CREATE TABLE user_profiles (
  id INTEGER AUTO_INCREMENT NOT NULL,
  id_user INTEGER NOT NULL,
  id_profile INTEGER NOT NULL,
  fdl BOOL NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_user_profiles PRIMARY KEY (id)
);

/*================================================================================*/
/* CREATE FOREIGN KEYS                                                            */
/*================================================================================*/

ALTER TABLE municipalities
  ADD CONSTRAINT FK_municipalities_states
  FOREIGN KEY (id_state) REFERENCES states (id);

ALTER TABLE localities
  ADD CONSTRAINT FK_localities_municipalities
  FOREIGN KEY (id_municipality) REFERENCES municipalities (id);

ALTER TABLE address
  ADD CONSTRAINT FK_address_localities
  FOREIGN KEY (id_locality) REFERENCES localities (id);

ALTER TABLE types
  ADD CONSTRAINT FK_types_items
  FOREIGN KEY (id_item) REFERENCES items (id);

ALTER TABLE class
  ADD CONSTRAINT FK_class_types
  FOREIGN KEY (id_type) REFERENCES types (id);

ALTER TABLE catalogs_subfunding_sources
  ADD CONSTRAINT FK_catalogs_subfunding_sources_catalogs_funding_sources
  FOREIGN KEY (id_funding_source) REFERENCES catalogs_funding_sources (id);

ALTER TABLE catalog_concepts
  ADD CONSTRAINT FK_catalog_concepts_class
  FOREIGN KEY (id_class) REFERENCES class (id);

ALTER TABLE catalog_concepts
  ADD CONSTRAINT FK_catalog_concepts_catalogs_subfunding_sources
  FOREIGN KEY (id_funding_source) REFERENCES catalogs_subfunding_sources (id);

ALTER TABLE catalog_concepts
  ADD CONSTRAINT FK_catalog_concepts_type_resources
  FOREIGN KEY (id_type_resource) REFERENCES type_resources (id);

ALTER TABLE entity_offices
  ADD CONSTRAINT FK_entity_offices_types_officess
  FOREIGN KEY (id_type_office) REFERENCES types_officess (id);

ALTER TABLE users
  ADD CONSTRAINT FK_users_entity_offices
  FOREIGN KEY (id_entity_office) REFERENCES entity_offices (id);

ALTER TABLE users
  ADD CONSTRAINT FK_users_areas
  FOREIGN KEY (id_area) REFERENCES areas (id);

ALTER TABLE policies
  ADD CONSTRAINT FK_policies_types_policy
  FOREIGN KEY (id_type_policy) REFERENCES types_policy (id);

ALTER TABLE policies
  ADD CONSTRAINT FK_policies_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE policies
  ADD CONSTRAINT FK_policies_entity_offices
  FOREIGN KEY (id_entity_office) REFERENCES entity_offices (id);

ALTER TABLE detail_policies
  ADD CONSTRAINT FK_detai_policies_policies
  FOREIGN KEY (id_policy) REFERENCES policies (id);

ALTER TABLE obligations
  ADD CONSTRAINT FK_obligations_items
  FOREIGN KEY (id_item) REFERENCES items (id);

ALTER TABLE transaction_h
  ADD CONSTRAINT FK_transaction_header_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE transaction_h
  ADD CONSTRAINT FK_transaction_header_entity_offices
  FOREIGN KEY (id_entity_office) REFERENCES entity_offices (id);

ALTER TABLE transaction_h
  ADD CONSTRAINT FK_transaction_header_payment_methods
  FOREIGN KEY (id_payment_method) REFERENCES payment_methods (id);

ALTER TABLE transaction_h
  ADD CONSTRAINT FK_transaction_header_payment_forms
  FOREIGN KEY (id_payment_form) REFERENCES payment_forms (id);

ALTER TABLE transaction_h
  ADD CONSTRAINT FK_transaction_header_status_transaction
  FOREIGN KEY (id_status_transaction) REFERENCES status_transaction (id);

ALTER TABLE reason_cancellation
  ADD CONSTRAINT FK_reason_cancellation_transaction_h
  FOREIGN KEY (id_transaction_h) REFERENCES transaction_h (id);

ALTER TABLE reason_cancellation
  ADD CONSTRAINT FK_reason_cancellation_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE taxpayer_registry
  ADD CONSTRAINT FK_taxpayer_registry_address
  FOREIGN KEY (id_address) REFERENCES address (id);

ALTER TABLE taxpayer_obligations
  ADD CONSTRAINT FK_taxpayer_obligations_obligations
  FOREIGN KEY (id_obligation) REFERENCES obligations (id);

ALTER TABLE taxpayer_obligations
  ADD CONSTRAINT FK_taxpayer_obligations_taxpayer_registry
  FOREIGN KEY (id_taxpayer) REFERENCES taxpayer_registry (id);

ALTER TABLE transaction_detail
  ADD CONSTRAINT FK_transaction_detail_transaction_h
  FOREIGN KEY (id_transaction_h) REFERENCES transaction_h (id);

ALTER TABLE transaction_detail
  ADD CONSTRAINT FK_transaction_detail_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE transaction_detail
  ADD CONSTRAINT FK_transaction_detail_catalog_concepts
  FOREIGN KEY (id_concept) REFERENCES catalog_concepts (id);

ALTER TABLE transaction_references
  ADD CONSTRAINT FK_transaction_references_transaction_header
  FOREIGN KEY (id_transaction_h) REFERENCES transaction_h (id);

ALTER TABLE transaction_references
  ADD CONSTRAINT FK_transaction_references_banks
  FOREIGN KEY (id_bank) REFERENCES banks (id);

ALTER TABLE transaction_references
  ADD CONSTRAINT FK_transaction_references_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE user_profiles
  ADD CONSTRAINT FK_user_profiles_profiles
  FOREIGN KEY (id_profile) REFERENCES profiles (id);

ALTER TABLE user_profiles
  ADD CONSTRAINT FK_user_profiles_users
  FOREIGN KEY (id_user) REFERENCES users (id);
