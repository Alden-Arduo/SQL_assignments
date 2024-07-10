USE aldendb;

/* Inserts for the Vehicle_Type table */
insert into vehicle_type values('daihatsu','charade','p',4,1.0,1000);
insert into vehicle_type values('mazda',121,'p',5,1.2,1000);
insert into vehicle_type values('ford','telstar','p',5,2.0,2500);
insert into vehicle_type values('VW','golf','d',5,1.5,1500);
insert into vehicle_type values('mazda',323,'p',5,2.3,2000);
insert into vehicle_type values('daihatsu','4wd','d',6,3.0,3000);
insert into vehicle_type values('honda','jazz','p',5,1.5,1500);
insert into vehicle_type values('honda','civic','p',5,1.8,1800);
insert into vehicle_type values('honda','accord','p',5,2,2000);

/* Inserts for the Owner table */
insert into owner values('BA789256',58743344,'Anna','B','Simmons','21 Aorangi Rd Christchurch','1958-1-21','f',null,'3381275');
insert into owner values('GG847264',48673675,'Peter','H','George','10a Lyndon St Christchurch','1965-11-11','m',null,'3213213');
insert into owner values('HA385767',38573657,'Steve','N','Smith','263 Memorial Av Christchurch','1972-2-28','m',null,'3113111');
insert into owner values('FF849583',38576767,'Jane','A','Austin','33 Bateman St Christchurch','1958-1-21','f',null,'3111141');
insert into owner values('HD837423',20229382,'George','K','Peterson','Wairekei St Christchurch','01992-9-9','m',null,'3923925');
insert into owner values('HD293847',09876273,'Mary','K','Lin','14 Main St Toytown','1940-6-16','f',null,'2534235');
insert into owner values('UJ203954',10293854,'Gwenda','F','Bosley','88 Alpha Av Acity','1955-1-31','f',null,'3123456');
insert into owner values('AU293857',20220222,'Richard','I','Wise','30 Shortland St TVCity','1956-12-2','m',null,'3334445');
insert into owner values('HA928375',20323888,'King','A','Alan','5 High St Christchurch','1948-3-9','m',null,'3839301');
insert into owner values('HD543235',33033033,'King','H','Jason','5 High St Christchurch','1965-7-17','m',null,'3839301');
insert into owner values('IA192837',30192847,'Minnie','N','Mouse','2194 Sunset Bl Wellington','1989-1-1','f','Disney studios','9992837');
insert into owner values('DB125699',38799344,'Jennie','B','Martin','21 Creyke Christchurch','1998-1-21','f',null,'3381275');
insert into owner values('JA264818',98622675,'Peter','H','Holland','10a Elisabeth St Christchurch','1999-11-11','m',null,'3213213');
insert into owner values('GR153856',38573284,'Steven','N','Roberts','263 Memorial Av Christchurch','1996-2-28','m',null,'3113111');

/* Inserts for the Employee table */
insert into employee values('Anna','B','Simmons',58743344,'f','1958-1-21','101a',1352,'2010-2-22');
insert into employee values('Timothy','S','Sanders',38473342,'m','1970-5-21','101b',1352,'2009-3-17');
insert into employee values('Michael','F','Forman',21321322,'m','1947-11-9',100,1352,'2018-5-12');
insert into employee values('Angela','S','Tay',91382743,'f','1953-10-10',13,1303,'2009-6-15');
insert into employee values('John','F','Right',91837243,'m','1956-10-1',12,1303,'2015-10-1');

/* Inserts for the REG_ORG table */
insert into REG_ORG values(1352,'Riccarton Rd',231,'Christchurch',58743344);
insert into REG_ORG values(1303,'Main North Rd',19,'Christchurch',91382743);

