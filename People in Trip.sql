DROP TABLE P_MEMBER CASCADE CONSTRAINTS;
CREATE TABLE P_MEMBER (
	ID			VARCHAR2(20) PRIMARY KEY 
	, NAME 			VARCHAR2(20) NOT NULL
	, PWD			VARCHAR2(20) NOT NULL
	, NICK_NM		VARCHAR2(30) NOT NULL
	, EMAIL 		VARCHAR2(50) NOT NULL
	, JOIN_DATE 	DATE DEFAULT SYSDATE NOT NULL
	, LAST_UPDATE	DATE
	, GRADE			VARCHAR2(20) DEFAULT '�Ϲ�ȸ��' NOT NULL
);



DROP TABLE P_imageFile CASCADE CONSTRAINTS;
CREATE TABLE P_imageFile (
	imageFileNO		number(10)	PRIMARY key
	,imageFileName	varchar2(50)
	,regDate	DATE DEFAULT sysdate
	,POST_NUM	number(10)
	,CONSTRAINT POST_NUM FOREIGN key(POST_NUM) REFERENCES P_BOARD(POST_NUM)
	 ON DELETE CASCADE	-- �Խ��� ���� ������ ��� �ش� �۹�ȣ�� �����ϴ� �̹��� ������ �ڵ����� ������
);

DROP TABLE P_imageFile1 CASCADE CONSTRAINTS;
CREATE TABLE P_imageFile1 (
	imageFileNO		number(10)	PRIMARY key
	,imageFileName	varchar2(50)
	,regDate	DATE DEFAULT sysdate
	,POST_NUM	number(10)
	, FOREIGN key(POST_NUM) REFERENCES P_BOARD1(POST_NUM)
	 ON DELETE CASCADE	-- �Խ��� ���� ������ ��� �ش� �۹�ȣ�� �����ϴ� �̹��� ������ �ڵ����� ������
);


DROP TABLE P_BOARD CASCADE CONSTRAINTS;
CREATE TABLE P_BOARD (
	POST_NUM		NUMBER PRIMARY KEY
	, ID  			VARCHAR2(50) NOT NULL
	, POST_TITLE	VARCHAR2(100) NOT NULL
	, POST_CONTENT	VARCHAR2(4000) NOT NULL
	, POST_DATE 	DATE DEFAULT SYSDATE NOT NULL
	, VISITCOUNT	NUMBER DEFAULT 0 NOT NULL
	, commentcount NUMBER DEFAULT 0 NOT NULL
	,imageFileName	varchar2(100)
	,LIKEHIT NUMBER DEFAULT 0 NOT NULL
	,SINHIT NUMBER DEFAULT 0 NOT NULL
	, FOREIGN KEY(ID) REFERENCES P_MEMBER (ID) ON DELETE cascade
);

DROP TABLE P_BOARD1 CASCADE CONSTRAINTS;
CREATE TABLE P_BOARD1 (
	POST_NUM		NUMBER PRIMARY KEY
	, ID  			VARCHAR2(50) NOT NULL
	, POST_TITLE	VARCHAR2(100) NOT NULL
	, POST_CONTENT	VARCHAR2(4000) NOT NULL
	, POST_DATE 	DATE DEFAULT SYSDATE NOT NULL
	, VISITCOUNT	NUMBER DEFAULT 0 NOT NULL
	, commentcount NUMBER DEFAULT 0 NOT NULL
	,imageFileName	varchar2(100)
	,LIKEHIT NUMBER DEFAULT 0 NOT NULL
	,SINHIT NUMBER DEFAULT 0 NOT NULL
	, FOREIGN KEY(ID) REFERENCES P_MEMBER (ID) ON DELETE cascade
);

DROP TABLE l_board CASCADE CONSTRAINTS;
create table l_board(
   LIKENO NUMBER  NOT null  PRIMARY KEY ,
	POST_NUM NUMBER ,
	ID VARCHAR2(50) NOT NULL,
	LIKECHECK NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(POST_NUM) REFERENCES P_BOARD(POST_NUM) ON DELETE CASCADE
)
;

DROP TABLE l_board1 CASCADE CONSTRAINTS;
create table l_board1(
   LIKENO1 NUMBER  NOT null  PRIMARY KEY ,
	POST_NUM NUMBER ,
	ID VARCHAR2(50) NOT NULL,
	LIKECHECK NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(POST_NUM) REFERENCES P_BOARD1(POST_NUM) ON DELETE CASCADE
)
;

