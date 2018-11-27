/*================================================================================*/
/* DDL SCRIPT                                                                     */
/*================================================================================*/
/*  Title    :                                                                    */
/*  FileName : dataBaseIngresos2018.ecm                                           */
/*  Platform : PostgreSQL 9.4                                                     */
/*  Version  : Concept                                                            */
/*  Date     : jueves, 27 de septiembre de 2018                                   */
/*================================================================================*/
/*================================================================================*/
/* CREATE TABLES                                                                  */
/*================================================================================*/

CREATE TABLE countrys (
  id SERIAL,
  id_external INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  abbreviation VARCHAR(50) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_countrys PRIMARY KEY (id)
);

CREATE TABLE states (
  id SERIAL,
  id1 INTEGER NOT NULL,
  id_external INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  abbreviation VARCHAR(50) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_states PRIMARY KEY (id)
);

COMMENT ON COLUMN states.id1 IS
'id del pais';

COMMENT ON COLUMN states.id_external IS
'id del catalogo de inegi';

COMMENT ON COLUMN states.abbreviation IS
'abreviatura';

CREATE TABLE municipalities (
  id SERIAL,
  id_state INTEGER NOT NULL,
  id_external VARCHAR(10) NOT NULL,
  name VARCHAR(200) NOT NULL,
  order INTEGER,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_municipalities PRIMARY KEY (id)
);

COMMENT ON COLUMN municipalities.id_external IS
'id del catalogo de inegi';

CREATE TABLE localities (
  id SERIAL,
  id_municipality INTEGER NOT NULL,
  id_external VARCHAR(10) NOT NULL,
  name VARCHAR(200) NOT NULL,
  zipcode VARCHAR(6) NOT NULL,
  order INTEGER NOT NULL,
  latitude DOUBLE PRECISION,
  longitude DOUBLE PRECISION,
  altitude DOUBLE PRECISION,
  zone VARCHAR(10) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_localities PRIMARY KEY (id)
);

COMMENT ON COLUMN localities.zone IS
'ambito Rural / Urbano';

CREATE TABLE address (
  id SERIAL,
  id_locality INTEGER NOT NULL,
  address VARCHAR(200) NOT NULL,
  colony VARCHAR(200),
  outdoor_number VARCHAR(40),
  interior_number VARCHAR(40),
  zipcode VARCHAR(6) NOT NULL,
  latitude DOUBLE PRECISION,
  lonitude DOUBLE PRECISION,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_address PRIMARY KEY (id)
);

COMMENT ON COLUMN address.address IS
'direccion';

COMMENT ON COLUMN address.outdoor_number IS
'numero exterior';

COMMENT ON COLUMN address.interior_number IS
'numero interior';

CREATE TABLE areas (
  id SERIAL,
  name VARCHAR(200) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_areas PRIMARY KEY (id)
);

CREATE TABLE banks (
  id SERIAL,
  name VARCHAR(100) NOT NULL,
  account VARCHAR(20) NOT NULL,
  accounting_account VARCHAR(21) NOT NULL,
  agreement VARCHAR(20),
  branch_office VARCHAR(40),
  nature CHAR(1) NOT NULL,
  movement CHAR(1) NOT NULL,
  creation_date TIMESTAMP NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_banks PRIMARY KEY (id)
);

COMMENT ON COLUMN banks.name IS
'nombre del banco';

COMMENT ON COLUMN banks.account IS
'cuenta';

COMMENT ON COLUMN banks.accounting_account IS
'cuenta contable';

COMMENT ON COLUMN banks.agreement IS
'convenio';

COMMENT ON COLUMN banks.branch_office IS
'sucursal';

COMMENT ON COLUMN banks.nature IS
'naturaleza';

COMMENT ON COLUMN banks.movement IS
'movimiento';

COMMENT ON COLUMN banks.creation_date IS
'fecha de alta';

CREATE TABLE entity_office (
  id SERIAL,
  id_type_office INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  id_external VARCHAR(50),
  id_base36 VARCHAR(2),
  active BOOLEAN NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_entity_office PRIMARY KEY (id)
);

