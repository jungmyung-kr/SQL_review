-- 프로그래머스 SQL 문제 풀이
-- SELECT문 
-- 총 7문제

-- ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. 
-- ANIMAL_INS 테이블 구조는 다음과 같으며, 
-- ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 
-- 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.


-- 1. 모든 레코드 조회하기 
-- 동물 보호소에 들어온 모든 동물의 정보를 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요.

SELECT *
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;

-- 2. 역순 정렬하기 
-- 동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 ANIMAL_ID 역순으로 보여주세요.

SELECT NAME, DATETIME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID DESC;

-- 3. 아픈 동물 찾기
-- 동물 보호소에 들어온 동물 중 아픈 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 아이디 순으로 조회해주세요. 

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION = 'Sick'
ORDER BY ANIMAL_ID;