DROP TABLE s_board CASCADE CONSTRAINTS;
create table s_board(
   	SNO NUMBER  NOT null  PRIMARY KEY ,
	POST_NUM NUMBER ,
	ID VARCHAR2(50) NOT NULL,
	SCHECK NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(POST_NUM) REFERENCES P_BOARD(POST_NUM) ON DELETE CASCADE
)
;

DROP TABLE s_board1 CASCADE CONSTRAINTS;
create table s_board1(
   	SNO NUMBER  NOT null  PRIMARY KEY ,
	POST_NUM NUMBER ,
	ID VARCHAR2(50) NOT NULL,
	SCHECK NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(POST_NUM) REFERENCES P_BOARD1(POST_NUM) ON DELETE CASCADE
)
;

DROP TABLE P_BOARD_COMMENT CASCADE CONSTRAINTS;
CREATE TABLE P_BOARD_COMMENT (
   COM_NUM            NUMBER PRIMARY KEY
   , ID              VARCHAR2(50) NOT NULL
   , POST_NUM    	 NUMBER NOT NULL   
   , COM_CONTENT       VARCHAR2(200) NOT NULL
   , COM_DATE         DATE DEFAULT SYSDATE NOT NULL
   , FOREIGN KEY(ID) REFERENCES P_MEMBER (ID) ON DELETE cascade
   , FOREIGN KEY(POST_NUM) REFERENCES P_BOARD (POST_NUM) ON DELETE cascade
);
CREATE SEQUENCE COM_NUM START WITH 1 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
DROP SEQUENCE COM_NUM; 

DROP TABLE P_BOARD_COMMENT2 CASCADE CONSTRAINTS;
CREATE TABLE P_BOARD_COMMENT2 (
   COM_NUM            NUMBER PRIMARY KEY
   , ID              VARCHAR2(50) NOT NULL
   , POST_NUM    	 NUMBER NOT NULL   
   , COM_CONTENT       VARCHAR2(200) NOT NULL
   , COM_DATE         DATE DEFAULT SYSDATE NOT NULL
   , FOREIGN KEY(ID) REFERENCES P_MEMBER (ID) ON DELETE cascade
   , FOREIGN KEY(POST_NUM) REFERENCES P_BOARD1 (POST_NUM) ON DELETE cascade
);
CREATE SEQUENCE COM_NUM2 START WITH 1 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
DROP SEQUENCE COM_NUM2; 

DROP TABLE P_busantourist CASCADE CONSTRAINTS;
CREATE TABLE P_busantourist (
   UC_SEQ            number PRIMARY KEY 
   ,PLACE            VARCHAR2(300)  
   ,ADDR1            VARCHAR2(500)
   , CNTCT_TEL         VARCHAR2(500)
   , ITEMCNTNTS      clob 
   , MAIN_IMG_NORMAL   VARCHAR2(1000)
   , SUBTITLE         VARCHAR2(700)
   , LAT            number
   , LNG            number
);
ALTER TABLE P_busantourist ADD viewcount NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busantourist ADD commentcount NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busantourist ADD steamedhit NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busantourist ADD suggestionhit NUMBER DEFAULT 0 NOT NULL;


DROP TABLE P_busanfestival CASCADE CONSTRAINTS;
CREATE TABLE P_busanfestival (
   UC_SEQ            number PRIMARY KEY 
   ,PLACE            VARCHAR2(300)  
   ,ADDR1            VARCHAR2(500)
   , CNTCT_TEL         VARCHAR2(500)
   , ITEMCNTNTS      clob 
   , MAIN_IMG_NORMAL   VARCHAR2(1000)
   , SUBTITLE         VARCHAR2(700)
   , LAT            number
   , LNG            number
);
ALTER TABLE P_busanfestival ADD viewcount NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busanfestival ADD commentcount NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busanfestival ADD steamedhit NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busanfestival ADD suggestionhit NUMBER DEFAULT 0 NOT NULL;