COMMENT ON COLUMN entity_office.id_external IS
'key of the office';

CREATE TABLE users (
  id SERIAL,
  id_entity_office INTEGER NOT NULL,
  id_area INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  ine VARCHAR(20),
  rfc VARCHAR(15),
  curp VARCHAR(20),
  login VARCHAR(20) NOT NULL,
  password VARCHAR(100) NOT NULL,
  registration_date TIMESTAMP NOT NULL,
  photo BYTEA,
  telephone VARCHAR(20),
  cellphone VARCHAR(20),
  email VARCHAR(200),
  active BOOLEAN NOT NULL,
  is_mobile BOOLEAN NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_users PRIMARY KEY (id)
);

COMMENT ON COLUMN users.password IS
'algoritmo de encriptaciòn';

COMMENT ON COLUMN users.photo IS
'codebase64';

COMMENT ON COLUMN users.is_mobile IS
'si tiene acceso a la app movil';

COMMENT ON COLUMN users.fdl IS
'flag delete';

COMMENT ON COLUMN users.cbu IS
'create by user';

COMMENT ON COLUMN users.cat IS
'create at timestamp';

COMMENT ON COLUMN users.luu IS
'last update user';

COMMENT ON COLUMN users.uat IS
'uptae at timestamp';

CREATE TABLE taxpayer_registry (
  id SERIAL,
  id_user INTEGER NOT NULL,
  id_address INTEGER NOT NULL,
  name VARCHAR(200) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  type_person VARCHAR(10) NOT NULL,
  ine VARCHAR(20),
  curp VARCHAR(20),
  rfc VARCHAR(15),
  genere VARCHAR(15),
  telephone VARCHAR(20),
  cellphone VARCHAR(20),
  email VARCHAR(200),
  active BOOLEAN NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_taxpayer_registry PRIMARY KEY (id)
);

COMMENT ON COLUMN taxpayer_registry.type_person IS
'Fisica / Moral';

COMMENT ON COLUMN taxpayer_registry.genere IS
'Masculino / Femenino / NA';

COMMENT ON COLUMN taxpayer_registry.active IS
'si esta vivo ';

CREATE TABLE capam (
  id SERIAL,
  id_taxpayer INTEGER NOT NULL,
  id_address INTEGER[?DIMENSION?] NOT NULL,
  contract VARCHAR(20) NOT NULL,
  contract_date TIMESTAMP NOT NULL,
  type VARCHAR(20) NOT NULL,
  cost DOUBLE PRECISION,
  price DOUBLE PRECISION,
  observation VARCHAR(200) NOT NULL,
  is_reconnection BOOLEAN NOT NULL,
  is_paid BOOLEAN NOT NULL,
  active BOOLEAN NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_capam PRIMARY KEY (id)
);

COMMENT ON COLUMN capam.id_taxpayer IS
'id del contribuyente';

COMMENT ON COLUMN capam.id_address IS
'id de la direcciòn';

COMMENT ON COLUMN capam.contract IS
'contrato';

COMMENT ON COLUMN capam.contract_date IS
'fecha del contrato';

COMMENT ON COLUMN capam.type IS
'tipo';

COMMENT ON COLUMN capam.cost IS
'costo';

COMMENT ON COLUMN capam.price IS
'tarifa';

COMMENT ON COLUMN capam.observation IS
'observacion';

COMMENT ON COLUMN capam.is_reconnection IS
'reconexion';

COMMENT ON COLUMN capam.is_paid IS
'pagado';

COMMENT ON COLUMN capam.active IS
'activo';

CREATE TABLE catalog_concepts (
  id SERIAL,
  id_base36 VARCHAR(5) NOT NULL,
  description VARCHAR(200) NOT NULL,
  id_external VARCHAR(10),
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_catalog_concepts PRIMARY KEY (id)
);

CREATE TABLE type_catalog (
  id SERIAL,
  name VARCHAR(255),
  description VARCHAR(255),
  internal_code VARCHAR(100),
  CONSTRAINT PK_type_catalog PRIMARY KEY (id)
);

