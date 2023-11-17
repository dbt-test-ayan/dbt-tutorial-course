{#
	This test is basically a "not_null" and "unique"
	rolled into one.

	It fails if a column is NULL or occurs more than once
#}


{% test primary_key(model, column_name)%}

WITH validation as (

select {{column_name}} as primary_key,
count(1) as occurrences
from 
{{model}}
group by 1

)


select * from validation WHERE
primary_key is NULL
or occurrences > 1 


{%endtest%}


