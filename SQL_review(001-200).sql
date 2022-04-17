--SQL 200제 예제 풀이 

--SQL 기초실무 - 입문편 (001-015)

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

--SQL 기초실무 - 기초편 (016-055)

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


--043. 데이터 분석 함수로 등급 출력하기 'ntile'
--작성법: ntile (나눌 등급의 수) over ( order by 기준 컬럼 desc/asc)
--이름, 입사일, 입사한 사원 순으로 등급을 나누는데 등급을 5등급으로 나눠서 출력하시오. 

SELECT ename, hiredate, NTILE(5) OVER (ORDER BY hiredate ASC) 등급
FROM emp;


--044. 데이터 분석 함수로 순위 비율 출력하기 'cume_dist'
-- 작성법: cume_dist () over (order by 기준 컬럼 desc/asc) 
--부서번호, 이름과 월급과 월급의 순위에 대한 비율을 출력하세요. 순위 비율이 부서번호별로 각각 출력되게 하시오. 

SELECT deptno, ename, sal, ROUND(CUME_DIST() OVER (PARTITION BY deptno ORDER BY sal DESC),2) 비율 
FROM emp; -- 해당 함수는 group by가 아닌 partition by를 사용하여 부서번호별로 출력되게 설정함.


--045. 데이터 분석 함수로 데이터를 가로로 출력하기 'listagg'
-- 작성법: listagg(컬럼명,"붙일 구분자 또는 기호") within group (order by 기준 컬럼) / GROUP BY (그룹핑할 컬럼) 
-- 직업, 직업별로 속한  사원들의 이름을 가로로 출력하는 데 가로로 출력될 때에 월급이 높은 사원부터 출력되게 하시오. 

SELECT job, LISTAGG (ename, ',') WITHIN GROUP (ORDER BY sal DESC)
FROM emp
GROUP by job;


--046. 데이터 분석 함수로 바로 전 행과 다음 행 출력하기 'lag', 'lead'
-- 작성법: lag(컬럼명, 행번호) over (order by 기준 컬럼) / lead (컬럼명, 행번호) over ( order by sal 기준컬럼)
-- 이름, 입사일, 바로 전에 입사한 사원과의 간격일을 출력하세요. 

SELECT ename, hiredate, hiredate - LAG(hiredate,1) OVER (ORDER BY hiredate asc)"간격일"
FROM emp;


--047. ROW를 COLUMN으로 출력하기1  'sum+decode'
-- 직업, 직업별 토탈 월급을 가로로 출력하라. 

SELECT job,SUM(sal)
FROM emp
GROUP BY job;  --해당 쿼리문을 통해서 직업명을 먼저 조회해봄. 

SELECT SUM(DECODE(job,'CLERK',sal,NULL)) as CLERK,
               SUM(DECODE(job,'SALESMAN',sal,NULL)) as SALESMAN,
               SUM(DECODE(job,'MANAGER',sal,NULL)) as MANAGER,
               SUM(DECODE(job,'ANALYST',sal,NULL)) as ANALYST,
               SUM(DECODE(job,'PRESIDENT',sal,NULL)) as PRESIDENT
FROM emp;  --조회된 직업명을 바탕으로 SUM을 구하고, 컬럼명을 별칭으로 설정한다. 


--048. ROW를 COLUMN으로 출력하기2 'pivot'
--작성법: pivot(그룹함수 for 기준컬럼 in (데이터1, 데이터2,...))
--직업과 직업별 토탈 월급을 pivot문을 이용하여 가로로 출력하세요.

SELECT distinct job FROM emp;--  해당 기능을 통해 일단 중복되지 않는 모든 직업명 확인 후 PIVOT문 작성

SELECT *
FROM (SELECT job, sal FROM emp)
PIVOT (SUM (sal) for job in ( 'CLERK', 'SALESMAN', 'PRESIDENT', 'MANAGER', 'ANALYST'));


--049. COLUMN을 ROW로 출력하기 'unpivot'
--작성법: unpivot( 출력할 컬럼이름 for 데이터가 출력될 컬럼이름 in (데이터1, 데이터2,....))
-- 범죄 원인 테이블을 생성하고 방화사건의 가장 큰 원인이 무엇인지 출력하세요

create table crime_cause
(crime_type  varchar2(30),
생계형  number(10),
유흥 number(10),
도박 number(10),
허영심 number(10),
복수  number(10),
해고  number(10),
징벌 number(10),
가정불화  number(10),
호기심 number(10),
유혹  number(10),
사고   number(10),
불만   number(10), 
부주의   number(10),
기타   number(10)  );

 insert into crime_cause values( '살인',1,6,0,2,5,0,0,51,0,0,147,15,2,118);
 insert into crime_cause values( '살인미수',0,0,0,0,2,0,0,44,0,1,255,38,3,183);
 insert into crime_cause values( '강도',631,439,24,9,7,53,1,15,16,37,642,27,16,805);
 insert into crime_cause values( '강간강제추행',62,19,4,1,33,22,4,30,1026,974,5868,74,260,4614);
 insert into crime_cause values( '방화',6,0,0,0,1,2,1,97,62,0,547,124,40,339);
 insert into crime_cause values( '상해',26,6,2,4,6,42,18,1666,27,17,50503,1407,1035,22212);
 insert into crime_cause values( '폭행',43,15,1,4,5,51,117,1724,45,24,55814,1840,1383,24953);
 insert into crime_cause values( '체포감금',7,1,0,0,1,2,0,17,1,3,283,17,10,265);
 insert into crime_cause values( '협박',14,3,0,0,0,10,11,115,16,16,1255,123,35,1047);
 insert into crime_cause values( '약취유인',22,7,0,0,0,0,0,3,8,15,30,6,0,84);
 insert into crime_cause values( '폭력행위등',711,1125,12,65,75,266,42,937,275,181,52784,1879,1319,29067);
 insert into crime_cause values( '공갈',317,456,12,51,17,116,1,1,51,51,969,76,53,1769);
 insert into crime_cause values( '손괴',20,4,0,1,3,17,8,346,61,11,15196,873,817,8068);
 insert into crime_cause values( '직무유기',0,1,0,0,0,0,0,0,0,0,0,0,18,165);
 insert into crime_cause values( '직권남용',1,0,0,0,0,0,0,0,0,0,1,0,12,68);
 insert into crime_cause values( '증수뢰',25,1,1,2,5,1,0,0,0,10,4,0,21,422);
 insert into crime_cause values( '통화',15,11,0,1,1,0,0,0,6,2,5,0,2,44);
 insert into crime_cause values( '문서인장',454,33,8,10,37,165,0,16,684,159,489,28,728,6732);
 insert into crime_cause values( '유가증권인지',23,1,0,0,2,3,0,0,0,0,3,0,11,153);
 insert into crime_cause values( '사기',12518,2307,418,225,689,2520,17,47,292,664,3195,193,4075,60689);
 insert into crime_cause values( '횡령',1370,174,58,34,86,341,3,10,358,264,1273,23,668,8697);
 insert into crime_cause values( '배임',112,4,4,0,30,29,0,0,2,16,27,1,145,1969);
 insert into crime_cause values( '성풍속범죄',754,29,1,6,12,100,2,114,1898,312,1051,60,1266,6712);
 insert into crime_cause values( '도박범죄',1005,367,404,32,111,12969,4,8,590,391,2116,9,737,11167);
 insert into crime_cause values( '특별경제범죄',5313,91,17,28,293,507,31,75,720,194,9002,1206,6816,33508);
 insert into crime_cause values( '마약범죄',57,5,0,1,2,19,3,6,399,758,223,39,336,2195);
 insert into crime_cause values( '보건범죄',2723,10,6,4,63,140,1,6,5,56,225,6,2160,10661);
 insert into crime_cause values( '환경범죄',122,1,0,2,1,2,0,0,15,3,40,3,756,1574);
 insert into crime_cause values( '교통범죄',258,12,3,4,2,76,3,174,1535,1767,33334,139,182010,165428);
 insert into crime_cause values( '노동범죄',513,11,0,0,23,30,0,2,5,10,19,3,140,1251);
 insert into crime_cause values( '안보범죄',6,0,0,0,0,0,1,0,4,0,4,23,0,56);
 insert into crime_cause values( '선거범죄',27,0,0,3,1,0,2,1,7,15,70,43,128,948);
 insert into crime_cause values( '병역범죄',214,0,0,0,2,7,3,35,2,6,205,50,3666,11959);
 insert into crime_cause values( '기타',13872,512,35,55,552,2677,51,455,2537,1661,18745,1969,20957,87483);