CREATE TABLE catalogs (
  id SERIAL,
  id_type INTEGER NOT NULL,
  name VARCHAR(255),
  description VARCHAR(255),
  number_order INTEGER,
  parent BIGINT,
  id_key INTEGER,
  internal_code VARCHAR(100),
  CONSTRAINT PK_catalogs PRIMARY KEY (id)
);

COMMENT ON COLUMN catalogs.id_key IS
'key of the concept';

CREATE TABLE obligations (
  id SERIAL,
  description VARCHAR(200) NOT NULL,
  status BOX NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_obligations PRIMARY KEY (id)
);

COMMENT ON COLUMN obligations.id IS
'id de la obligaciòn';

COMMENT ON COLUMN obligations.description IS
'Example: campam, predial, derechos, etc..';

CREATE TABLE informative_data (
  id SERIAL,
  id_obligation INTEGER[?DIMENSION?] NOT NULL,
  id_external VARCHAR(20) NOT NULL,
  description VARCHAR(200) NOT NULL,
  type VARCHAR(100) NOT NULL,
  unit_measure VARCHAR(100) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_informative_data PRIMARY KEY (id)
);

COMMENT ON COLUMN informative_data.id_external IS
'id del concepto o dato informativo';

COMMENT ON COLUMN informative_data.type IS
'tipo de concepto o dato informativo';

COMMENT ON COLUMN informative_data.unit_measure IS
'unidad de medida';

CREATE TABLE detail_capam (
  id SERIAL,
  id_campam INTEGER[?DIMENSION?] NOT NULL,
  id_data_informative INTEGER[?DIMENSION?] NOT NULL,
  data VARCHAR(100) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_detail_capam PRIMARY KEY (id)
);

CREATE TABLE types_offices (
  id SERIAL,
  name VARCHAR(200) NOT NULL,
  description VARCHAR(200) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_types_offices PRIMARY KEY (id)
);

CREATE TABLE infracciones (
  id SERIAL,
  CONSTRAINT PK_infracciones PRIMARY KEY (id)
);

CREATE TABLE obligation_concepts (
  id SERIAL,
  id_obligation INTEGER[?DIMENSION?] NOT NULL,
  id_concept INTEGER[?DIMENSION?] NOT NULL,
  active BOOLEAN NOT NULL,
  year SMALLINT NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_obligation_concepts PRIMARY KEY (id)
);

COMMENT ON COLUMN obligation_concepts.id_obligation IS
'id obligacion';

COMMENT ON COLUMN obligation_concepts.id_concept IS
'id concepto';

COMMENT ON COLUMN obligation_concepts.active IS
'activo';

COMMENT ON COLUMN obligation_concepts.year IS
'año fiscal';

CREATE TABLE payment_form (
  id SERIAL,
  code_sat VARCHAR(2) NOT NULL,
  description VARCHAR(100) NOT NULL,
  banked BOOLEAN,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_payment_form PRIMARY KEY (id)
);

COMMENT ON COLUMN payment_form.id IS
'formas de pago';

COMMENT ON COLUMN payment_form.code_sat IS
'c_formaPago';

COMMENT ON COLUMN payment_form.banked IS
'bancarizado';

CREATE TABLE payment_method (
  id SERIAL,
  code_sat VARCHAR(3) NOT NULL,
  description VARCHAR(100) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_payment_method PRIMARY KEY (id)
);

COMMENT ON COLUMN payment_method.id IS
'Metodo de pago';

COMMENT ON COLUMN payment_method.code_sat IS
'c_MetodoPago';

CREATE TABLE predial (
  id SERIAL,
  id_address INTEGER[?DIMENSION?] NOT NULL,
  id_taxpayer INTEGER[?DIMENSION?] NOT NULL,
  type_predio VARCHAR(10),
  rectificacion VARCHAR(50),
  folio VARCHAR(50),
  contrat_date TIMESTAMP,
  region VARCHAR(5),
  zona VARCHAR(5),
  sector VARCHAR(10),
  manzana VARCHAR(10),
  predio VARCHAR(40),
  edificio VARCHAR(40),
  unidad VARCHAR(40),
  escritura VARCHAR(40),
  fecha_escritura VARCHAR(40),
  volumen VARCHAR(40),
  partida VARCHAR(40),
  distrito VARCHAR(40),
  NEW_COLUMN1 VARCHAR(40),
  NEW_COLUMN2 VARCHAR(40),
  NEW_COLUMN3 VARCHAR(40),
  NEW_COLUMN4 VARCHAR(40),
  CONSTRAINT PK_predial PRIMARY KEY (id)
);