DROP TABLE P_busanexperience CASCADE CONSTRAINTS;
CREATE TABLE P_busanexperience (
   UC_SEQ            number PRIMARY KEY 
   ,PLACE            VARCHAR2(300)  
   ,ADDR1            VARCHAR2(500)
   , CNTCT_TEL         VARCHAR2(500)
   , ITEMCNTNTS      clob 
   , MAIN_IMG_NORMAL   VARCHAR2(1000)
   , SUBTITLE         VARCHAR2(700)
   , LAT            number
   , LNG            number
);

ALTER TABLE P_busanexperience ADD viewcount NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busanexperience ADD commentcount NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busanexperience ADD steamedhit NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_busanexperience ADD suggestionhit NUMBER DEFAULT 0 NOT NULL;


DROP TABLE P_BUSAN_COMMENT CASCADE CONSTRAINTS;
CREATE TABLE P_BUSAN_COMMENT (
   COM_NUM         NUMBER PRIMARY KEY
   , ID              VARCHAR2(50) NOT NULL
   , UC_SEQ      NUMBER  NOT NULL   
   , COM_CONTENT       VARCHAR2(200) NOT NULL
   , COM_DATE         DATE DEFAULT SYSDATE NOT NULL
   , FOREIGN KEY(ID) REFERENCES P_MEMBER (ID) ON DELETE cascade
   , FOREIGN KEY(UC_SEQ) REFERENCES P_BUSANTOURIST (UC_SEQ)
);
CREATE SEQUENCE BusanCOM_NUM1 START WITH 1 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
DROP SEQUENCE BusanCOM_NUM1;

DROP TABLE P_BUSANfestival_COMMENT CASCADE CONSTRAINTS;
CREATE TABLE P_BUSANfestival_COMMENT (
   COM_NUM         NUMBER PRIMARY KEY
   , ID              VARCHAR2(50) NOT NULL
   , UC_SEQ      NUMBER  NOT NULL   
   , COM_CONTENT       VARCHAR2(200) NOT NULL
   , COM_DATE         DATE DEFAULT SYSDATE NOT NULL
   , FOREIGN KEY(ID) REFERENCES P_MEMBER (ID) ON DELETE cascade
   , FOREIGN KEY(UC_SEQ) REFERENCES P_BUSANFESTIVAL (UC_SEQ)
);
CREATE SEQUENCE BusanfestivalCOM_NUM1 START WITH 1 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
DROP SEQUENCE BusanfestivalCOM_NUM1;

DROP TABLE P_BUSANexperience_COMMENT CASCADE CONSTRAINTS;
CREATE TABLE P_BUSANexperience_COMMENT (
   COM_NUM         NUMBER PRIMARY KEY
   , ID              VARCHAR2(50) NOT NULL
   , UC_SEQ      NUMBER  NOT NULL   
   , COM_CONTENT       VARCHAR2(200) NOT NULL
   , COM_DATE         DATE DEFAULT SYSDATE NOT NULL
   , FOREIGN KEY(ID) REFERENCES P_MEMBER (ID) ON DELETE cascade
   , FOREIGN KEY(UC_SEQ) REFERENCES P_busanexperience (UC_SEQ)
);
CREATE SEQUENCE BusanexperienceCOM_NUM1 START WITH 1 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
DROP SEQUENCE BusanexperienceCOM_NUM1;



SELECT * FROM P_JEJU_COMMENT WHERE contentsid = 'CNTS_000000000021034';
CREATE SEQUENCE COM_NUM1 START WITH 1 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
DROP SEQUENCE COM_NUM1;


DROP TABLE busanexperience_suggestion CASCADE CONSTRAINTS;
create table busanexperience_suggestion(
   suggestionno NUMBER  NOT null  PRIMARY KEY ,
   UC_SEQ       NUMBER  NOT NULL ,
   ID VARCHAR2(50) NOT NULL,
   suggestioncheck NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(UC_SEQ) REFERENCES p_busanexperience(UC_SEQ) ON DELETE CASCADE
)
;

DROP TABLE busantourist_suggestion CASCADE CONSTRAINTS;
create table busantourist_suggestion(
   suggestionno NUMBER  NOT null  PRIMARY KEY ,
   UC_SEQ       NUMBER  NOT NULL ,
   ID VARCHAR2(50) NOT NULL,
   suggestioncheck NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(UC_SEQ) REFERENCES p_busantourist(UC_SEQ) ON DELETE CASCADE
)
; 

