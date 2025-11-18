-- Broken Query 1
SELECT boohbah_id, AVG(sync_level), name
FROM boohbah_stand_link
JOIN boohbah USING (boohbah_id)
GROUP BY boohbah_id, name;
-- Broken Query 2
SELECT b.name, s.stand_name
FROM boohbah b
JOIN boohbah_stand_link l ON b.boohbah_id = l.stand_id
JOIN jojo_stand s on l.stand_id = s.stand_id;
-- Broken Query 3
SELECT name, color
FROM boohbah
WHERE energy_level > 80;
-- Broken Query 4
SELECT b.boohbah_id, l.stand_id
FROM boohbah b
JOIN boohbah_stand_link l
ON b.boohbah_id = l.boohbah_id
WHERE boohbah_id = 2;
-- Broken Query 5
SELECT name
FROM boohbah 
WHERE energy_level > (SELECT AVG(energy_level)FROM boohbah);
-- Broken Query 6
SELECT name
FROM boohbah
WHERE energy_level > ANY (SELECT power
                      FROM jojo_stand
                      WHERE season = 3);
-- Broken Query 7
SELECT b.name, s.stand_name
FROM boohbah b, jojo_stand s
WHERE b.energy_level > 80 AND b.boohbah_id = s.stand_id;
-- Broken Query 8
SELECT b.name, s.stand_name
FROM boohbah b
JOIN boohbah_stand_link l on b.boohbah_id = l.boohbah_id
JOIN jojo_stand s on l.stand_id = s.stand_id
WHERE b.energy_level > 80;
-- Broken Query 9
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN
      (SELECT boohbah_id, stand_id FROM boohbah_stand_link);
-- Broken Query 10
MERGE INTO boohbah b
USING boohbah_stand_link l
ON (b.boohbah_id = l.stand_id)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = 999;