COMMENT ON COLUMN predial.id_address IS
'id direccion';

COMMENT ON COLUMN predial.id_taxpayer IS
'id contribuyente';

COMMENT ON COLUMN predial.type_predio IS
'Urbano / Rustico';

CREATE TABLE profiles (
  id SERIAL,
  name VARCHAR(200) NOT NULL,
  description VARCHAR(200),
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_profiles PRIMARY KEY (id)
);

CREATE TABLE status_transaction (
  id SERIAL,
  name VARCHAR(100) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_status_transaction PRIMARY KEY (id)
);

CREATE TABLE taxpayer_obligations (
  id SERIAL,
  id_taxpayer INTEGER NOT NULL,
  id_obligation INTEGER NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_taxpayer_obligations PRIMARY KEY (id)
);

COMMENT ON COLUMN taxpayer_obligations.id_taxpayer IS
'id_contribuyente';

CREATE TABLE transactions_header (
  id SERIAL,
  id_user INTEGER NOT NULL,
  id_taxpayer_obligation INTEGER NOT NULL,
  id_entiity_office INTEGER NOT NULL,
  id_payment_method INTEGER NOT NULL,
  id_payment_form INTEGER NOT NULL,
  id_status_transaction INTEGER NOT NULL,
  transact_date TIMESTAMP NOT NULL,
  payment_date TIMESTAMP,
  bank_date TIMESTAMP,
  global_amount DOUBLE PRECISION NOT NULL,
  pay_period VARCHAR(50),
  note VARCHAR(200),
  legend VARCHAR(250),
  authorization VARCHAR(50),
  is_reference_global BOOLEAN NOT NULL,
  folio VARCHAR(100),
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_transactions_header PRIMARY KEY (id)
);

COMMENT ON COLUMN transactions_header.id_taxpayer_obligation IS
'id de la obligacion del contribuyente';

COMMENT ON COLUMN transactions_header.id_entiity_office IS
'id de la oficina';

COMMENT ON COLUMN transactions_header.id_payment_method IS
'id metodo de pago sat';

COMMENT ON COLUMN transactions_header.id_payment_form IS
'id forma de pago sat';

COMMENT ON COLUMN transactions_header.id_status_transaction IS
'1=proceso, 2=pagado, 3=conciliado, 4= cancelado';

COMMENT ON COLUMN transactions_header.transact_date IS
'fecha del tramite';

COMMENT ON COLUMN transactions_header.payment_date IS
'fecha de pago';

COMMENT ON COLUMN transactions_header.bank_date IS
'fecha de banco';

COMMENT ON COLUMN transactions_header.global_amount IS
'importe global';

COMMENT ON COLUMN transactions_header.pay_period IS
'periodo de pago Mensual, Bimestral, Trimestral, Semenstral o Anual';

COMMENT ON COLUMN transactions_header.note IS
'nota informativa';

COMMENT ON COLUMN transactions_header.legend IS
'leyenda';

COMMENT ON COLUMN transactions_header.authorization IS
'numero de autorizacion';

COMMENT ON COLUMN transactions_header.is_reference_global IS
'bandera cuando es referencia global';

COMMENT ON COLUMN transactions_header.folio IS
'numero de folio del municipio';

CREATE TABLE reason_cancellation (
  id SERIAL,
  id_transaction_h INTEGER NOT NULL,
  id_user INTEGER NOT NULL,
  reason VARCHAR(200) NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_reason_cancellation PRIMARY KEY (id)
);

COMMENT ON COLUMN reason_cancellation.reason IS
'motivo de la cancelacion';