commit;

SELECT * 
FROM crime_cause
UNPIVOT ( 건수 for 원인 in (생계형, 유흥, 도박, 허영심, 복수, 해고, 징벌, 가정불화, 호기심, 유혹, 사고, 불만, 부주의, 기타))
WHERE crime_type='방화'
ORDER BY 건수 DESC;


--050. 데이터 분석 함수로 누적 데이터 출력하기 'sum over'
-- 작성법: sum(컬럼명) over ( order by 기준컬럼 [rows between unbounded preceding and current row] )
-- 부서번호가 20번인 사원들의 사원이름, 월급, 월급에 대한 누적치가 출력되게 하세요.

SELECT ename, sal, SUM(sal) OVER (ORDER BY empno) "월급에 대한 누적치"
FROM emp
WHERE deptno=20;


--051. 데이터 분석 함수로 비율 출력하기  'ratio_to_report'
--작성법: ratio_to_report(컬럼명) over()
-- 부서번호가 20번인 사원들의 사원번호, 이름, 월급, 월급에 대한 비율을 출력하세요.

SELECT empno, ename, sal, ROUND(ratio_to_report(sal) over (),2) "월급에 대한 비율"
FROM emp
WHERE deptno=20;


--052. 데이터 분석 함수로 집계 결과 출력하기1 'rollup'
-- 작성법: group by절에 rollup(기준컬럼)
-- 부서번호, 부서번호별 토탈월급을 출력하는데 맨 아래에 전체 토탈월급이 출력되게 하세요

SELECT deptno, sum(sal)
FROM emp
GROUP BY rollup(deptno);


--053. 데이터 분석 함수로 집계 결과 출력하기2  'cube'
-- 작성법: group by절에 cube(기준컬럼)
-- 입사한 년도(4자리), 입사한 년도별 토탈월급을 출력하는데 맨위에 사원 테이블의 전체 토탈월급이 출력되게 하세요. 

SELECT to_char(hiredate,'YYYY') 입사년도, sum(sal) "입사년도별 토탈월급" 
FROM emp
GROUP by CUBE(to_char(hiredate,'YYYY'));


--054. 데이터 분석 함수로 집계 결과 출력하기3 'grouping sets'
-- 작성법: group by grouping sets (기준컬럼1, 기준컬럼2,....)
-- 주의사항: 기준컬럼들이 동시에 묶인 결과를 출력할지, 단일 결괄르 출력할지에 따라 괄호를 적절하게 활용해야 한다. 
-- 입사한 년도(4자리)별 토탈월급과 직업별 토탈월급을 위아래로 같이 출력하세요.

SELECT to_char(hiredate,'YYYY'), job,sum(sal)
FROM emp
GROUP BY GROUPING SETS ((to_char(hiredate,'YYYY')),( job));


--055. 데이터 분석 함수로 출력 결과 넘버링하기 'row_number'
-- 작성법: row_number () over(order by 기준컬럼)
-- 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하는데 출력하는 결과 맨 끝에 번호를 넘버링 해서 출력하세요.

SELECT ename, sal, ROW_NUMBER() OVER (ORDER BY empno ASC) 번호
FROM emp
WHERE sal BETWEEN 1000 AND 3000;


--SQL 기초실무 - 중급편 (056-092)

--056. 출력되는 행 제한하기1 'rownum'
 -- 직업이 SALESMAN인 사원들의 이름과 월급과 직업을 출력하는데 맨위의 행 2개만 출력하세요.
 
 SELECT ename, sal, job
 FROM emp
 WHERE job='SALESMAN' AND rownum <=2;


--057. 출력되는 행 제한하기2 'simple TOP-n queries)
-- 최근에 입사한 사원순으로 이름, 입사일과 월급을 출력하는데 맨위의 5명만 출력하세요.

SELECT ename, hiredate, sal
FROM emp
ORDER BY hiredate DESC 
FETCH FIRST 3 ROWS ONLY;


--058. 여러 테이블의 데이터를 조인해서 출력하기1 'equi join'
-- DALLAS에서 근무하는 사원들의 이름과 월급과 부서위치를 출력하세요

SELECT e.ename, e.sal, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND d.loc='DALLAS';

--059. 여러 테이블의 데이터를 조인해서 출력하기2 'non equi join'
-- 급여 등급이 4등급인 사원들의 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하세요


drop  table  salgrade;
 
create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );
 
insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);
 
commit;

SELECT e.ename, e.sal
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal AND s.grade = 4  --emp와 salgrade 컬럼은 공통 컬럼이 없음. 유사한 성격을 가진 컬럼으로 조인함.
ORDER BY e.sal DESC;


--060. 여러 테이블의 데이터를 조인해서 출력하기3 'outer join'
-- 사원 테이블 전체에 이름과 부서위치를 출력하는데 JACK도 출력되게 하시오.

INSERT INTO emp(empno, ename,sal, deptno)
VALUES (7122, 'JACK', 3000, 70);

COMMIT;

SELECT e.ename, d.loc
FROM emp e, dept d
WHERE e.deptno=d.deptno(+);


--061. 여러 테이블의 데이터를 조인해서 출력하기4 'self join'
-- 사원이름과 직업을 출력하고 관리자 이름과 관리자의 직업을 출력하시오.
-- 조건: 관리자인 사원들보다 더 많은 월급을 받는 사원들의 데이터만 출력하시오. 

SELECT 사원.ename 사원이름, 사원.sal 월급, 관리자.ename 관리자, 관리자.job 직업 
FROM emp 사원, emp 관리자
WHERE 사원.mgr = 관리자.empno AND 사원.sal > 관리자.sal;  -- 동일한 테이블 내에서 조인이 필요한 경우.


--062. 여러 테이블의 데이터를 조인해서 출력하기5 'on절' (ANSI조인)
-- 월급이 1000에서 3000 사이인 사원들의 이름과 월급과 부서위치를  on절을 사용한 조인문법으로 출력하세요.

SELECT e.ename, e.sal, d.loc
FROM emp e JOIN dept d
ON (e. deptno = d.deptno)
WHERE e.sal BETWEEN 1000 AND 3000;


--063. 여러 테이블의 데이터를 조인해서 출력하기5 'using절'
--using절을 사용한 조인문법으로 부서위치가 DALLAS인 사원들의 이름과 월급과 부서위치를 출력하세요.

SELECT e.ename, e.sal, d.loc
FROM emp e, dept d 
USING( deptno )
WHERE d.loc = 'DALLAS';

--064. 여러 테이블의 데이터를 조인해서 출력하기6 'natural join' (ANSI)
--직업이 SALESMAN이고 부서번호가 30번인 사원들의 이름과 직업과 월급과 부서위치를 출력하세요 .

SELECT e.ename, e.job, e.sal, d.loc
FROM emp e NATURAL JOIN dept d
WHERE e.job ='SALESMAN' AND deptno=30; -- 주의: natural 조인에서 공통으로 가지고 있는 컬럼에 별칭 사용하면 오류 발생

