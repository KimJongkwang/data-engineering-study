SELECT
  t.yyyymm || ': ' || TEXT(t.user_counts) mau
FROM
  (
    SELECT
      TO_CHAR(st.ts, 'YYYY-MM') yyyymm,
      COUNT(DISTINCT(sc.userid)) user_counts
    FROM
      raw_data.user_session_channel sc
      JOIN raw_data.session_timestamp st ON sc.sessionid = st.sessionid
    GROUP BY(1)
    ORDER BY(1)
  ) t