CREATE TABLE transaction_detail (
  id SERIAL,
  id_transaction_h INTEGER NOT NULL,
  id_concept INTEGER NOT NULL,
  id_user INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  amount DOUBLE PRECISION NOT NULL,
  is_discount BOOLEAN NOT NULL,
  percentage DOUBLE PRECISION,
  total_amount DOUBLE PRECISION NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_transaction_detail PRIMARY KEY (id)
);

COMMENT ON COLUMN transaction_detail.id_concept IS
'id del catalogo de conceptos';

COMMENT ON COLUMN transaction_detail.id_user IS
'id_usuario en caso de cancelacion o descuento';

COMMENT ON COLUMN transaction_detail.quantity IS
'cantidad';

COMMENT ON COLUMN transaction_detail.amount IS
'monto o importe';

COMMENT ON COLUMN transaction_detail.is_discount IS
'flag de descuento';

COMMENT ON COLUMN transaction_detail.percentage IS
'porcentaje';

COMMENT ON COLUMN transaction_detail.total_amount IS
'monto total';

CREATE TABLE transaction_references (
  id SERIAL,
  id_transaction_h INTEGER NOT NULL,
  id_bank INTEGER NOT NULL,
  reference VARCHAR(50) NOT NULL,
  due_date TIMESTAMP NOT NULL,
  status BOOLEAN NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_transaction_references PRIMARY KEY (id)
);

COMMENT ON COLUMN transaction_references.reference IS
'linea de captura o referencia bancaria';

COMMENT ON COLUMN transaction_references.due_date IS
'fecha de vencimiento';

COMMENT ON COLUMN transaction_references.status IS
'status true= pagada';

CREATE TABLE user_profile (
  id SERIAL,
  id_user INTEGER NOT NULL,
  id_profile INTEGER NOT NULL,
  fdl BOOLEAN NOT NULL,
  cbu INTEGER NOT NULL,
  cat TIMESTAMP NOT NULL,
  luu INTEGER NOT NULL,
  uat TIMESTAMP NOT NULL,
  CONSTRAINT PK_user_profile PRIMARY KEY (id)
);

/*================================================================================*/
/* CREATE FOREIGN KEYS                                                            */
/*================================================================================*/

ALTER TABLE states
  ADD CONSTRAINT FK_states_countrys
  FOREIGN KEY (id1) REFERENCES countrys (id);

ALTER TABLE municipalities
  ADD CONSTRAINT FK_municipality_states
  FOREIGN KEY (id_state) REFERENCES states (id);

ALTER TABLE localities
  ADD CONSTRAINT FK_locality_municipality
  FOREIGN KEY (id_municipality) REFERENCES municipalities (id);

ALTER TABLE address
  ADD CONSTRAINT FK_address_locality
  FOREIGN KEY (id_locality) REFERENCES localities (id);

ALTER TABLE entity_office
  ADD CONSTRAINT FK_entity_office_types_offices
  FOREIGN KEY (id_type_office) REFERENCES types_offices (id);

ALTER TABLE users
  ADD CONSTRAINT FK_users_entity_office
  FOREIGN KEY (id_entity_office) REFERENCES entity_office (id);

ALTER TABLE users
  ADD CONSTRAINT FK_users_areas
  FOREIGN KEY (id_area) REFERENCES areas (id);

ALTER TABLE taxpayer_registry
  ADD CONSTRAINT FK_taxpayer_registry_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE taxpayer_registry
  ADD CONSTRAINT FK_taxpayer_registry_address
  FOREIGN KEY (id_address) REFERENCES address (id);

ALTER TABLE capam
  ADD CONSTRAINT FK_capam_taxpayer_registry
  FOREIGN KEY (id_taxpayer) REFERENCES taxpayer_registry (id);

ALTER TABLE capam
  ADD CONSTRAINT FK_capam_address
  FOREIGN KEY (id_address) REFERENCES address (id);

ALTER TABLE catalogs
  ADD CONSTRAINT FK_catalogs_type_catalog
  FOREIGN KEY (id_type) REFERENCES type_catalog (id);