--065. 여러 테이블의 데이터를 조인해서 출력하기7 'left,right outer join' (ANSI)
-- 다음의 데이터를 사원 테이블에 입력하고 1999 ANSI 조인문법을 사용하여 이름과 직업, 월급과 부서위치를 출력하라.
-- 조건: 사원 테이블에 JACK도 출력될 수 있도록 하세요

INSERT INTO emp(empno, ename, sal, job, deptno)
VALUES (8282, 'JACK', 3000, 'ANALYST', 50);

SELECT e.ename, e.job, e.sal, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON (e.deptno = d.deptno);


--066. 여러 테이블의 데이터를 조인해서 출력하기8 'full outer join'
-- 직업이 ANALYST이거나 부서위치가 BOSTON인 사원들의 이름과 직업과 월급과 부서위치를 출력하는데 full outer 조인을 사용하여 출력하세요

SELECT e.ename, e.job, e.sal, d.loc
FROM emp e FULL OUTER JOIN dept d
ON (e.deptno = d.deptno)
WHERE e.job = 'ANALYST' or d.loc = 'BOSTON';


--067. 집합 연산자로 데이터를 위아래로 연결하기1 'union all'
-- 직업과 직업별 토탈월급을 출력하는데 맨 아래에 전체 토탈월급도 출력하세요.

SELECT job, SUM(sal)
FROM emp
GROUP BY job
UNION ALL
SELECT TO_CHAR(null) as job, SUM(sal) 
FROM emp
ORDER BY job ASC;
--union all을 통해 두개의 쿼리를 연결할 때 사용하는 컬럼의 갯수가 동일해야하므로 아래 쿼리에 null값 삽입
--조인을 보다 효과적으로 실행해주기 위해 위에 null을 명시된 job컬럼의 데이터타입과 맞춰주는 작업 필요함 


--068. 집합 연산자로 데이터를 위아래로 연결하기2 'union' 1
-- 직업, 직업별 토탈월급을 출력하는데 직업이 abcd순으로  정렬되어서 출력하고 맨 아래에 전체 토탈월급을 출력하세요.

SELECT job, SUM(sal)
FROM emp
GROUP BY job
UNION
SELECT TO_CHAR(null) as job, SUM(sal)
FROM emp;


--069. 집합 연산자로 데이터를 위아래로 연결하기2 'union' 2
-- 다음과 같이 입사한 년도, 입사한 년도별 토탈월급을 출력하는데 맨 아래에 전체 토탈월급이 출력되게 하세요.
-- 입사한 년도는 정렬이 되어서 출력되게 하세요. 

SELECT TO_CHAR(hiredate,'YYYY') 입사년도, SUM(sal) 토탈월급
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY')
UNION
SELECT TO_CHAR(null) 입사년도, SUM(sal) 토탈월급
FROM emp;


--070. 집합 연산자로 데이터의 교집합을 출력하기 'intersect'
-- 사원 테이블과 부서 테이블과의 공통된 부서번호가 무엇인지 출력하시오

SELECT deptno
FROM emp
INTERSECT
SELECT deptno
FROM dept;


--071. 집합연산자로 데이터의 차이를 출력하기 'minus'
-- 부서 테이블에는 존재하는데 사원 테이블에는 존재하지 않는 부서번호는?

SELECT deptno
FROM dept
MINUS
SELECT deptno
FROM emp;


--072. 서브 쿼리 사용하기 1 단일행 서브쿼리 
-- ALLEN 보다 더 늦게 입사한 사원들의 이름과 월급을 출력하세요.

SELECT ename, sal
FROM emp
WHERE hiredate > (SELECT hiredate 
                                 FROM emp
                                 WHERE ename='ALLEN');


--073. 서브 쿼리 사용하기 2 다중행 서브쿼리
-- 부서번호가 20번인 사원들과 같은 직업을 갖는 사원들의 이름과 직업을 출력하시오

SELECT ename, sal
FROM emp
WHERE job IN (SELECT job 
                          FROM emp
                          WHERE deptno=20) and deptno!=20;  --20번 부서 직원들과 직업이 같되 20번 부서 직원들은 출력되지 않게 하기 위함
                          
--074. 서브 쿼리 사용하기 3 NOT IN
-- 관리자가 아닌 사원들의 이름과 월급과 직업을 출력하세요. 

select * from emp;

SELECT ename, sal, job
FROM emp
WHERE ename NOT IN ( SELECT ename 
                                          FROM emp 
                                          WHERE job = 'MANAGER'); 


--075. 서브 쿼리 사용하기 4 EXISTS와 NOT EXISTS
--  부서테이블에 있는 부서 번호중에서 사원 테이블에 존재하지 않는 부서번호에 대한 모든 컬럼을 출력하세요.

SELECT *
FROM dept d
WHERE NOT EXISTS ( SELECT *
                                       FROM emp e
                                       WHERE e.deptno = d.deptno);



--076. 서브 쿼리 사용하기 5 HAVING절
-- 부서번호, 부서번호별 인원수를 출력하는데 10번 부서번호의 인원수보다 더 큰 것만 출력하시오.

SELECT deptno, count (*)
FROM emp
GROUP BY deptno
HAVING COUNT(*) > (SELECT COUNT(*)
                                      FROM emp
                                      WHERE deptno=10);


--077. 서브 쿼리 사용하기 6 FROM절
-- 직업이 SALESMAN인 사원들 중에서 가장 먼저 입사한 사원의 이름과 입사일을 출력하세요 .


SELECT*
FROM (SELECT ename, hiredate, rank() over (order by hiredate asc) rnk
             FROM emp
            WHERE job='SALESMAN')
WHERE rnk =1;

--078. 서브 쿼리 사용하기 7 SELECT절
-- 직업이 SALESMAN인 사원들의 이름과 월급을 출력하면서 그 옆에 직업이 SALESMAN인 사원들의 최대월급과 최소월급을 출력하세요.

SELECT ename, sal, (SELECT MAX(sal) FROM emp WHERE job='SALESMAN') 최대월급, 
                                   (SELECT MIN(sal) FROM emp WHERE job='SALESMAN') 최소월급
FROM emp
WHERE job = 'SALESMAN';


--079. 데이터 입력하기 insert
-- 부서테이블에 아래의 데이터를 입력하세요. 
-- 부서번호 50, 부서이름 RESEARCH, 부서위치 SEOUL

INSERT INTO dept (deptno, dname, loc)  
VALUES (50, 'RESEARCH','SEOUL');


--080. 데이터 수정하기 update
-- 직업이 SALESMAN인 사원들의 커미션을 7000으로 수정하세요.

UPDATE emp
SET comm = 7000
WHERE job= 'SALESMAN';


--081. 데이터 삭제하기 delete, truncate, drop
-- 월급이 3000 이상인 사원들을 삭제하세요.

DELETE FROM emp
WHERE sal >= 3000;


--082. 데이터 입력, 수정, 삭제 한번에 하기 merge
-- 사원테이블에 부서명 컬럼을 추가하고 해당 사원의 부서명으로 값을 갱신하세요. 

ALTER TABLE emp
ADD dname varchar2(10); -- 사원 테이블에 없는 컬럼을 merge하기 전에 추가해줌.

MERGE INTO emp e
USING dept d
ON (e.deptno = d.deptno)
WHEN MATCHED THEN
UPDATE SET e.dname=d.dname;


--083. 락(LOCK) 이해하기
-- SCOTT으로 접속한 차을 2개를 열어놓은 상태에서 하나의 창에서 ALLEN의 월급을 2000으로 수정하고 커밋을 안한 상태에서 
-- 다른창에서 ALLEN의 부서번호를 10번으로 수정하면 수정이 되겠는가?

-- update를 하는 순간 커밋이 되지 않아도 해당 행이 lock 걸려 Script runner가 완료되지 않는다.
-- 앞선 update가 커밋되는 순간 두번째 update도 완료된다.


