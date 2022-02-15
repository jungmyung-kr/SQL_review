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


--010. 비교연산자 1 ' 같지 않다'
-- 직책이 MANAGER이 아닌 모든 사원의 이름과 부서번호, 직책을 출력하라. 

SELECT ename,deptno, job 
FROM emp
WHERE job^= 'SALESMAN'; -- '같지 않다' 역할을 하는 연산자 사용. 


--011. 비교연산자 2 'between ... and ...'
-- 월급이 500 이상 1500 이하인 사원의 사번, 이름과 연봉을 출력하라. 

SELECT empno, ename, sal
FROM emp
WHERE sal BETWEEN 500 AND 1500; -- 조건절에 between and 구문을 사용해 범위를 지정한다. 

--012. 비교연산자 3 'like'
-- 이름의 두번째 글자가 M인 모든 사원의 이름과 입사일을 출력하라. 

SELECT ename, hiredate
FROM emp
WHERE ename like '_M%'; -- 한자리의 문자열을 대신하는 와일드카드 _와 갯수 상관없이 대신하는 %를 사용.


--013. 비교연산자 4 'is null'
-- 커미션이 기입되어 있지 않은 모든 직원의 사번, 이름, 직책, 월급, 커미션을 출력한다. 

SELECT empno, ename, job,sal, comm
FROM emp
WHERE comm IS NULL; -- 0이 아닌 null 값만 출력됨. 


-- 014. 비교연산자 5 'in'
-- 직책이 SALESMAN, ANALYST, MANAGER인 사원들의 이름, 월급, 직책을 출력하라.

SELECT ename, sal, job
FROM emp
WHERE job IN ('SALESMAN', 'ANALYST', 'MANAGER');


-- 015. 비교연산자 6 'and','or','not'
-- 월급이 1000 이상이면서 직책이 SALESMAN인 사람의 이름과 입사일, 월급, 직책을 출력하라. 

SELECT ename, hiredate, sal, job
FROM emp
WHERE sal>= 1000 AND job='SALESMAN';


--016. 대소문자 변환 함수 'upper', 'lower', 'inicap'
-- 이름이 SCOTT인 사원의 이름과 월급을 출력하되,, 소문자로 검색해도 출력되게 하라.

SELECT ename, sal
FROM emp
WHERE LOWER(ename)='scott'; --전부 소문자로 변환하는 명령어 'lower' 사용


--017. 문자에서 특정 철자 추출 'substr'
-- 사원 테이블에서 이름을 출력하되 이름 첫글자만 소문자로 출력하라. 

SELECT lower(substr(ename, 1,1)) -- 소문자로 출력하는 lower과 특정 문자를 추출하는 substr 명령어 결합.
FROM emp;


--018. 문자열의 길이출력 'length'
-- 이름 철자의 길이가 5이상인 사원의 이름, 길이를 출력하라

SELECT ename, length(ename)
FROM emp
WHERE length(ename)>=5;


--019. 특정 철자의 위치 출력 'instr'
--이름에 s가 들어가는 사원의 이름을 출력 

SELECT ename
FROM emp
WHERE instr(ename,'S')>0; 
-- instr 명령어로 s가 들어간 문자열을 출력하면 몇번째 자리에 있는지를 출력.
--0보다 큰 숫자를 출력된다는 것 자체가 s가 포함된 ename을 의미하므로 비교연산자를 함께 사용함. 


--020. 특정 철자를 다른 철자로 변경 'replace'
--모든 직원의 이름과 월급을 출력하되, 월급의 0은 *로 출력하라. 

SELECT ename, REPLACE(sal,0,'*') 월급 
FROM emp; 


--021. 특정철자 N개만큼 채우기 'rpad', 'lpad'
-- 사원의 이름과 월급을 출력하되 다음을 만족하는 형식으로 출력하라. 
-- 월급 컬럼: 총 10자리, 출력 후 남은자리 오른쪽에 *로 채우기.

SELECT ename, rpad(sal, 10, '*')
FROM emp;

--022. 특정 철자 잘라내기 'trim', 'rtrim', 'ltrim'
-- 사원의 이름과 월급을 출력하되, 월급의 마지막 자리 0 하나를 잘라내라. 

SELECT ename, rtrim(sal,0)
FROM emp;


--023. 반올림 해서 출력 'round'
--사원테이블에서 사원의 이름과 월급의 12%를 출력하되, 소수점 이하는 반올림 처리하라. 

SELECT ename, ROUND(sal*0.12)
FROM emp;


--024. 숫자 버리고 출력 'trunc'
-- 사원테이블에서 사원의 이름과 월급의 12%를 출력하되, 소수점 이하는 버려라.

SELECT ename, trunc(sal*0.12)
FROM emp;


--025. 나눈 나머지값 'mod'
-- 사원번호가 홀수인 사원들의 이름, 사번을 출력하라. 

SELECT ename, empno
FROM emp
WHERE mod(empno,2)=1; -- 2로 나눠서 나머지가 1인 숫자가 홀수이므로 


--026. 날짜간 개월 수 출력 'months_between'
-- 사원테이블에서 사원 이름과 입사 후 오늘까지 몇 달 근무했는지 출력하라. 

SELECT ename, months_between(SYSDATE,hiredate) -- 오늘 날짜를 기입하기 위해 sysdate 사용 
FROM emp; 


--027. 개월 수 더한 날짜 출력 'add_months'
-- 2019/05/01부터 100개월 뒤의 날짜는?

SELECT add_months ('2019/05/01', 100)
FROM dual;


--028. 특정 날짜 뒤에 오는 요일 날짜 출력 'next_day'
--2021/05/05로부터 바로 돌아오는 월요일의 날짜를 구하시오.

