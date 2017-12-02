
create table module (
id serial primary key,
name varchar(80) unique,
path varchar(80),
description varchar(200),
actors varchar(80),
cultural_group varchar(80),
demographic_female_elder boolean,
demographic_male_elder boolean,
demographic_female_adult boolean,
demographic_male_adult boolean,
demographic_female_teen boolean,
demographic_male_teen boolean,
demographic_female_child boolean,
demographic_male_child boolean
);

create table hub (
id serial primary key,
name varchar(80) unique,
description varchar(80),
country varchar(80),
region varchar(80),
loc_type varchar(80)
);

create table module_hub (
module_id integer,
hub_id integer,
deploy_date date,
undeploy_date date,
primary key (module_id, hub_id)
);