--084. SELECT FOR UPDATE절 이해하기
-- 부서번호가 10,20번인 사원들의 이름과 직업과 부서번호를 조회하는 동안
-- 그 누구도 부서번호 10,20번인 사우너들의 데이터를 갱신하지 못하도록 하시오.

SELECT ename, job, deptno
FROM emp
WHERE deptno in (10,20)
FOR UPDATE;


--085. 서브 쿼리를 사용하여 데이터 입력하기
-- 부서 테이블과 같은 구조의 테이블을 dept2라는 이름으로 생성하고
-- 부서번호가 20,30번인 모든 컬럼의 데이터를 dept2에 입력하시오.

CREATE TABLE dept2
AS
SELECT *
FROM dept
WHERE 1=2;

INSERT  INTO dept2
SELECT *
FROM dept
WHERE deptno IN (20,30);


--086. 서브 쿼리를 사용하여 데이터 수정하기
-- 부서 번호가 30번인 사원들의 직업을 MARTIN의 직업으로 변경하세요. 

UPDATE emp
SET job = (SELECT job 
                   FROM emp
                   WHERE ename = 'MARTIN')
WHERE deptno =30;


--087. 서브 쿼리를 사용하여 데이터 삭제하기
-- ALLEN보다 늦게 입사한 사원들의 모든 행을 지우세요.

DELETE 
FROM emp
WHERE hiredate > (SELECT hiredate
                                 FROM emp
                                 WHERE ename = 'ALLEN');


--088. 서브 쿼리를 사용하여 데이터 합치기
-- 부서 테이블에 cnt라는 컬럼을 추가하고 해당 부서번호의 인원수로 값을 갱신하시오.

ALTER TABLE dept
ADD cnt number(10);

MERGE INTO dept d
USING (select deptno, count(*) cnt
             FROM emp
             GROUP BY deptno) v
ON (d.deptno = v.deptno)
WHERE matched then 
UPDATE SET d.cnt = v.cnt;


--089. 계층형 질의문으로 서열을 주고 데이터 출력하기1
-- 서열이 2위인 사원들의 이름과 서열과 직업을 출력하세요.

SELECT rpad (' ', level*3) || ename, sal, job
FROM emp
WHERE level =2
START WITH ename = 'KING'
CONNECT BY PRIOR empno = mgr;


--090. 계층형 질의문으로 서열을 주고 데이터 출력하기2
-- 사원 테이블에서 서열 순서대로 이름과 서열과 월급과 직업을 출력하는데 
-- SCOTT과 SCOTT의 팀원과 FORD와 FORD의 팀원들이 출력되지 않게 하세요.

SELECT rpad (' ', level*3) || ename AS employee, level, sal, job
FROM emp
START WITH ename = 'KING'
CONNECT BY prior empno = mgr AND ename NOT IN ('SCOTT', 'FORD');


--091. 계층형 질의문으로 서열을 주고 데이터 출력하기3
-- BLAKE와 BLAKE의 팀원들만 출력하는데 서열을 유지한 상태에서 월급이 낮은 사원부터 출력하시오.

SELECT rpad (' ', level*3) || ename AS employee, level, sal, job
FROM emp
START WITH ename = 'BLAKE'
CONNECT BY prior empno = mgr 
ORDER SIBLINGS BY sal ASC; 


--092. 계층형 질의문으로 서열을 주고 데이터 출력하기4
-- 다음과 같이 월급과 서열울 출력되게 하시오
-- 예시 : 
--KING(5000)         /KING(5000)
--JONES(2975)     /KING(5000)/JONES(2975)
--SCOTT(3000)    /KING(5000)/SCOTT(3000)/JONES(2975)

SELECT enmae || '(' || sal || ')', sys_connect_by_path(ename || '(' || sal || ')','/') as path
FROM emp
START WITH ename = 'KING'
CONNECT BY PRIOR empno = mgr;


--SQL 기초실무 - 중급편2 (093-110)

--093. 일반 테이블 생성하기 create table
-- 다음의 테이블을 생성하세요
/*
테이블명: emp50
컬럼명: empno, ename, sal, job, deptno
데이터 유형 3가지: 1. 문자형 : varchar2 , 2. 숫자형 : number , 3. 날짜형 : date 
*/

CREATE TABLE emp50
(empno number(10),
ename varchar2(10),
sal number(10,2),
job varchar2 (20),
deptno number(10)
);


--094. 임시 테이블 생성하기 create temporary table
-- 세션을 종료하면 데이터가 사라지는 임시테이블을 다음과 같이 생성하세요.
/*
테이블명: emp94
컬럼명: empno, ename, sal

1. on commit delete rows: 커밋을 하면 데이터를 지워라
2. on commit preserve rows: 세션을 종료하면 데이터를 지워라
*/

SELECT GLOBAL TEMPORARY TABLE emp94
(empno number(10),
ename varchar2(10),
sal number(10,2) )
ON COMMIT PRESERVE ROWS;


--095. 복잡한 쿼리를 단순하게 하기 1 view
-- 사원테이블에서 부서번호가 20번인 사원들의 사원번호와 사원이름, 직업, 월급을 볼 수 있는 뷰를 생성하세요

CREATE VIEW emp_view
AS 
SELECT empno, ename, job, sal
FROM emp
WHERE deptno = 20;


--096. 복잡한 쿼리를 단순하게 하기 2 view
-- 직업, 직업별 토탈월급을 출력하는 view를 emp_view96으로 생성하세요.

CREATE VIEW emp_view96
AS
SELECT job, sum(sal) as 토탈월급
FROM emp
GROUP BY job;


--097. 데이터 검색 속도를 높이기 index
-- 사원 테이블의 직업에 인덱스를 생성하세요. 

CREATE INDEX emp_job
ON emp(job); -- 직업에 인덱스 생성 완료

EXPLAIN PLAN FOR
SELECT ename, job
FROM emp
WHERE job = 'PRESIDENT'; -- 인덱스를 통해서 검색이 되는지 확인하기 위한 예시문

SELECT * 
FROM TABLE (dbms_xplan.display); -- 실행하면, 앞선 예시문을 인덱스를 통해 실행한 것을 확인 할 수 있다. 


--098. 절대로 중복되지 않는 번호 만들기 sequence
-- dept 테이블에 부서번호르 50번부터 입력하고 10씩 증가되는 시퀀스를 생성하시오. 
-- 시퀀스 이름은 dept_seq1
/* 작성법: 
create sequence 시퀀스명 
start with 시작할 번호
increment by 증가시킬 수 (다음번호와의 간격)
maxvalue 생성될 수의 최대값
*/

CREATE SEQUENCE dept_seq1
START WITH 50
INCREMENT BY 10;


--099.  실수로 지운 데이터 복구하기 1 flashback query
-- 사원테이블의 월급을 모두 0으로 변경하고 commit 한 후에 사원테이블을 1분전 상태로 되돌리시오.

UPDATE emp
SET sal =0;

COMMIT;

SELECT sal 
FROM emp
AS OF TIMESTAMP (systimestamp - interval '1' minute); --1분전 상태 확인 

MERGE INTO emp e
USING (SELECT empno, sal
              FROM emp
              AS OF TIMESTAMP (systimestamp - interval '1' minute) ) s
ON (e.empno = s.empno)
WHEN MATCHED THEN
UPDATE SET e.sal = s.sal; --1분전 상태를 서브쿼리를 이용해 s로 별칭 지어주고 update


--100. 실수로 지운 데이터 복구하기 2 flashback table
-- 사원 테이블의 월급을 전부 0으로 변경하고 commit 한 다음에 그 전 상황으로 복구하시오.

UPDATE emp
SET sal = 0;

COMMIT; 

FLASHBACK TABLE emp to TIMESTAMP (systimestamp - interval '5' minute); 

COMMIT;

--101. 실수로 지운 데이터 복구하기 3 flashback drop
-- dept 테이블을 drop 하고 다시 복구하세요