SELECT next_day('2021/05/05','월요일')
FROM dual;

--029. 특정 날짜가 있는 달의 마지막 날짜 출력하기 'last_day'
-- 오늘부터 이달 말일까지 총 며칠 남았는지 구하시오.

SELECT last_day(sysdate) - sysdate
FROM dual;


--030. 문자형으로 데이터 유형 변환 'to_char'
-- 수요일에 입사한 사원들의 이름, 입사일, 입사요일을 출력하시오.

SELECT ename, hiredate, TO_CHAR(hiredate, 'DAY') --날짜형 데이터를 문자형, 그중에서 요일로 변경해주기 위해 to_char 명령어와 day 사용
FROM emp
WHERE TO_CHAR(hiredate,'DAY') = '수요일';


--031. 날짜형으로 데이터 유형 변환 'to_date'
--1981년 입사한 사원들의 이름, 입사일을 출력하되, 최근 입사한 사원부터 정렬하라. 

SELECT ename, hiredate 
FROM emp
WHERE hiredate BETWEEN TO_DATE('1981/01.01','YYYY/MM/DD') AND TO_DATE('1981/12/31','YYYY/MM/DD')+1
ORDER BY hiredate DESC;
--날짜의 개념이 81/12/31 0h 0m 0s이기 때문에 마지막 일까지 포함해서 출력하기 위해 +1


--032. 암시적 형 변환 
-- 다음 쿼리문의 실행 여부를 판단하라. 

SELECT ename, sal
FROM emp
WHERE sal = '3000'; 
-- 실행은 되나 권장 사항 아님. 

/*
DESC emp;를 통해 해당 컬럼의 데이터 유형을 확인해보면 숫자형인 것을 알 수 있음. 
숫자형인 데이터에 따옴표를 두름으로써 문자형으로 만들어준 셈. 
오라클이 자체적으로 데이터 유형을 바꿔 출력해줌. 
보다 복잡한 쿼리의 경우 출력 속도를 늦출 수 있으므로 데이터 형을 맞춰서 코딩하는 것이 좋음.
*/


--033. NULL 값 대신 다른 데이터 출력하기 'nvl'
--사원들의 이름과 커미션을 출력하되, 커미션이 NULL이면 no comm이 출력되게 하라. 

SELECT ename, NVL(TO_CHAR(comm), 'no comm') -- comm 컬럼의 데이터 형은 숫자, 변환할 데이터 형은 문자이므로 TO_CHAR 명령어를 사용한다.
FROM emp;


--034. IF문 SQL로 구현하기 'decode'
-- 사원의 이름과 부서번호, 보너스를 출력하라. 
-- 보너스는 다음과 같다. 부서번호 10: 300 / 20: 400 / 나머지는 없음. 

SELECT ename, deptno, decode(deptno,10,300,20,400,0) AS 보너스
FROM emp;


--035. IF문 SQL로 구현하기 'case'
--직업이 SALESMAN,  ANALYST인 사원의 이름, 직업, 월급, 보너스를 출력하라.
--단, 월급 3000 이상의 보너스는 500 / 2000 이상은 300 / 1000 이상은 200/ 그외 0 

SELECT ename, job, sal, CASE WHEN sal>= 3000 THEN 500
                                                     WHEN sal>= 2000 THEN 300
                                                     WHEN sal>= 1000 THEN 200 ELSE 0 END AS 보너스
FROM emp;
--부등호 사용을 위해 DECODE가 아닌 CASE 사용


--036. 최댓값 출력하기 'max'
-- SALESMAN의 최대 월급을 출력하라. 

SELECT MAX(sal)
FROM emp
WHERE job='SALESMAN';

--추가. SALESMAN의 최대 월급과 직업명을 출력하라. 

SELECT job, MAX(sal)
FROM emp
WHERE job='SALESMAN'
GROUP BY job;  --조건절 이후에 group by로 job을 그룹핑해 코딩 오류 방지.


--037. 최소값 출력하기 'min'
-- 사원 테이블에서 부서 번호와 부서 번호 별 최소 월급을 출력하라. 

SELECT deptno, MIN(sal)
FROM emp
GROUP BY deptno; -- emp 테이블에서 deptno 즉 부서번호별로 그룹핑을 한 후, 최소 월급을 출력하는 구조.

--038. 평균값 출력하기 'avg'
-- 사원테이블에서 직업, 직업별 평균 월급을 출력하되, 가장 높은 값부터 출력하라. 

SELECT job, ROUND(AVG(sal))
FROM emp
GROUP BY job
ORDER BY AVG(sal) DESC;


--039. 토탈값 출력하기 'sum'
--1981년에 입사한 사원들의 월급 총합을 구하라.

SELECT SUM(sal)
FROM emp
WHERE TO_CHAR(hiredate,'YYYY') = '1981';


--040. 건수 출력하기 'count'
-- 직업과 직업별 인원 수를 출력하되, SALESMAN은 제외하라. 

SELECT job, count(*) "인원 수"
FROM emp
WHERE job ^= 'SALESMAN'
GROUP BY job;


--041. 데이터 분석 함수로 순위 출력 'rank'
-- 부서번호가 20인 사원들의 이름, 부서번호, 월급, 월급의 순위를 출력하라. 

SELECT ename, deptno, sal, RANK() OVER (ORDER BY sal DESC) "월급의 순위"
FROM emp
WHERE deptno=20;


--042. 데이터 분석 함수로 순위 출력 2 'dense_rank'
--직업, 이름, 월급, 월급의 순위를 출력하되, 순위가 직업별로 각각 월급이 높은 사원 순으로 출력하라. 

SELECT job, ename, sal, 
               DENSE_RANK() OVER (PARTITION BY job ORDER BY sal DESC) "월급의 순위"
FROM emp;