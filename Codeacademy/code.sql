SELECT utm_campaign, COUNT(utm_campaign)
FROM page_visits
GROUP BY utm_campaign;


SELECT utm_source, COUNT(utm_source)
FROM page_visits
GROUP BY utm_source; 


SELECT DISTINCT page_name
FROM page_visits; 


WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT utm_campaign, COUNT(first_touch_at)
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
    GROUP BY utm_campaign
    ORDER BY count(first_touch_at) DESC;


WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT utm_campaign, COUNT(last_touch_at)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    GROUP BY utm_campaign
    ORDER BY count(last_touch_at) DESC;


SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name LIKE '%4%'; 


SELECT COUNT(DISTINCT user_id)
FROM page_visits; 


WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT utm_campaign, COUNT(last_touch_at)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    WHERE page_name LIKE '%4%'
    GROUP BY utm_campaign
    ORDER BY count(last_touch_at) DESC;


WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT utm_campaign, utm_source, COUNT(first_touch_at)
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
WHERE utm_campaign = 'getting-to-know-cool-tshirts'
OR utm_campaign = 'interview-with-cool-tshirts-founder'
GROUP BY utm_source
ORDER BY count(first_touch_at) DESC;


SELECT DISTINCT utm_campaign, utm_source
FROM page_visits; 


SELECT page_name, utm_campaign, COUNT(utm_campaign), utm_source
FROM page_visits
WHERE page_name LIKE '%1%'
GROUP BY utm_campaign
ORDER BY COUNT(utm_campaign) DESC;


SELECT page_name, utm_campaign, COUNT(utm_campaign), utm_source
FROM page_visits
WHERE page_name LIKE '%2%'
GROUP BY utm_campaign
ORDER BY COUNT(utm_campaign) DESC;


SELECT page_name, utm_campaign, COUNT(utm_campaign), utm_source
FROM page_visits
WHERE page_name LIKE '%3%'
GROUP BY utm_campaign
ORDER BY COUNT(utm_campaign) DESC;


SELECT page_name, utm_campaign, COUNT(utm_campaign), utm_source
FROM page_visits
WHERE page_name LIKE '%4%'
GROUP BY utm_campaign
ORDER BY COUNT(utm_campaign) DESC;


WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT utm_campaign, utm_source, COUNT(last_touch_at)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY utm_source
ORDER BY count(last_touch_at) DESC;