DROP TABLE dept;

SELECT * 
FROM user_recyclebin;

FLASHBACK TABLE DEPT TO BEFORE DROP;


--102. 실수로 지운 데이터 복구하기 4 flashback version query
-- 부서 테이블의 부서위치를 전부 seoul로 변경하고 dept 테이블이 그동안 어떻게 변경되어 왔는지 확인하세요.

UPDATE dept
SET loc = 'SEOUL';

COMMIT;

SELECT deptno, dname, loc, versions_startime, versions_endtime, versions_operation
FROM dept
VERSIONS BETWEEN TIMESTAMP to_timestamp ('22/02/27 00:40:10', 'RRRR-MM-DD HH24:MI:SS')
                              AND MAXVALUE
ORDER BY versions_startime nulls first;

SHOW PARAMETER undo;


--104. 데이터의 품질 높이기 1  primary key
-- 사원 테이블의 empno에 primary key를 생성하시오. 

ALTER TABLE emp
ADD CONSTRAINT emp_empno_pk primary key (empno);

--105. 데이터의 품질 높이기 2 unique
-- 문제1. 사원번호, 사원이름, 월급, 직업을 담는 테이블을 아래와 같이 생성하는데 
-- 사원번호 컬럼에 중복된 데이터가 입력되지 않도록 제약을 걸어서 생성하세요.

-- 테이블명 : emp1000 / 컬럼명: empno, ename, sal, job

CREATE TABLE emp1000(
empno number(10) constraint emp1000_empno_un UNIQUE,
ename varchar2(10),
sal number(10),
job varchar2(10)
);

insert into emp1000 values (1111, ' SCOTT', 3000, 'SALESMAN');
insert into emp1000 values (2222, ' ALLEN', 5000, 'ANALYST');
insert into emp1000 values (3333, ' SMITH', 6000, 'ANALYST');

-- 문제2. 사원테이블 (emp)에 사원번호에 중복된 데이터가 있는지 검색해보세요.

SELECT  empno, COUNT(*)
FROM emp
GROUP BY empno
HAVING COUNT (*) >2;

-- 문제3. 사원테이블(emp)에 사원번호에 중복된 데이터가 입력되지 못하도록 제약을 거세요.

ALTER TABLE emp
ADD CONSTRAINT emp_empno_un UNIQUE (empno);


--106. 데이터의 품질 높이기 3 not null
-- 문제1. 사원 테이블에 사원 이름에 null 값이 몇 건 존재하는지 검색하세요.

SELECT COUNT (*)
FROM emp
WHERE ename IS NULL;

-- 문제2. 사원 테이블에 사원이름에 not null 제약을 거세요.

ALTER TABLE emp
MODIFY ename
CONSTRAINT emp_ename_nn NOT NULL;


--107. 데이터의 품질 높이기 4 check
-- 사원 테이블의 부서번호에 부서번호가 10번, 20번, 30번만 입력, 수정되게 체크 제약을 거시오. 

ALTER TABLE emp
ADD CONSTRAINT emp_deptno_ck CHECK (deptno IN (10,20,30) );


--108. 데이터의 품질 높이기 5 foreign key
-- 문제1. 사원 테이블에 empno에 primary key를 거시오.

ALTER TABLE emp
ADD CONSTRAINT emp_empno_pk PRIMARY KEY(empno);

-- 문제2. 사원 테이블에 관리자 번호(mgr)에 foreign key 제약을 걸고 사원 테이블에 사원 번호에 있는 컬럼을 참조하게 하여
-- 관리자 번호가 사원 테이블에 있는 사원 번호에 해당하는 사원들만 관리자 번호로 입력 또는 수정될 수 있도록 하시오.

ALTER TABLE emp
ADD CONSTRAINT emp_empno_fk FOREIGN KEY(mgr) REFERENCES emp(empno);


--109. with절 사용하기 1 with ~ as 
-- 부서번호별 토탈 월급을 출력하는데 부서번호별 토탈월급들의 평균값보다 더 큰 것만 출력되게 하시오.

WITH dept_sumsal as (SELECT deptno, SUM(sal) as sumsal
                                      FROM emp
                                      GROUP BY deptno)
SELECT deptno, sumsal
FROM dept_sumsal
WHERE sumsal > ( SELECT AVG(sumsal)
                                FROM dept_sumsal);
                                

--110. with절 사용하기 2 subquery factoring
-- 입사한 년도와 입사한 년도별 토탈월급을 출력하는데 부서번호별 토탈 월급들의 평균값도다 더 큰 것만 출력하시오. 

WITH  deptno_sumsal as (SELECT deptno, SUM(sal) 토탈
                                           FROM emp
                                           GROUP BY deptno) , 
           hire_sumsal as (SELECT to_char(hiredate, 'RRRR') hire_year, SUM(sal) 토탈
                                     FROM emp
                                     GROUP BY to_char(hiredate, 'RRRR')
                                     HAVING SUM(sal) > (SELECT AVG(토탈) + 3000
                                                                         FROM deptno_sumsal))
SELECT hire_year,  토탈
FROM hire_sumsal;
                 
                                                                         
--SQL 기초실무 - 알고리즘 풀기 (111-125)

--111. SQL로 알고리즘 풀기 1
-- 구구단 2단 출력

WITH loop_table AS (SELECT LEVEL AS num
                                   FROM dual
                                   CONNECT BY LEVEL <= 9)
SELECT '2' || 'x' || num || '=' || 2 * num AS "2단"
FROM loop_table;

-- 문제1. 1부터 100까지의 합은 얼마인가?

SELECT SUM(LEVEL) 
FROM dual
CONNECT BY LEVEL <=100;

-- 문제2. 1부터 100까지 숫자 55를 뺀 수의 합은 얼마인가? 

SELECT SUM(LEVEL) 
FROM dual
WHERE LEVEL != 55
CONNECT BY LEVEL <=100;

-- 문제 3. 1부터 100까지 짝수 수의 합은 얼마인가? 

SELECT SUM(LEVEL) 
FROM dual
WHERE MOD(LEVEL,2) !=1
CONNECT BY LEVEL <=100;


--112. SQL로 알고리즘 풀기 2 구구단 1~9단 출력

WITH loop_table AS ( SELECT LEVEL AS num
                                    FROM dual
                                    CONNECT BY LEVEL <= 9),
           gugu_table AS ( SELECT LEVEL + 1 AS gugu
                                      FROM dual
                                      CONNECT BY LEVEL <= 8)
SELECT to_char (a.num) || ' x ' || to_char (b.gugu) || ' = ' || to_char(b.gugu * a.num) AS 구구단
FROM loop_table a, gugu_table b;

-- 문제1. 위의 결과에서 2, 5, 7단만 출력하세요. 

WITH loop_table AS ( SELECT LEVEL AS num
                                    FROM dual
                                    CONNECT BY LEVEL <= 9),
           gugu_table AS ( SELECT LEVEL + 1 AS gugu
                                      FROM dual
                                      CONNECT BY LEVEL <= 8)
SELECT to_char (a.num) || ' x ' || to_char (b.gugu) || ' = ' || to_char(b.gugu * a.num) AS 구구단
FROM loop_table a, gugu_table b
WHERE a.num IN (2,5,7);


--113. SQL로 알고리즘 풀기 3 직각삼각형 출력

with loop_table as (select level as num
                                from dual
                                connect by level <= 8)
select lpad('★', num, '★') as star
from loop_table;


--114. SQL로 알고리즘 풀기 4 삼각형 출력

with loop_table as ( select level as num
                                 from dual
                                 connect by level <= 8)
select lpad(' ', 10-num, ' ') || lpad('★',num, '★') as "Triangle"
from loop_table;


--115. SQL로 알고리즘 풀기 5 마름모 출력

