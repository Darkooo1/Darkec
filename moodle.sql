drop database if exists assignment;
create database assignment;
use assignment;

create table assign (

    key_a bigint (10) not null primary key auto_increment,

    course bigint (10),
    name varchar (255),
    intro longtext,
    introformat smallint (4),
    alwaysshowdescription tinyint (2),
    nosubmissions tinyint (2),
    submissions tinyint (2),
    submissionsdrafts tinyint (2),
    sendnotifications  tinyint (2),
    sendlatenotifications tinyint (2),
    duedate bigint (10),
    allowsubmisssionsfromdate bigint (10),
    grade bigint (10),
    timemodified bigint (10),
    requiresubmissionstatement tinyint (2),
    completionsubmit tinyint (2),
    cutoffdate bigint (10),
    teamsubmission tinyint (2),
    requireallteammemberssubmit tinyint (2),
    teamsubmissiongroupingid bigint (10),
    blindmarking tinyint (2),
    revealidentities tinyint (2),
    attemptreopenmethod varchar (10),
    maxattempts mediumint (6),
    markingworkflow tinyint (2),
    markingallocation tinyint (2),
    sendstudentnotifications tinyint(2)

);

create table assign_plugin_config (

    key_apc bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,

    plugin varchar (28),
    subtype varchar (28),
    name varchar (28),
    value longtext

);


create table assignfeedback_comments (

    key_afeedback bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,
    grade bigint (10) not null,

    commenttext longtext,
    commentformat smallint (4)

);


create table assign_grades (

    key_agrades bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,

    userid bigint (10) not null,
    timecreated bigint (10),
    timemodified bigint (10),
    grader bigint (10) not null,
    grade decimal (10,5) not null,
    attemptnumber bigint (10)

);


create table assignfeedback_editpdf_annot (

    key_afeedback_editpdf_annot bigint (10) not null primary key auto_increment,
    gradeid bigint (10) not null,

    pageno bigint (10),
    x bigint (10),
    y bigint (10),
    endx bigint (10),
    endy bigint (10),
    path longtext,
    type varchar (10),
    colour varchar (10),
    draft tinyint (2)



);


create table assignsubmission_file (

    key_asubmission_file bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,
    submissions bigint (10) not null,

    numfiles bigint (10)

);


create table assign_submission (

    key_asubmission bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,

    userid bigint (10) not null,
    timecreated bigint (10),
    timemodified bigint (10),
    status varchar (10),
    groupid bigint (10),
    attemptnumber bigint (10)

);


create table assignsubmission_onlinetext (

    key_asubmissiononlinetext bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,
    submissions bigint (10) not null,

    onlinetext longtext,
    onlineformat smallint (4)

);


create table assign_user_mapping (

    key_ausermapping bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,
    userid bigint (10) not null

);


create table assign_user_flags (

    key_auserflags bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,
    userid bigint (10) not null,

    locked bigint (10),
    extensionduedat bigint (10),
    allocatedmarker bigint (10),
    mailed smallint (4),
    workflowstate varchar(20)

);


create table assignfeedback_file (

    key_afeedbackfile bigint (10) not null primary key auto_increment,
    assignment bigint (10) not null,
    grade bigint (10) not null,

    numfiles bigint(10)

);


create table assignfeedback_editpdf_quick (

    key_afeedbackeditpdfquick bigint (10) not null primary key auto_increment,
    userid bigint (10) not null,

    rawtext longtext,
    width bigint (10),
    colour varchar (10)

);


create table assignfeedback_editpdf_cmnt (

    key_afeedbackeditpdfcmnt bigint (10) not null primary key auto_increment,
    gradeid bigint (10) not null,

    x bigint (10),
    y bigint (10),
    width bigint (10),
    pageno bigint (10),
    rawtext longtext,
    colour varchar (10),
    draft tinyint (2)

);



alter table assign_plugin_config add foreign key (assignment) references assign(key_a); 

alter table assignfeedback_comments add foreign key (assignment) references assign(key_a);
alter table assignfeedback_comments add foreign key (grade) references assign_grades(key_agrades);

alter table assign_grades add foreign key (assignment) references assign(key_a);

alter table assignfeedback_editpdf_annot add foreign key (gradeid) references assign_grades(key_agrades);

alter table assignsubmission_file add foreign key (assignment) references assign(key_a);
alter table assignsubmission_file add foreign key (submissions) references assign_submission(key_asubmission);

alter table assign_submission add foreign key (assignment) references assign(key_a);

alter table assignsubmission_onlinetext add foreign key (assignment) references assign(key_a);
alter table assignsubmission_onlinetext add foreign key (submissions) references assign_submission(key_asubmission);

alter table assign_user_mapping add foreign key (assignment) references assign(key_a);
alter table assign_user_mapping add foreign key (userid) references assign_grades(key_agrades);

alter table assign_user_flags add foreign key (assignment) references assign(key_a);
alter table assign_user_flags add foreign key (userid) references assign_grades(key_agrades);

alter table assignfeedback_file add foreign key (assignment) references assign(key_a);
alter table assignfeedback_file add foreign key (grade) references assign_grades(key_agrades);

alter table assignfeedback_editpdf_quick add foreign key (userid) references assign_grades(key_agrades);

alter table assignfeedback_editpdf_cmnt add foreign key (gradeid) references assign_grades(key_agrades);