ALTER TABLE informative_data
  ADD CONSTRAINT FK_informative_data_obligations
  FOREIGN KEY (id_obligation) REFERENCES obligations (id);

ALTER TABLE detail_capam
  ADD CONSTRAINT FK_detail_capam_capam
  FOREIGN KEY (id_campam) REFERENCES capam (id);

ALTER TABLE detail_capam
  ADD CONSTRAINT FK_detail_capam_informative_data
  FOREIGN KEY (id_data_informative) REFERENCES informative_data (id);

ALTER TABLE obligation_concepts
  ADD CONSTRAINT FK_obligation_concepts_obligations
  FOREIGN KEY (id_obligation) REFERENCES obligations (id);

ALTER TABLE obligation_concepts
  ADD CONSTRAINT FK_obligation_concepts_catalog_concepts
  FOREIGN KEY (id_concept) REFERENCES catalog_concepts (id);

ALTER TABLE predial
  ADD CONSTRAINT FK_predial_address
  FOREIGN KEY (id_address) REFERENCES address (id);

ALTER TABLE predial
  ADD CONSTRAINT FK_predial_taxpayer_registry
  FOREIGN KEY (id_taxpayer) REFERENCES taxpayer_registry (id);

ALTER TABLE taxpayer_obligations
  ADD CONSTRAINT FK_standard_obligations_taxpayer_registry
  FOREIGN KEY (id_taxpayer) REFERENCES taxpayer_registry (id);

ALTER TABLE taxpayer_obligations
  ADD CONSTRAINT FK_taxpayer_obligations_obligations
  FOREIGN KEY (id_obligation) REFERENCES obligations (id);

ALTER TABLE transactions_header
  ADD CONSTRAINT FK_transactions_header_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE transactions_header
  ADD CONSTRAINT FK_transactions_header_status_transaction
  FOREIGN KEY (id_status_transaction) REFERENCES status_transaction (id);

ALTER TABLE transactions_header
  ADD CONSTRAINT FK_transactions_header_payment_method
  FOREIGN KEY (id_payment_method) REFERENCES payment_method (id);

ALTER TABLE transactions_header
  ADD CONSTRAINT FK_transactions_header_payment_form
  FOREIGN KEY (id_payment_form) REFERENCES payment_form (id);

ALTER TABLE transactions_header
  ADD CONSTRAINT FK_transactions_header_entity_office
  FOREIGN KEY (id_entiity_office) REFERENCES entity_office (id);

ALTER TABLE transactions_header
  ADD CONSTRAINT FK_transactions_header_standard_obligations
  FOREIGN KEY (id_taxpayer_obligation) REFERENCES taxpayer_obligations (id);

ALTER TABLE reason_cancellation
  ADD CONSTRAINT FK_reason_cancellation_transactions_header
  FOREIGN KEY (id_transaction_h) REFERENCES transactions_header (id);

ALTER TABLE reason_cancellation
  ADD CONSTRAINT FK_reason_cancellation_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE transaction_detail
  ADD CONSTRAINT FK_transaction_detail_transactions_header
  FOREIGN KEY (id_transaction_h) REFERENCES transactions_header (id);

ALTER TABLE transaction_detail
  ADD CONSTRAINT FK_transaction_detail_catalog_concepts
  FOREIGN KEY (id_concept) REFERENCES catalog_concepts (id);

ALTER TABLE transaction_detail
  ADD CONSTRAINT FK_transaction_detail_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE transaction_references
  ADD CONSTRAINT FK_transaction_references_transactions_header
  FOREIGN KEY (id_transaction_h) REFERENCES transactions_header (id);

ALTER TABLE transaction_references
  ADD CONSTRAINT FK_transaction_references_banks
  FOREIGN KEY (id_bank) REFERENCES banks (id);

ALTER TABLE user_profile
  ADD CONSTRAINT FK_user_profile_users
  FOREIGN KEY (id_user) REFERENCES users (id);

ALTER TABLE user_profile
  ADD CONSTRAINT FK_user_profile_profiles
  FOREIGN KEY (id_profile) REFERENCES profiles (id);