select lpad(' ', 5-level, ' ') || rpad('★', level, '★') as star
from dual
connect by level < 6
union all
select lpad(' ', level, ' ') || rpad('★', 5-level, '★') as star
from dual
connect by level<6;

--116. SQL로 알고리즘 풀기 6 사각형 출력
undefine p_n1
undefine p_n2
accept p_n1 prompt '가로 숫자를 입력하세요'
accept p_n2 prompt '세로 숫자를 입력하세요'
with loop_table as (select level as num
                                                     from dual
                                                     connect by level <=&p_n2)
select lpad('★', &p_n1, '★') as star
from loop_table;

--문제1. 숫자를 한번만 물어보게하고 정사각형이 출력되게 하시오. 
undefine p_n1
accept p_n1 prompt '숫자를 입력하세요'
with loop_table as (select level as num
                                                     from dual
                                                     connect by level <=&p_n1)
select lpad('★', &p_n1, '★') as star
from loop_table;


--117. SQL로 알고리즘 풀기 7 1부터 10까지 숫자의 합

undefine p_n
accept p_n prompt '숫자를 입력하세요'

select level as 합계
From dual
connect by level <=&p_n; 


--118. SQL로 알고리즘 풀기 8 1부터 10까지 숫자의 곱

undefine p_n
accept p_n prompt '숫자를 입력하세요'

select round(exp(sum(ln(level)))) 곱
From dual
connect by level <=&p_n; 


--119. SQL로 알고리즘 풀기 9 1부터 10까지 짝수만 출력

undefine p_n
accept p_n prompt '숫자를 입력하세요';

select listagg (level, ', ') as 짝수
from dual
where mod(level, 2) =0
connect by level <= &p_n;


--120. SQL로 알고리즘 풀기 10 1부터 10까지 소수만 출력

with loop_table as (select level as num 
                                from dual
                                connect by level <= 10)
select l1.num as 소수1
from loop_table l1, loop_table l2
where mod(l1.num, l2.num) =0
group by l1.num
having count (l1.num) =2; 


--121. SQL로 알고리즘 풀기 11 최대 공약수
--16과 24의 최대 공약수를  구하라. 

with num_d as (select 16 as num1, 24 as num2 from dual)
select max(level)
from num_d
where mod(num1, level) =0
and mod (num2, level) = 0
connect by level <= num2;


--122. SQL로 알고리즘 풀기 12 최소 공배수

with num_d as (select 16 num1, 24 num2 from dual)
select num1, num2, (num1/max(level))*(num2/max(level))*max(level) as "최소 공배수"
from num_d
where mod (num1, level) =0 and mod(num2,level)=0
connect by level <= num2;


--123. SQL로 알고리즘 풀기 13 피타고라스의 정리

accept num1 prompt ' 밑변의 길이를 입력하세요.'
accept num2 prompt '높이를 입력하세요.'
accept num3 prompt '빗변의 길이를 입력하세요'
select case when (power(&num1,2) + power(&num2,2)) = power(&num3,2)
then '직각삼각형이 맞습니다'
else '직각삼각형이 아닙니다'
end as '피타고라스의 정리'
from dual;


--124. SQL로 알고리즘 풀기 14 몬테카를로 알고리즘
-- 몬테카를로 알고리즘을 이용해서 원주율을 출력하라.

select sum(case when (power(num1,2) + power(num2,2)) <= 1 
                              then 1 
                              else 0 end) / 100000 * 4 as "원주율"
from ( select dbms_random.value(0,1) as num1, 
                      dbms_random.value(0,1) as num2
            from dual
            connect by level < 100000);
            

--125. SQL로 알고리즘 풀기 15 오일러 상수 자연상수 구하기
-- 몬테카를로 알고리즘을 이용하여 자연상수 e값을 출력하라. 

with loop_table as (select level as num from dual connect by level <= 100000)
select result 
from (select num, power((1+1/num), num) as result from loop_table)
where num = 100000;


--SQL 기초실무 - 빅데이터 분석하기 (126-130)


--126. SQL을 이용해서 빅데이터 분석하기 1
-- 엑셀 데이터를 db에 로드하시오. 

--www.data.go.kr 을 통해 암발생률 관련 자료를 내려받음.
-- 데이터 내용 확인 후 적절하게 테이블 생성

create table cancer 
(암종 varchar(50), 질병코드 varchar(50), 환자수 number(10), 성별 varchar2(20), 조유병률 number(10,2), 생존률 number (10,2));

-- 생성 후 데이터 임포트 (cancer.csv)
-- 원본 컬럼명과 일치하지 않는 경우 직접 매칭시킴

select * from cancer;
-- 임포트 결과 확인


--127. SQL을 이용해서 빅데이터 분석하기 2
-- 스티브 잡스 연설문에서 가장 많이 나오는 단어는 무엇인가?
-- 자료 출처 https://news.stanford.edu/2005/06/14/jobs-061505/

create table speech
(speech_text varchar2(1000));
-- 테이블 생성 후 텍스트 파일 임포트 

select word, count(*)
from (select regexp_substr(lower(speech_text), '[^ ]+', 1,a) word 
           from speech, (select level a 
                                   from dual
                                   connect by level <=52)
          )
where word is not null
group by word
order by count(*) desc;
-- 어절단위로 나눈 단어들을 카운트해 가장 많이 나오는 단어순으로 정렬


--128. SQL을 이용해서 빅데이터 분석하기 3
-- 스티브 잡스 연설문에는 긍정 단어가 많은가 부정단어가 많은가?

create table positive (p_text varchar2(2000));
create table negative (n_text varchar2(2000));

create view speech_view
as
select regexp_substr(lower(speech_text), '[^ ]+', 1, a) word
from speech, (select level a 
                        from dual
                        connect by level <= 52);
                        
-- 긍정 단어 건수 조회

select count (word) as "긍정 단어"
from speech_view
where lower(word) in (select  lower(p_text)
                                     from positive); -- 68건
                                     
-- 부정 단어 건수 조회

select count (word) as "부정 단어"
from speech_view
where lower(word) in (select  lower(n_text)
                                     from negative); -- 32건                                 
-- 긍정 단어가 부정 단어보다 2배 이상 많이 사용되고 있다. 


--129. SQL을 이용해서 빅데이터 분석하기 4
-- 절도가  많이 발생하는 요일은 언제인가?
-- 출처: https://www.data.go.kr/data/2950729/fileData.do
-- <대검찰청 범죄발생 요일 현황>

create table crime_day
(CRIME_TYPE varchar(50),
 SUN_CNT number(10),
 MON_CNT number(10), 
 TUE_CNT number(10),
 WED_CNT number(10),
 THU_CNT number(10),
 FRI_CNT number(10),
 SAT_CNT number(10),
 UNKNOWN_CNT number(10));

-- 특정 범죄가 많이 발생한 요일을 출력하기 편하게 unpivot 사용
CREATE TABLE crime_day_unpivot
AS
SELECT * 
FROM crime_day
UNPIVOT (CNT FOR DAY_CNT IN (SUN_CNT, MON_CNT, TUE_CNT, WED_CNT, THU_CNT, FRI_CNT, SAT_CNT));
 
 -- 절도 범죄만 선택하여 rank 함수를 통해 순위 부여
 SELECT * 
 FROM ( SELECT DAY_CNT, CNT, RANK() OVER (ORDER BY CNT DESC) RNK 
              FROM CRIME_DAY_UNPIVOT
              WHERE TRIM(CRIME_TYPE)='절도')
WHERE RNK = 1; 
-- 절도범죄가 가장 많이 일어나는 요일은 금요일이다. 


--130. SQL을 이용해서 빅데이터 분석하기 5
-- 우리나라에서 대학 등록금이 가장 높은 학교는 어디인가?
-- 자료 출처 : https://www.data.go.kr/data/3071171/fileData.do
-- < 한국장학재단_대학별 평균 등록금>