DROP TABLE busanfestival_suggestion CASCADE CONSTRAINTS;
create table busanfestival_suggestion(
   suggestionno NUMBER  NOT null  PRIMARY KEY ,
   UC_SEQ       NUMBER  NOT NULL ,
   ID VARCHAR2(50) NOT NULL,
   suggestioncheck NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(UC_SEQ) REFERENCES p_busanfestival(UC_SEQ) ON DELETE CASCADE
)
;

DROP TABLE busantourist_steamed CASCADE CONSTRAINTS;
create table busantourist_steamed(
   steamedno NUMBER  NOT null  PRIMARY KEY ,
   UC_SEQ       NUMBER  NOT NULL ,
   ID VARCHAR2(50) NOT NULL,
   STEAMEDCHECK NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(UC_SEQ) REFERENCES p_busantourist(UC_SEQ) ON DELETE CASCADE
)
; 

DROP TABLE busanfestival_steamed CASCADE CONSTRAINTS;
create table busanfestival_steamed(
   steamedno NUMBER  NOT null  PRIMARY KEY ,
   UC_SEQ       NUMBER  NOT NULL ,
   ID VARCHAR2(50) NOT NULL,
   STEAMEDCHECK NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(UC_SEQ) REFERENCES p_busanfestival(UC_SEQ) ON DELETE CASCADE
)
; 

DROP TABLE busanexperience_steamed CASCADE CONSTRAINTS;
create table busanexperience_steamed(
   steamedno NUMBER  NOT null  PRIMARY KEY ,
   UC_SEQ       NUMBER  NOT NULL ,
   ID VARCHAR2(50) NOT NULL,
   STEAMEDCHECK NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(UC_SEQ) REFERENCES p_busanexperience(UC_SEQ) ON DELETE CASCADE
)
; 



INSERT INTO EZEN.P_BOARD1
(POST_NUM, ID, POST_TITLE, POST_CONTENT, POST_DATE, VISITCOUNT)
VALUES(seq_BOARD_num.nextval, 'apple', 'sss', 'z', SYSDATE , '2');

INSERT INTO EZEN.P_BOARD
(POST_NUM, ID, POST_TITLE, POST_CONTENT, POST_DATE, VISITCOUNT)
VALUES(seq_BOARD_num.nextval, 'apple', '2', 'z', SYSDATE , '2');
INSERT INTO EZEN.P_BOARD (POST_NUM, ID, POST_CATE, POST_TITLE, POST_CONTENT)
VALUES(seq_BOARD_num.nextval, 'apple',  2, '����԰�ʹ�.', '������� �Ķ����1');
INSERT INTO EZEN.P_BOARD (POST_NUM, ID, POST_CATE, POST_TITLE, POST_CONTENT)
VALUES(seq_BOARD_num.nextval, 'banana',  12, '�ٳ����� ���', '������ ����');
INSERT INTO EZEN.P_BOARD (POST_NUM, ID, POST_CATE, POST_TITLE, POST_CONTENT)
VALUES(seq_BOARD_num.nextval, 'chocolate',  13, '�޴��� ���ڷ�', '��� �� ���ڷ�');
INSERT INTO EZEN.P_BOARD (POST_NUM, ID, POST_CATE, POST_TITLE, POST_CONTENT)
VALUES(seq_BOARD_num.nextval, 'dorazi', 2,  '������', '����ġ��ħ');
INSERT INTO EZEN.P_BOARD (POST_NUM, ID, POST_CATE, POST_TITLE, POST_CONTENT)
VALUES(seq_BOARD_num.nextval, 'egg', 1,  '���������', '�ǳ� �Դ´�.');
COMMIT;


DROP TABLE P_tourist CASCADE CONSTRAINTS;
CREATE TABLE P_tourist (
   contentsid      VARCHAR2(1000) PRIMARY KEY 
   ,alltag         VARCHAR2(1000)
   , label         VARCHAR2(500)
   , label2      VARCHAR2(500)
   , title         VARCHAR2(500)
   , address      VARCHAR2(500)
   , tag         VARCHAR2(500)
   , introduction   VARCHAR2(1500)
   , imgpath      VARCHAR2(500)   
   , phoneno      VARCHAR2(500)
   , latitude      number
   , longitude      number
);
ALTER TABLE P_TOURIST ADD viewcount NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_TOURIST ADD commentcount NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_TOURIST ADD steamedhit NUMBER DEFAULT 0 NOT NULL;
ALTER TABLE P_TOURIST ADD suggestionhit NUMBER DEFAULT 0 NOT NULL;


