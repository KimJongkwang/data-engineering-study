with user_gross_revenue as (
select
      userid
    , sum(nullif(amount, 0)) gross_revenue
from raw_data.session_transaction st
left join raw_data.user_session_channel usc on usc.sessionid = st.sessionid
group by 1
) 
select userid, coalesce(gross_revenue, 0)
from user_gross_revenue
order by 2 desc
limit 10;