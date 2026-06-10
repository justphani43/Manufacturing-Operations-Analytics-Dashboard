show tables;
## KPI FOR TODAY MANUFACTURED QTY.
select concat(round(sum(`today manufactured qty`)/1000000,0),"M") 
as Manufacturing_Qty from mp;

## KPI FOR REJECTED QTY.
select Concat(round(sum(`Rejected Qty`)/1000,0),"K") 
as Rejected_Qty from mp;

## KPI FOR PROCESSED QTY.
select concat(round(sum(`Processed qty`)/1000000,0),"M") 
as Processed_Qty from mp;

## KPI FOR PDMC .
select Concat(round(sum(`Per day machine cost`)/1000000,0), "M") as PDMC 
from mp;

## KPI FOR PUC
select round(sum(`per day machine cost`)/sum(`today manufactured qty`),3)
as PUC from mp;

## KPI FOR WASTAGE %
select Round(sum(`Rejected Qty`)/(sum(`today manufactured qty`)-sum(`Rejected Qty`))*100,0)
`Wastage%`
from mp;

## KPI FOR Total Records
select Round(count(Buyer)) as Total_records from mp;

## ALL  KPI'S

select concat(round(sum(`today manufactured qty`)/1000000,0),"M") as Manufacturing_Qty,
Concat(round(sum(`Rejected Qty`)/1000,0),"K") as Rejected_Qty, 
Concat(round(sum(`Per day machine cost`)/1000000,0), "M") as PDMC, 
concat(round(sum(`Processed qty`)/1000000,0),"M") as Processed_Qty,
round(sum(`per day machine cost`)/sum(`today manufactured qty`),3)as PUC, 
round(sum(`Rejected Qty`)/(sum(`today manufactured qty`)-sum(`Rejected Qty`))*100,0) as `Wastage%`, Round(count(Buyer)) as Total_records  
from MP;

## EMPLOYEE WISE REJECTED QTY

select `Emp Name` as EmpName, sum(`Rejected Qty`) as Rejected_Qty 
from MP
Group by 1
Order by EmpName Asc;

## MACHINE WISE REJECTED QTY 

	select `Machine Code` as MachineNmae, sum(`Rejected Qty`) as Rejected_Qty
	from MP
	group by 1
	order by 2 DESC
	limit 10;

## PRODUCED QTY ##    

select `Buyer` as Buyer, sum(`produced Qty`) as Produced_Qty 
from MP
group by `Buyer`;

## DEPARTMENT WISE MANUFACTURED Vs REJECTED
    
select (`Department Name`), sum(`Rejected Qty`) as Rejected_Qty, sum(`today manufactured qty`)
from MP
group by `Department Name`; 
    
     ## PRODUCTION COMPARISON TREND ##  
     
    select date_format(`Doc Date`,'%b') As Docdate, sum(`Rejected Qty`) as Rejected_Qty, sum(`Produced qty`)
    from MP
    group by `Docdate`;
    
    ## MANUFACTURED VS REJECTED TREND ##
    
    select date_format(`Doc Date`,'%b') As Docdate, sum(`Rejected Qty`) as Rejected_Qty, sum(`today manufactured qty`)
    from MP
    group by `Docdate`;


  
    
