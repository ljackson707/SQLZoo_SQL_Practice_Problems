#SQLZoo Problems 

#1)You can use WHERE name LIKE 'B%' to find the countries that start with "B". 

SELECT name 
FROM world
  WHERE name LIKE 'Y%';

#2)Find the countries that end with y

SELECT name 
FROM world
  WHERE name LIKE '%y';

#3)Luxembourg has an x - so does one other country. List them both.
Find the countries that contain the letter x

SELECT name 
FROM world
  WHERE name LIKE '%x%';

#4)Iceland, Switzerland end with land - but are there others?
Find the countries that end with land

SELECT name 
FROM world
  WHERE name LIKE '%land';

#5)Columbia starts with a C and ends with ia - there are two more like this.
Find the countries that start with C and end with ia

SELECT name 
FROM world
  WHERE name LIKE 'C%ia';

#6)Greece has a double e - who has a double o?
Find the country that has oo in the name

SELECT name 
FROM world
  WHERE name LIKE '%oo%';

#7)Bahamas has three a - who else
Find the countries that have three or more a in the name

SELECT name 
FROM world
  WHERE name LIKE '%a%a%a%';


#8)Find the countries that have "t" as the second character.

SELECT name 
FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

#9)Lesotho and Moldova both have two o characters separated by two other characters.
Find the countries that have two "o" characters separated by two others.

SELECT name 
FROM world
 WHERE name LIKE '%o__o%';
 
#10)Cuba and Togo have four characters names.
Find the countries that have exactly four characters.

SELECT name 
FROM world
 WHERE name LIKE '____';

#11)The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country
Find the country where the name is the capital city.

SELECT name
  FROM world
 WHERE capital LIKE name;

#12)The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".
Find the country where the capital is the country plus "City".

SELECT name 
  FROM world
 WHERE capital LIKE concat(name, ' City');

#13)Find the capital and the name where the capital includes the name of the country.

SELECT capital,
       name     
FROM world
 WHERE capital LIKE concat('%', name, '%');

#14)Find the capital and the name where the capital is an extension of name of the country.
You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country. 

SELECT capital,
       name     
FROM world
 WHERE capital LIKE concat(name, '%') AND capital <> name;

#15)For Monaco-Ville the name is Monaco and the extension is -Ville.
Show the name and the extension where the capital is an extension of name of the country.
You can use the SQL function REPLACE. 

SELECT name, REPLACE(capital, name, '') as extenshion
FROM world
 WHERE capital LIKE concat(name, '%') AND capital <> name;
 
 
#15)Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

SELECT  c.company_code,
        c.founder,  
        COUNT(distinct l.lead_manager_code), 
        COUNT(distinct s.senior_manager_code), 
        COUNT(distinct m.manager_code),
        COUNT(distinct e.employee_code)
from Company as c 
join Lead_Manager as l 
on c.company_code = l.company_code
join Senior_Manager as s
on l.lead_manager_code = s.lead_manager_code
join Manager as m 
on m.senior_manager_code = s.senior_manager_code
join Employee as e
on e.manager_code = m.manager_code
group by c.company_code, c.founder
order by c.company_code;
