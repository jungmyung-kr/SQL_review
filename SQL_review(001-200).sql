--SQL 200제 예제 풀이 

-- 001.  테이블에 있는 특정 컬럼 선택해 조회하기 

SELECT ename, job, sal -- 조회하고 싶은 특정 컬럼의 이름을 콤마(,)와 함께 나열 
FROM emp; -- 테이블 명


--002. 테이블에 있는 모든 열 출력

SELECT * -- 테이블 내 모든 열을 출력하게 해주는 와일드카드 *
FROM emp; -- 테이블 명


--003. 컬럼의 별칭을 지정해 출력하기

SELECT ename AS "사원명", job AS "직책", sal AS "월급" --컬럼 뒤에 AS로 연결하고 별칭을 작성
FROM emp; -- 테이블 명


 --004. 연결 연산자를 사용해 출력하기 
 
 --  연결 연산자를 사용해 emp 테이블의 사원들의 이름과 직업을 출력하라. 
 -- 출력 형식: ename의 직업은 job입니다. 
 
 SELECT ename || '의 직업은 ' || job || '입니다.' -- 컬럼과 컬럼 사이에 || 연결 연산자를 사용해 원하는 문장을 구성
 FROM emp; -- 테이블 명
 
 
 --005. 중복된 데이터 제거 
 
 -- 회사 내 직책을 중복없이 출력하라. 
 
SELECT DISTINCT job -- 중복된 값을 제거하는 명령어 distinct
FROM emp;
 
 --006. 데이터 정렬
 
 -- 사원의 이름, 직책, 월급을 출력하되, 월급이 높은 사람부터 정렬하라. 
 
 SELECT ename, job, sal
 FROM emp
 ORDER BY sal DESC; -- 정렬을 위한 명령어: order by  / 디폴트: 오름차순 / 내림차순으로 정렬시 desc를 컬럼명 뒤에 기재

 
--007. WHERE절 1 (숫자 데이터 검색)

-- emp 테이블에서 월급이 3000인 사람의 이름과, 직책을 출력하라. 

SELECT ename, job
FROM emp
WHERE sal = 3000; -- 검색할 조건을 정해주는 WHERE절. 


--008. WHERE절 2 (문자, 날짜 검색)

-- emp 테이블에서 직책이 SALESMAN인 사람의 이름과 월급, 부서번호를 출력하라. 

SELECT ename, sal, deptno
FROM emp
WHERE job = 'SALESMAN'; -- 문자 혹은 날짜 조건을 줄 경우 '' 혹은 ""을 둘러줘야 함


--009. 산술 연산자 +, -, *, /

-- emp 테이블에서 연봉이 36000 이상인 사원의 이름과 연봉을 출력하라. 

SELECT ename, sal*12 AS 연봉
FROM emp
WHERE sal*12 >=36000; -- 연봉은 월급x12개월이므로 곱하기 연산자 *를 사용한다. 
-- 실행 순서는 where 절이 select 절에 앞서므로 sal*12 대신 '연봉'을 지정하면 오류