CREATE TABLE UNIVERSITY_FEE
(DIVISION VARCHAR2(20),
 TYPE VARCHAR2(20),
 UNIVERSITY VARCHAR(60),
 LOC VARCHAR(20),
 ADMISSION_CNT NUMBER(20),
 ADMISSION_FEE NUMBER(20),
 TUITION_FEE NUMBER(20));
 
 SELECT * 
 FROM (SELECT UNIVERSITY, TUITION_FEE, 
              RANK() OVER (ORDER BY TUITION_FEE DESC NULLS LAST) 순위
              FROM UNIVERSITY_FEE)
WHERE 순위 = 1 ;

-- 한국 산업 기술대학교가 등록금이 8,997,116으로 가장 높다.


--131. SQL을 이용해서 빅데이터 분석하기 6
-- 서울시 물가 중 가장 비싼 품목과 가격은 무엇인가? 
-- http://data.seoul.go.kr/dataList/OA-1170/S/1/datasetView.do
-- <서울시 생필품 농수축산물 가격 정보 2021년>

CREATE TABLE PRICE 
(P_SEQ NUMBER(10),
 M_SEQ NUMBER(10),
 M_NAME VARCHAR(80),
 A_SEQ NUMBER(10),
 A_NAME VARCHAR2(60),
 A_UNIT VARCHAR2(40),
 A_PRICE NUMBER(10),
 P_YEAR_MONTH VARCHAR2(30),
 ADD_COL VARCHAR2(180),
 M_TYPE_CODE VARCHAR2(20),
 M_TYPE_NAME VARCHAR2(20),
 M_GU_CODE VARCHAR2(10),
 M_GU_NAME VARCHAR2(30));



SELECT A_NAME AS "상품", A_PRICE as "가격", M_NAME as "매장명"
FROM PRICE
WHERE A_PRICE = (SELECT MAX(A_PRICE)
                           FROM PRICE);
                           
                           
--132. SQL을 이용해서 빅데이터 분석하기 7
-- 살인이 가장 많이 발생하는 장소는 어디인가?

CREATE TABLE  crime_loc
( CRIME_TYPE     varchar2(50),
  C_LOC             varchar2(50),
  CNT             number(10) );

SELECT * 
FROM ( SELECT C_LOC, CNT, RANK() OVER (ORDER BY CNT DESC) RNK
            FROM CRIME_LOC
            WHERE CRIME_TYPE = '살인')
WHERE RNK = 1;

-- 살인이 가장 많이 발생하는 장소는 '집'이다.


--133. SQL을 이용해서 빅데이터 분석하기 8
-- 가정불화로 생기는 가정 큰 범죄 유형은 무엇인가?

create table crime_cause
(범죄유형  varchar2(30),
생계형  number(10),
유흥 number(10),
도박 number(10),
허영심 number(10),
복수  number(10),
해고  number(10),
징벌 number(10),
가정불화  number(10),
호기심 number(10),
유혹  number(10),
사고   number(10),
불만   number(10),
부주의   number(10),
기타   number(10)  );

-- 범죄 동기가 출력되기 용이하도록 unpivot문으로 범죄 동기 컬럼을 행으로 검색한 데이터를 생성한다

CREATE  TABLE  CRIME_CAUSE2
AS
SELECT *
FROM CRIME_CAUSE
UNPIVOT ( CNT FOR TERM IN (생계형, 유흥, 도박, 허영심, 복수, 해고, 징벌, 가정불화, 호기심, 유혹, 사고, 불만, 부주의, 기타));


-- 서브 쿼리에서 가정불화로 인한 범죄 원인의 건수 중에 가장 큰 건수를 출력한 후, 
-- 그 건수와 같으면서 원인이 가정불화인 범죄 유형을 메인쿼리에서 조회
SELECT 범죄유형
FROM CRIME_CAUSE2
WHERE CNT = ( SELECT MAX(CNT)
                          FROM CRIME_CAUSE2
                          WHERE TERM='가정불화' )
   AND TERM='가정불화';
   
-- 가정불화로 생기는 가장 큰 범죄 유형은 '폭행'이다.


--134. SQL을 이용해서 빅데이터 분석하기 9
-- 방화 사건의 가장 큰 원인은 무엇인가?
-- 133번에서 생성한 CRIME_CAUSE2 테이블 사용 

SELECT TERM AS 원인
FROM CRIME_CAUSE2
WHERE CNT = (SELECT MAX(CNT)
FROM CRIME_CAUSE2
WHERE 범죄유형 = '방화')
AND 범죄유형='방화';

-- 방화 사건의 가장 큰 원인은 '사고'이다.


-- 135. SQL을 이용해서 빅데이터 분석하기 10
-- 전국에서 교통사고가 제일 많이 발생하는 지역은 어디인가? 
-- 자료출처:  공공데이터 포털 <도로교통공단_교통사고다발지역_20191010.csv>


CREATE TABLE ACC_LOC_DATA
(ACC_LOC_NO    NUMBER(10),
 ACC_YEAR       NUMBER(10),
 ACC_TYPE       VARCHAR2(20),
 ACC_LOC_CODE   NUMBER(10),
 CITY_NAME      VARCHAR2(50),
 ACC_LOC_NAME  VARCHAR2(200),
 ACC_CNT        NUMBER(10),
 AL_CNT          NUMBER(10),
 DEAD_CNT       NUMBER(10),
 M_INJURY_CNT   NUMBER(10),
 L_INJURY_CNT    NUMBER(10),
 H_INJURY_CNT   NUMBER(10),
 LAT              NUMBER(15,8),
 LOT              NUMBER(15,8),
 DATA_UPDATE_DATE   DATE );
 
 
-- From 절의 서브쿼리에서 사고 건수가 많은 순서대로 결과 출력
-- 그 후 메인쿼리에서 top5까지만 추림

 SELECT * 
  FROM ( 
      SELECT ACC_LOC_NAME AS 사고장소, ACC_CNT AS 사고건수, 
                DENSE_RANK() OVER (ORDER BY ACC_CNT DESC NULLS LAST) AS 순위
        FROM ACC_LOC_DATA
        WHERE ACC_YEAR=2017
        )
  WHERE 순위 <= 5;

-- 부산광역시 부산진구 부전동(부전상가시장 부근)이 전체 사고건수 18건으로 전국에서 가장 많이 발생했다.


-- 136. SQL을 이용해서 빅데이터 분석하기 11 
-- 치킨집 폐업이 가장 많았던 연도가 언제인가?

CREATE TABLE CLOSING
(  년도        NUMBER(10),
   미용실      NUMBER(10),
   양식집      NUMBER(10),
   일식집      NUMBER(10),
   치킨집      NUMBER(10),
   커피음료    NUMBER(10),
   한식음식점   NUMBER(10),
   호프간이주점  NUMBER(10) ) ;

SELECT 년도 "치킨집 폐업 년도", 치킨집 "건수"
  FROM ( SELECT 년도, 치킨집, rank() over(order by 치킨집 desc) 순위 
               FROM closing )
  WHERE 순위=1;
  
-- 치킨집 폐업이 가장 많았던 연도는 2007년도로 총 3579건이다. 


-- 137. SQL을 이용해서 빅데이터 분석하기 12
--세계에서 근무 시간이 가장 긴 나라는 어디인가?

CREATE  TABLE  WORKING_TIME
( COUNTRY      VARCHAR2(30),
  Y_2014       NUMBER(10),
  Y_2015       NUMBER(10),
  Y_2016       NUMBER(10),
  Y_2017       NUMBER(10),
  Y_2018       NUMBER(10) );
  
 CREATE VIEW C_WORK_TIME
AS
SELECT *
FROM WORKING_TIME
UNPIVOT ( CNT FOR Y_YEAR IN ( Y_2014, Y_2015, Y_2016, Y_2017, Y_2018));
  
  
SELECT COUNTRY, CNT, RANK() OVER (ORDER BY CNT DESC) 순위
FROM C_WORK_TIME
WHERE Y_YEAR ='Y_2018';