/*Data for the VEHICLE table */
insert into vehicle values('QJD123',2003,1686617,655239,'p','ford','telstar');
insert into vehicle values('JS2938',1975,3857364,36333,'p','ford','telstar');
insert into vehicle values('JJ3847',1985,3847523,82736,'t','VW','golf');
insert into vehicle values('OZ8347',1991,2948573,84723,'p','mazda',323);
insert into vehicle values('PP3958',1995,9385734,82222,'p','mazda',121);
insert into vehicle values('PA9485',1994,1928434,29384,'p','daihatsu','charade');
insert into vehicle values('TX9283',1993,9287323,44735,'p','ford','telstar');
insert into vehicle values('DBA256',2012,7918189,11122,'p','honda','jazz');
insert into vehicle values('JAL264',2006,8928382,22322,'p','honda','civic');
insert into vehicle values('GRW858',2017,9928456,33434,'t','honda','accord');

/*Data for the OWNS table */
insert into owns values('QJD123','BA789256','15-mar-2003',20,'15-jul-2011');
insert into owns values('JS2938','HD293847','02-mar-75',100,'15-apr-2003');
insert into owns values('JJ3847','HD543235','17-may-85',1573,'17-may-97');
insert into owns values('OZ8347','FF849583','15-sep-91',294,null);
insert into owns values('PP3958','HA385767','08-aug-95',903,'19-sep-2009');
insert into owns values('PA9485','UJ203954','31-mar-96',45,'13-mar-99');
insert into owns values('TX9283','HD543235','14-nov-95',28721,'15-feb-2003');
insert into owns values('TX9283','HD293847','15-feb-2003',92870,null);
insert into owns values('PA9485','GG847264','13-mar-99',11920,'27-nov-2006');
insert into owns values('JJ3847','HA928375','17-may-97',45736,'27-aug-2008');
insert into owns values('JS2938','IA192837','15-apr-2003',55612,null);
insert into owns values('JJ3847','BA789256','27-aug-2008',155736,null);
insert into owns values('PP3958','FF849583','19-sep-2009',195503,null);
insert into owns values('QJD123','HD543235','15-jul-2011',65499,null);
insert into owns values('PA9485','IA192837','27-nov-2006',12920,null);
insert into owns values('DBA256','GR153856','14-aug-2017',31350,null);
insert into owns values('JAL264','DB125699','5-mar-2019',2018,null);
insert into owns values('GRW858','JA264818','27-feb-2018',81456,null);


/*Data for the COLOR table */
insert into color values('QJD123','black');
insert into color values('JS2938','red');
insert into color values('JJ3847','blue');
insert into color values('OZ8347','green');
insert into color values('PP3958','white');
insert into color values('PP3958','blue');
insert into color values('PA9485','yellow');
insert into color values('TX9283','red');
insert into color values('DBA256','white');
insert into color values('JAL264','navy');
insert into color values('GRW858','violet');