DROP TABLE P_JEJU_COMMENT CASCADE CONSTRAINTS;
CREATE TABLE P_JEJU_COMMENT (
   COM_NUM         NUMBER PRIMARY KEY
   , ID              VARCHAR2(50) NOT NULL
   , contentsid      VARCHAR2(1000) NOT NULL   
   , COM_CONTENT       VARCHAR2(200) NOT NULL
   , COM_DATE         DATE DEFAULT SYSDATE NOT NULL
   , FOREIGN KEY(ID) REFERENCES P_MEMBER (ID)
   , FOREIGN KEY(contentsid) REFERENCES P_TOURIST (contentsid)
);
CREATE SEQUENCE COM_NUM1 START WITH 1 INCREMENT BY 1 MAXVALUE 99999 CYCLE NOCACHE;
DROP SEQUENCE COM_NUM1;

SELECT * FROM P_JEJU_COMMENT WHERE contentsid = 'CNTS_000000000021034';


DROP TABLE tourist_steamed CASCADE CONSTRAINTS;
create table tourist_steamed(
   steamedno NUMBER  NOT null  PRIMARY KEY ,
   contentsid VARCHAR2(1000) NOT NULL ,
   ID VARCHAR2(50) NOT NULL,
   STEAMEDCHECK NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(contentsid) REFERENCES p_tourist(contentsid) ON DELETE CASCADE
)
;   

DROP TABLE tourist_suggestion CASCADE CONSTRAINTS;
create table tourist_suggestion(
   suggestionno NUMBER  NOT null  PRIMARY KEY ,
   contentsid VARCHAR2(1000) NOT NULL ,
   ID VARCHAR2(50) NOT NULL,
   suggestioncheck NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY(ID) REFERENCES P_MEMBER(ID) ON DELETE CASCADE,
    FOREIGN KEY(contentsid) REFERENCES p_tourist(contentsid) ON DELETE CASCADE
)
; 


///////////////////////////////////////////////////////////////////////////////////////////

DROP SEQUENCE seq_BOARD_num;
CREATE SEQUENCE seq_BOARD_num
	INCREMENT BY 1					-- 1�� ����
	START WITH 100001				-- ���۰� 10000001
	MINVALUE 100001					-- �ּڰ� 10000001
	MAXVALUE 200000						-- �ִ��� ���Ѵ�
	nocycle							-- ��ȯ���� ����
	nocache							-- ĳ�� �� �� 
;

DROP SEQUENCE seq_MESSAGE_num;
CREATE SEQUENCE seq_MESSAGE_num
	INCREMENT BY 1					-- 1�� ����
	START WITH 200001				-- ���۰� 10000001
	MINVALUE 200001					-- �ּڰ� 10000001
	MAXVALUE 300000							-- �ִ��� ���Ѵ�
	nocycle							-- ��ȯ���� ����
	nocache							-- ĳ�� �� �� 
;

DROP SEQUENCE seq_COMMENT_num;
CREATE SEQUENCE seq_COMMENT_num
	INCREMENT BY 1					-- 1�� ����
	START WITH 300001				-- ���۰� 10000001
	MINVALUE 300001					-- �ּڰ� 10000001
	MAXVALUE 400000				-- �ִ��� ���Ѵ�
	nocycle							-- ��ȯ���� ����
	nocache							-- ĳ�� �� �� 
;

DROP SEQUENCE seq_RECOMMEND_num;
CREATE SEQUENCE seq_RECOMMEND_num
	INCREMENT BY 1					-- 1�� ����
	START WITH 400001				-- ���۰� 10000001
	MINVALUE 400001					-- �ּڰ� 10000001
	MAXVALUE 500000						-- �ִ��� ���Ѵ�
	nocycle							-- ��ȯ���� ����
	nocache							-- ĳ�� �� �� 
;
DROP SEQUENCE seq_REPORT_num;
CREATE SEQUENCE seq_REPORT_num
	INCREMENT BY 1					-- 1�� ����
	START WITH 500001				-- ���۰� 10000001
	MINVALUE 500001					-- �ּڰ� 10000001
	MAXVALUE 600000					-- �ִ��� ���Ѵ�
	nocycle							-- ��ȯ���� ����
	nocache							-- ĳ�� �� �� 
