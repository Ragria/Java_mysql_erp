select user(), database();

-- 내 스키마
CREATE SCHEMA erp;

-- 직책
CREATE TABLE erp.title (
	code int(4)      NOT NULL COMMENT '직책코드', -- 직책코드
	name VARCHAR(50) NOT NULL COMMENT '직책명' -- 직책명
)
COMMENT '직책';

-- 직책
ALTER TABLE erp.title
	ADD CONSTRAINT PK_title -- 직책 기본키
		PRIMARY KEY (
			code -- 직책코드
		);

-- 부서
CREATE TABLE erp.department (
	code  int(4)      NOT NULL COMMENT '부서코드', -- 부서코드
	name  VARCHAR(50) NOT NULL COMMENT '부서명', -- 부서명
	floor INTEGER     NULL     COMMENT '위치' -- 위치
)
COMMENT '부서';

-- 부서
ALTER TABLE erp.department
	ADD CONSTRAINT PK_department -- 부서 기본키
		PRIMARY KEY (
			code -- 부서코드
		);

-- 사원
CREATE TABLE erp.imployee (
	empno   int(4)      NOT NULL COMMENT '사원코드', -- 사원코드
	empname VARCHAR(50) NULL     COMMENT '사원명', -- 사원명
	code    int(4)      NULL     COMMENT '직책', -- 직책
	manager int(4)      NULL     COMMENT '직속상사', -- 직속상사
	salary  INTEGER     NULL     COMMENT '급여', -- 급여
	dno     int(4)      NULL     COMMENT '부서' -- 부서
)
COMMENT '사원';


-- 사원
ALTER TABLE erp.imployee
	ADD CONSTRAINT PK_imployee -- 사원 기본키
		PRIMARY KEY (
			empno -- 사원코드
		);

-- 사원
ALTER TABLE erp.imployee
	ADD CONSTRAINT FK_title_TO_imployee -- 직책 -> 사원
		FOREIGN KEY (
			code -- 직책
		)
		REFERENCES erp.title ( -- 직책
			code -- 직책코드
		);

-- 사원
ALTER TABLE erp.imployee
	ADD CONSTRAINT FK_department_TO_imployee -- 부서 -> 사원
		FOREIGN KEY (
			dno -- 부서
		)
		REFERENCES erp.department ( -- 부서
			code -- 부서코드
		);

-- 사원
ALTER TABLE erp.imployee
	ADD CONSTRAINT FK_imployee_TO_imployee -- 사원 -> 사원
		FOREIGN KEY (
			manager -- 직속상사
		)
		REFERENCES erp.imployee ( -- 사원
			empno -- 사원코드
		);
		
INSERT 
	INTO imployee
	VALUES (0001, 이름1, 사장, NULL, 5000000, 1),
		 (0002, 이름2, 사장, NULL, 5000000, 1),
		 (0003, 이름3, 사장, NULL, 5000000, 1),
		 (0004, 이름4, 사장, NULL, 5000000, 1),
		 (0005, 이름5, 사장, NULL, 5000000, 1);

select *
	from imployee;
	