/*Data for the REGISTRATION table */
insert into registration values('JJ3847',21321322,1352,'17-may-85','Japan',15736,84.25);
insert into registration values('JAL264',21321322,1352,'5-sep-2013',null,79256,165.35);
insert into registration values('JAL264',91837243,1303,'5-sep-2014',null,90018,150.35);
insert into registration values('GRW858',91837243,1303,'15-apr-2018',null,99560,292.70);
insert into registration values('PA9485',38473342,1352,'31-mar-94','NZ',1920,184.90);
insert into registration values('QJD123',21321322,1352,'15-mar-2003','NZ',20,175.95);
insert into registration values('JAL264',91837243,1303,'5-sep-2018',null,169018,350.35);
insert into registration values('TX9283',38473342,1352,'17-nov-95','NZ',28943,150.55);
insert into registration values('PP3958',21321322,1352,'08-aug-95','NZ',903,303.15);
insert into registration values('JAL264',91837243,1303,'5-sep-2009',null,42180,150.35);
insert into registration values('JS2938',91382743,1303,'15-apr-83','Japan',55612,101.15);
insert into registration values('OZ8347',91837243,1303,'25-sep-91','Japan',2948,211.35);
insert into registration values('JJ3847',91382743,1303,'29-nov-94',null,25253,224.70);
insert into registration values('JJ3847',91382743,1303,'29-nov-93',null,17253,284.70);
insert into registration values('QJD123',21321322,1352,'13-mar-2004',null,3150,185.95);
insert into registration values('JJ3847',91382743,1303,'30-nov-96',null,75253,284.70);
insert into registration values('JJ3847',91382743,1303,'29-nov-95',null,56253,184.70);
insert into registration values('QJD123',21321322,1352,'03-mar-2005',null,6150,195.95);
insert into registration values('PA9485',38473342,1352,'31-mar-95',null,31920,154.90);
insert into registration values('QJD123',21321322,1352,'11-mar-2006',null,16150,195.95);
insert into registration values('JAL264',21321322,1352,'5-sep-2006',null,2018,150.35);
insert into registration values('PA9485',21321322,1352,'31-mar-96',null,43920,124.35);
insert into registration values('QJD123',21321322,1352,'09-mar-2007',null,26150,195.95);
insert into registration values('PA9485',38473342,1352,'13-apr-97',null,51920,231.30);
insert into registration values('QJD123',21321322,1352,'09-mar-2008',null,26150,195.95);
insert into registration values('TX9283',21321322,1352,'15-feb-97',null,2870,250.00);
insert into registration values('QJD123',21321322,1352,'09-mar-2009',null,29150,195.95);
insert into registration values('JAL264',21321322,1352,'2-sep-2008',null,25018,192.50);
insert into registration values('JS2938',91837243,1303,'02-mar-95',null,150101,121.05);
insert into registration values('QJD123',21321322,1352,'10-mar-2010',null,49150,185.95);
insert into registration values('JS2938',91837243,1303,'02-mar-96',null,169113,114.05);
insert into registration values('JS2938',91837243,1303,'15-feb-97',null,180101,121.05);
insert into registration values('OZ8347',38473342,1352,'15-feb-97',null,2948,203.35);
insert into registration values('QJD123',21321322,1352,'15-jul-2011',null,65499,165.95);
insert into registration values('QJD123',21321322,1352,'14-jul-2012',null,71499,165.95);
insert into registration values('GRW858',21321322,1352,'15-apr-2019',null,120120,340.6);
insert into registration values('DBA256',91382743,1352,'14-aug-2017',null,31350,105.90);
insert into registration values('QJD123',21321322,1352,'13-jul-2014',null,91036,165.95);
insert into registration values('JAL264',21321322,1352,'25-aug-2017',null,144256,265.35);
insert into registration values('DBA256',91382743,1352,'14-aug-2018',null,55480,155.90);
insert into registration values('QJD123',21321322,1352,'15-jul-2014',null,91580,186.30);
insert into registration values('JAL264',21321322,1352,'5-sep-2007',null,19256,165.35);
insert into registration values('QJD123',58743344,1352,'16-jul-2015',null,102300,186.30);
insert into registration values('QJD123',21321322,1352,'14-jul-2016',null,129232,202.95);
insert into registration values('DBA256',91382743,1352,'1-aug-2019',null,55480,162.50);
insert into registration values('QJD123',91382743,1352,'13-jul-2017',null,145678,202.95);
insert into registration values('QJD123',21321322,1352,'10-jul-2018',null,152888,255.95);
insert into registration values('JAL264',21321322,1352,'25-aug-2010',null,49256,165.35);
insert into registration values('JAL264',91382743,1303,'29-aug-2011',null,55018,192.50);
insert into registration values('JAL264',21321322,1352,'5-sep-2012',null,62018,150.35);
insert into registration values('GRW858',21321322,1352,'15-apr-2017',null,81456,240.70);
insert into registration values('JAL264',21321322,1352,'25-aug-2015',null,109256,210.30);
insert into registration values('JAL264',91837243,1303,'5-sep-2016',null,123018,240.80);

/* Change the EMPLOYEE table to add the foreign key */
alter table EMPLOYEE
add foreign key (reg_org) references REG_ORG(org_number);
