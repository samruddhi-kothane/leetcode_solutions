# Write your MySQL query statement below
SELECT user_id, reaction AS dominant_reaction ,
       ROUND(count(reaction) / (SELECT count(*) FROM reactions WHERE user_id = r.user_id ),2) AS reaction_ratio
FROM reactions r
GROUP BY user_id, reaction
HAVING (SELECT count(*) FROM reactions WHERE user_id = r.user_id ) >= 5 AND reaction_ratio >= 0.6
ORDER BY reaction_ratio DESC, user_id 