;

select * from P_MEMBER 
WHERE ID='apple' AND EMAIL='apple@gmail.com';

--�α��� 
SELECT * FROM P_MEMBER WHERE ID = 'apple' AND NAME = '���';

--���̵� ã��
SELECT * FROM P_MEMBER WHERE EMAIL = 'apple@gmail.com';

--��й�ȣ ã��
SELECT * FROM P_MEMBER WHERE ID = 'apple' AND EMAIL = 'apple@gmail.com';
UPDATE P_MEMBER SET PWD = '0001' WHERE ID = 'apple';
ROLLBACK;

--ȸ������
INSERT INTO EZEN.P_MEMBER (ID, PWD, NICK_NM, EMAIL) VALUES('apple', '0001', '���', 'apple@gmail.com');

--�г��� ����
UPDATE P_MEMBER SET NICK_NM = 'apple2' WHERE ID = 'apple';
ROLLBACK;

--ȸ��Ż�� / ȸ�� ����
DELETE FROM P_REPORT  WHERE ID = 'apple';
DELETE FROM P_RECOMMEND WHERE ID = 'apple';
DELETE FROM P_MESSAGE WHERE SENDER  = 'apple';
DELETE FROM P_MESSAGE WHERE RECIEVER  = 'apple';
DELETE FROM P_COMMENT WHERE ID = 'apple';
DELETE FROM P_BOARD WHERE ID = 'apple';		-- ORA-02292 ���Ἲ �������� ����
DELETE FROM P_MEMBER WHERE ID ='apple';		-- ORA-02292 ���Ἲ �������� ����
ROLLBACK;
COMMIT;

--	ȸ�� ��Ϻ���(������)
SELECT * FROM P_MEMBER;

-- ȸ�� �˻�(������)
SELECT * FROM P_MEMBER WHERE ID = 'apple';
SELECT * FROM P_MEMBER WHERE NICK_NM  = '���';

-- ��� ����(������)
SELECT * FROM P_MEMBER ORDER BY JOIN_DATE; 

--�Խ��� ��� ��ȸ(BOARD_NUM: 1 = �����Խ���, 2 = ����Խ���)
SELECT * FROM P_BOARD WHERE BOARD_NUM = 1;

--�Խ��� ī�װ��� ��ȸ(POST_CATE: ���Ӹ�)
SELECT * FROM P_BOARD WHERE POST_CATE  = 11;

--�Խñ� �˻�(����, ����, ����+����, �ۼ���)
SELECT * FROM P_BOARD WHERE POST_TITLE LIKE '%���%';
SELECT * FROM P_BOARD WHERE POST_CONTENT  LIKE '%���%';
SELECT * FROM P_BOARD WHERE POST_TITLE LIKE '%���%' OR POST_CONTENT  LIKE '%���%';
SELECT * FROM P_BOARD WHERE ID LIKE '%apple%';

-- �Խñ� ����
INSERT INTO EZEN.P_COMMENT (COM_NUM, ID, POST_NUM, COM_CONTENT)
VALUES(seq_COMMENT_num.nextval, 'apple', 100005, '���� ���');
ROLLBACK;

-- �Խñ� ����
UPDATE P_BOARD SET POST_TITLE = '��� �ƴϴ�', POST_CONTENT = '��¥ �ƴϴ�.', POST_CATE = '12', OFILE = 'test.txt'
WHERE POST_NUM = 100001;
ROLLBACK;

-- ��ȸ�� ����
UPDATE P_BOARD SET VISITCOUNT = VISITCOUNT + 1 WHERE POST_NUM = 100001;
ROLLBACK;

-- �Խñ� ��õ
INSERT INTO EZEN.P_RECOMMEND (REC_NUM, ID, POST_NUM) VALUES(seq_RECOMMEND_num.nextval, 'apple', 100001);
ROLLBACK;

-- �Խñ� ����õ(��õ 2�� ���� ��)
DELETE FROM P_RECOMMEND WHERE ID = 'apple' AND POST_NUM =100001;
ROLLBACK;

-- �Խñ� ����(��õ����, ��ȸ����)
SELECT * FROM P_BOARD WHERE BOARD_NUM = 1 ORDER BY VISITCOUNT;

