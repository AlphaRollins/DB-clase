create table pacientes (
    codigo_pacientes int primary key auto_increment,
    nombre varchar (45) not null,
    fecha_nac date
);

create table doctores(
    codigo_doc int primary key auto_increment,
    nombre varchar(45) not null,
    telefono varchar(12) not null,
    especialidad varchar(45) not null
);

create table ingresos(
    cod_ingresos int primary key auto_increment,
    habitacion varchar(45)not null,
    codigo_doc int,
    constraint foreign key (codigo_doc) references doctores(codigo_doc)
);

create table pacientes_ingresos(
    cod_pac_ing int primary key auto_increment,
    codigo_pacientes int,
    cod_ingresos int,
    constraint foreign key (codigo_pacientes) references pacientes(codigo_pacientes),
    constraint foreign key (cod_ingresos) references ingresos (cod_ingresos)
);

insert into pacientes(nombre,fecha_nac) values ('Daniel',2024-12-01), ('Pablo',2023-11-02),('Juan',2001-09-11);
insert into doctores(nombre,telefono,especialidad) values ('ordoñez',123456789,'ortólogo'),('Bulma',123,'tubologa'),('vegetta',321,'cardiologo');
insert into ingresos(habitacion) values('101'),('102'),('103');

select i.habitacion as hab, n.codigo_pacientes as cod_pac
from ingresos i
inner join pacientes n on i.cod_ingresos = n.codigo_pacientes;
