show databases;

create database Bankproject;
use Bankproject;

select* from finance_1;
select* from finance_2;




select count(*)from finance_1;
select count(*)from finance_2;

### KPI 1 Year wise loan amount stats

select year(issue_d) as year_of_issue_d,sum(loan_amnt) as total_loan_amnt
from finance_1
group by year_of_issue_d
order by year_of_issue_d;

## KPI 2 Grade and subgrade wise revol balance

select grade,sub_grade,sum(revol_bal) as total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id=finance_2.id)
group by grade,sub_grade
order by grade,sub_grade;

## KPI 3 Total payment for verified and non verified status

select verification_status,round(sum(total_pymnt),2) as total_payment
from finance_1 inner join finance_2
on(finance_1.id= finance_2.id)
group by verification_status;

select verification_status,
concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance_1 inner join finance_2
on(finance_1.id= finance_2.id)
group by verification_status;


#KPI 4  State wise and month wise loan status

select addr_state,monthname(issue_d )as month ,loan_status
from finance_1
inner join finance_2
on(finance_1.id= finance_2.id)
group by addr_state,monthname(issue_d) ,loan_status
order by addr_state,monthname(issue_d) ,loan_status Asc;

## KPI 5 Home ownership Vs last payment date stats

select home_ownership,last_pymnt_d
from finance_1
inner join finance_2 
on finance_1.id= finance_2.id
group by home_ownership,last_pymnt_d
order by home_ownership ,last_pymnt_d;