SELECT A.*
	, B.RECOMMEND
FROM P_BOARD A, (
	SELECT COUNT(*) AS RECOMMEND
		, POST_NUM 
	FROM P_RECOMMEND 
	GROUP BY POST_NUM 
	ORDER BY COUNT(*) DESC) B
WHERE A.POST_NUM = B.POST_NUM;
	
-- �Խñ� �Ű� 
INSERT INTO EZEN.P_REPORT(REP_NUM, ID, POST_NUM)
VALUES(seq_REPORT_num.nextval, 'apple', 100002);
ROLLBACK;

-- �Խñ� �Ű� ����
DELETE FROM P_REPORT WHERE ID = 'apple' AND POST_NUM =100002;
ROLLBACK;

-- �Ű�� �Խñ� �� ��� ����(������)
SELECT A.*
	, B.REPORT
FROM P_BOARD A, (
	SELECT COUNT(*) AS REPORT
		, POST_NUM
	FROM P_REPORT
	WHERE POST_NUM  IS NOT NULL
	GROUP BY POST_NUM
	) B
WHERE A.POST_NUM = B.POST_NUM
;

-- ����������(��������)
INSERT INTO EZEN.P_MESSAGE (MSG_NUM, SENDER, RECIEVER, MSG_CONTENT)
VALUES(seq_MESSAGE_num.nextval, 'apple', 'banana', '�ٳ��� �� ���');
ROLLBACK;

-- ���� ������
SELECT * FROM P_MESSAGE WHERE RECIEVER = 'apple';

-- ���� ������
SELECT * FROM P_MESSAGE WHERE SENDER = 'apple';

-- ���� ����(�������� ����)
UPDATE P_MESSAGE SET MSG_READ = '����' WHERE MSG_NUM = 200001;
ROLLBACK;


 SELECT POST_NUM,
               id,
               POST_TITLE,
               POST_DATE,
               POST_CATE 
         FROM P_BOARD     
         WHERE POST_CATE =1
         ORDER by POST_NUM DESC;
        
        
        SELECT *FROM P_TOURIST 
        WHERE label LIKE '%����%';
       
       select POST_NUM, POST_TITLE, POST_CONTENT, ID, POST_DATE, VISITCOUNT,POST_CATE
       from(
       select POST_NUM, POST_TITLE, ID,POST_CONTENT, POST_DATE, VISITCOUNT,POST_CATE
    	from(
	       select POST_NUM, POST_TITLE,POST_CONTENT, ID, POST_DATE, VISITCOUNT,POST_CATE,
	       row_number() over(order by POST_NUM desc) as rNum
	      	FROM P_BOARD 
	      	WHERE POST_CATE like 1
       		)
       	 	 where rNum between 1 and 10
       	 	  order by POST_NUM desc
       	)
       	  where POST_TITLE like '%' || '3' || '%' AND post_cate = 1;
        
       
--����¡
select POST_NUM, POST_TITLE, ID,POST_CONTENT, POST_DATE, VISITCOUNT,POST_CATE
    from (
        select POST_NUM, POST_TITLE,POST_CONTENT, ID, POST_DATE, VISITCOUNT,POST_CATE,
            row_number() over(order by POST_NUM desc) as rNum
        from P_BOARD
    )
    WHERE rNum between 1 and 10 
        order by POST_NUM desc;
       
--����¡ �˻�
 select POST_NUM, POST_TITLE, POST_CONTENT, ID, POST_DATE, VISITCOUNT
    from (
        select POST_NUM, POST_TITLE, POST_CONTENT, ID, POST_DATE, VISITCOUNT,
            row_number() over(order by POST_NUM desc) as rNum
        from P_BOARD
            where POST_TITLE like '%' || 'zz' || '%' 
        ) mb
    where rNum between 1 and 10  
        order by POST_NUM desc;  
       
 --�˻�����
   select count(POST_NUM)
  from P_BOARD
   where LIKEHIT  > 0;
   
 select count(post_num)
		from p_board1
		where POST_TITLE like '%' || 'a' || '%'
  			 and post_num > 0;       
               
 --����¡


       
       update p_board set 
	LIKEHIT = LIKEHIT+1
	where POST_NUM = 1297;

UPDATE P_BOARD
SET LIKEHIT = + 1
WHERE POST_NUM=1269;



