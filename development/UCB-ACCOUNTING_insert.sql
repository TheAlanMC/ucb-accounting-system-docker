-- Query Tool
INSERT INTO account_category (account_category_code, account_category_name, status, tx_date, tx_user, tx_host) 
VALUES
  (1, 'ACTIVO', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
  (2, 'PASIVO', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
  (3, 'PATRIMONIO', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
  (4, 'INGRESOS', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1'),
  (5, 'EGRESOS', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

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
    ('image/jpeg','pictures','d09df7de-c336-4ec4-859c-2aa7417d7cf5.jpg', true, CURRENT_TIMESTAMP, 'admin', '127.0.0.1');

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