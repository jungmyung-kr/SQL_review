-- 프로그래머스 SQL 문제 풀이
-- SUM, MAX, MIN문 
-- 총 4문제

-- ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. 
-- ANIMAL_INS 테이블 구조는 다음과 같으며, 
-- ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 
-- 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

-- 1. 최댓값 구하기
-- 동물 보호소에 가장 최근에 들어온 동물은 언제 들어왔는지 조회하는 SQL문을 작성해주세요.

SELECT MAX(DATETIME) AS 시간
FROM ANIMAL_INS;


-- 2. 최솟값 구하기
-- 동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.

SELECT MIN(DATETIME)
FROM ANIMAL_INS;


-- 3. 동물 수 구하기
-- 동물 보호소에 동물이 몇 마리 들어왔는지 조회하는 SQL문을 작성해주세요. 

SELECT COUNT(ANIMAL_ID)
FROM ANIMAL_INS;


-- 4. 중복 제거하기
-- 동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요. 
-- 이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.

SELECT COUNT(DISTINCT(NAME)) AS "count"
FROM ANIMAL_INS;