insert into l_board(LIKENO , POST_NUM , id) 
	values((SELECT NVL(MAX(likeno), 0) + 1 FROM l_board) ,1270 ,'apple');

	delete from l_board where post_num = 1304;

update p_board set 
	LIKEHIT = LIKEHIT+1
	where POST_NUM = 1269;

update l_board set LIKECHECK = 1
	where post_num = 1269 and id = 'apple';


SELECT * FROM P_imageFile
         WHERE POST_NUM = 8
         ORDER BY IMAGEFILENO;  
        
select count(contentsid)
  from P_tourist
   where contentsid > 0
                and title like '%' || '�ɺ�' || '%';  

select count(contentsid)
  from P_tourist
   where contentsid > 0;

               
               
                
 UPDATE EZEN.P_BOARD
SET ID='apple', SINHIT=5 
WHERE POST_NUM=20;

select POST_NUM, POST_TITLE, POST_CONTENT, ID, POST_DATE,
		VISITCOUNT,likehit,sinhit
		from (
		select POST_NUM, POST_TITLE, POST_CONTENT, ID,
		POST_DATE,likehit,sinhit,
		VISITCOUNT,
		row_number() over(order by POST_NUM desc)
		as rNum
		from
		P_BOARD
		WHERE  sinhit>2
		) mb
		where rNum between 1 and 10
		order by POST_NUM DESC;
	
	select count(post_num)
		from p_board1
		where SINHIT >=1;
	
	
	
	
		select *
   			 from (
        	select pt.*, row_number() over(order by label desc) as rNum
        	from P_TOURIST pt
        	) mb
   		 	where rNum between 1 and 10;

   		 SELECT count(POST_NUM)
			FROM P_BOARD 
		WHERE post_title like '%' || 'z' || '%';
			
select *
   			 from (
        	select pt.*, row_number() over(order by label desc) as rNum
        	from P_TOURIST pt 
        	WHERE label LIKE '������' AND ALLTAG  NOT LIKE '%����%' AND title like '%' || '����' || '%'
        	) mb
   		 	where rNum between 1 and 10;
   		 	
   SELECT *FROM P_TOURIST  
   WHERE title like '%' || '�Ե�' || '%';
  
 SELECT 
(SELECT COUNT(*) FROM P_BUSANEXPERIENCE)P_BUSANEXPERIENCE,
(SELECT COUNT(*) FROM P_BUSANFESTIVAL)P_BUSANFESTIVAL, 
(SELECT COUNT(*) FROM P_BUSANTOURIST)P_BUSANTOURIST
FROM DUAL;
   
select 
    A.*, 
    B.*, 
    C.*  
from 
    A inner join 
    B on A.idx = B.idx left outer join 
    C on A.install = C.install
order by 
    A.idx ASC
  
 SELECT COUNT(*)  
  from(  
 SELECT P_BUSANEXPERIENCE.UC_SEQ ,
 		P_BUSANFESTIVAL.UC_SEQ ,
 		P_BUSANTOURIST.UC_SEQ 
 FROM
 	P_BUSANEXPERIENCE inner join 
 	P_BUSANFESTIVAL ON P_BUSANEXPERIENCE.UC_SEQ = P_BUSANFESTIVAL.UC_SEQ inner join 
 	P_BUSANTOURIST ON P_BUSANEXPERIENCE.UC_SEQ = P_BUSANTOURIST.UC_SEQ 
 	);
 	
 
 
 select sum(total) from (select count (*) as total from P_BUSANEXPERIENCE union all select count (*) as total from P_BUSANFESTIVAL union all select count (*) as total from P_BUSANTOURIST);
 
SELECT sum(total)
FROM (
   SELECT count(*) total
   FROM P_BUSANEXPERIENCE
   WHERE place LIKE '%' || '�Ե�' || '%'
   UNION
   SELECT count(*) total
   FROM P_BUSANFESTIVAL
   WHERE place LIKE '%' || '�Ե�' || '%'
   UNION
   SELECT count(*) total
   FROM P_BUSANTOURIST
   WHERE place LIKE '%' || '�Ե�' || '%'
);



select * FROM (
	SELECT ROWNUM  rn,z.* 
		from(SELECT * FROM P_BOARD ORDER BY post_num DESC)z		
)
WHERE rn BETWEEN 1 AND 10;




        	
   		 	
   		 	
  
