drop table study;
drop sequence study_no_seq;

CREATE TABLE study
( 
no           NUMBER(8),
title        VARCHAR2(200) NOT NULL,
content      VARCHAR2(4000) NOT NULL,
member_no    NUMBER(8),
view_cnt     NUMBER(10),
group_no	 NUMBER(8),
order_no     NUMBER(8),
depth		 NUMBER(8),
reg_date     DATE NOT NULL,
filename     VARCHAR2(200)
);



ALTER TABLE study
ADD ( CONSTRAINT study_no_pk PRIMARY KEY ( no ) );

CREATE SEQUENCE study_no_seq
 START WITH     1
 INCREMENT BY   1
 MAXVALUE       99999999
 NOCACHE
 NOCYCLE;
 
 
 
 
insert into study
 values ( study_no_seq.nextval, 
		 '첫글입니다.', 
		 '안녕하세요', 
		 4,
		 0, 
		 nvl( ( select max( group_no ) from study ), 0) + 1,
		 1,
		 1,
		 SYSDATE,
		 null );