-- 근무시간이 가장 긴 나라는 멕시코이다. 


--138. SQL을 이용해서 빅데이터 분석하기 13
-- 남자와 여자가 각각 많이 걸리는 암은 무엇인가?

CREATE  TABLE  CANCER
( 암종       VARCHAR2(50),   
  질병코드   VARCHAR2(20),
  환자수     NUMBER(10),
  성별       VARCHAR2(20),
  조유병률   NUMBER(10,2),     
  생존률    NUMBER(10,2) );

SELECT DISTINCT(암종), 성별 , 환자수
  FROM CANCER
  WHERE 환자수 = (SELECT MAX(환자수)
                             FROM CANCER
                             WHERE 성별 = '남자' AND 암종 != '모든암')
UNION ALL
SELECT DISTINCT(암종) , 성별 , 환자수
  FROM CANCER
  WHERE 환자수 = (SELECT MAX(환자수)
                            FROM CANCER
                            WHERE 성별 = '여자');

-- 남자는 '위암', 여자는 '갑상선암'이 가장 많이 걸렸다.

-- 139. PL/SQL 변수 이해하기 1
-- 두수를 각각 물어보게 하고 입력받아 두수의 합이 결과로 출력되게 하는 PL/SQL을 작성해보시오.

set serveroutput on
accept p_num1 prompt '첫 번째 숫자를 입력하세요.'
accept p_num2 prompt '두 번째 숫자를 입력하세요.'
declare v_sum number(10);
begin v_sum :=&p_num1 + &p_num2 ;
dbms_output.put_line('총합은: ' || v_sum);
end;
/


-- 140. PL/SQL 변수 이해하기 2
-- 사원 번호를 물어보게 하고 사원 번호를 입력하면 해당 사원의 월급이 출력되게 하는 PL/SQL문을 작성해보시오.

set serveroutput on
accept p_empno prompt '사원 번호를 입력하세요.'
declare v_sal number(10);
begin select sal into v_sal
from emp
where empno = &p_empno;
dbms_output.put_line('해당 사원의 월급은: ' || v_sal);
end;
/


-- 141. PL/SQL if 이해하기 1
-- 숫자를 물어보게 하고 숫자를 입력하면 해당 숫자가 짝수인지 홀수인지 출력되게 하는 PL/SQL문을 작성해보시오.

set serveroutput on
set verify off
accept p_num prompt '숫자를 입력하세요.'
begin
if mod(&p_num,2) = 0 then
dbms_output.put_line('짝수입니다.');
else 
dbms_output.put_line('홀수입니다.');
end if;
end;
/


--142.PL/SQL if 이해하기 2
-- 이름을 입력받아 
-- 해당사원의 월급이 3000 이상이면 고소득자, 
-- 2000 이상이고 3000보다 작으면 중간 소득자,
-- 2000 보다 작은 사원은 저소득자라는 메세지를 출력하는 PL/SQL문을 작성해보시오.

set serveroutput on
set verify off
accept p_ename prompt '사원 이름을 입력하세요.'
declare
    v_ename emp.ename%type := upper('&p_ename');
    v_sal emp.sal%type;
    
begin
    select sal into v_sal
    from emp
    where ename= v_ename;
    
    if v_sal >= 3000 then
        dbms_output.put_line('고소득자입니다.');
    elsif v_sal >= 2000 then
        dbms_output.put_line('중간 소득자입니다.');
    else
        dbms_output.put_line('저소득자입니다.');
    end if;
end;
/


--143. PL/SQL Basic Loop 이해하기
-- PL/SQL의 Basic loop문으로 구구단 2단을 출력해보시오. 

declare
    v_count number(10) := 0;
begin
    loop
        v_count := v_count +1;
        dbms_output.put_line ('2 x ' || v_count || ' = ' || 2*v_count);
        exit when v_count = 9;
    end loop;
end;
/


--144. PL/SQL While Loop 이해하기 
--PL/SQL의 While loop문으로 구구단 2단을 출력해보시오. 

declare
    v_count number(10) := 0;
begin
    while v_count < 9 loop
        v_count := v_count + 1;
        dbms_output.put_line ('2 x ' || v_count || ' = ' || 2 * v_count);
    end loop;
end;
/


--145. PL/SQL For Loop 이해하기  
--PL/SQL의 For loop문으로 구구단 2단을 출력해보시오. 


begin
    for i in 1 .. 9 loop
        dbms_output.put_line ('2 x ' || i || ' = ' || 2 * i);
    end loop;
end;
/


--146. PL/SQL 이중 Loop 이해하기  
--PL/SQL의 For loop문으로 구구단 2단~9단을 출력해보시오. 

prompt 구구단 전체를 출력합니다
begin
    for i in 2 .. 9 loop
        for j in 1 .. 9 loop
            dbms_output.put_line ( i || ' x '  || j || ' = ' || i * j);
        end loop;
    end loop;
end;
/


--147. PL/SQL Cursor문 이해하기 (basic loop)
-- 커서문과 루프문을 활용해 부서 번호를 물어보게 하고, 부서 번호를 입력하면 해당 부서 사원이름, 월급, 부서 번호가 출력되게 하시오. 

declare
    v_ename emp.ename%type;
    v_sal emp.sal%type;
    v_deptno emp.deptno%type;
    
    cursor emp_cursor is 
        select ename, sal, deptno
        from emp
        where deptno = &p_deptno;
begin
    open emp_cursor ;
        loop
            fetch emp_cursor into v_ename, v_sal, v_deptno;
            exit when emp_cursor%notfound;
            dbms_output.put_line(v_ename|| ' '||v_sal|| ' '|| v_deptno);
        end loop;
    close emp_cursor;
end;
/


--148. PL/SQL Cursor문 이해하기 (for loop)
-- 커서문과 루프문을 활용해 부서 번호를 물어보게 하고, 부서 번호를 입력하면 해당 부서 사원이름, 월급, 부서 번호가 출력되게 하시오. 

accept p_deptno prompt '부서 번호를 입력하세요.'
declare
    cursor emp_cursor is 
        select ename, sal,deptno
            from emp
            where deptno = &p_deptno;
begin
    for emp_record in emp_cursor loop
        dbms_output.put_line(emp_record.ename || ' ' || emp_record.sal || ' ' || emp_record.deptno);
    end loop;
end;
/


--149. PL/SQL Cursor for loop문 이해하기
-- 커서문과 루프문을 활용해 부서 번호를 물어보게 하고, 부서 번호를 입력하면 해당 부서 사원이름, 월급, 부서 번호가 출력되게 하시오. 
-- 148번보다 더 간단하게 작성 

accept p_deptno prompt '부서 번호를 입력하세요.'
begin
    for emp_record in( select ename, sal,deptno
            from emp
            where deptno = &p_deptno) loop 
    dbms_output.put_line(emp_record.ename || ' ' || emp_record.sal || ' ' || emp_record.deptno);
    end loop;
end;
/


--150. 프로시저 구현하기
--이름을 입력받아 해당사원의 월급이 출력되게 하는 프로시저를 생성해 보시오. 

create or replace procedure pro_ename_sal
(p_ename in emp.ename%type)
is
    v_sal   emp.sal%type;
begin
    select sal into v_sal
        from emp
        where ename = p_ename;
    
    dbms_output.put_line(v_sal || '입니다');

end;
/


--151. 함수 구현하기
--부서 번호를 입력받아 해당 부서의 사원들의 부서 위치가 출력되는 함수를 생성해 보시오.

create or replace function get_loc
(p_deptno in dept.deptno%type)
return dept.loc%type
is
    v_loc   dept.loc%type;
begin
    select loc into v_loc
        from dept
        where deptno = p_deptno;
    return v_loc;
end;
/