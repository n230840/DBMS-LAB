use gram_panchayat_db;
SHOW TABLES;

SELECT * FROM citizen;

SELECT * FROM certificate_type;

SELECT * FROM panchayat_office;

SELECT * FROM certificate_application;

SELECT COUNT(*) AS total_applications
FROM certificate_application;

SELECT COUNT(*) AS total_citizens
FROM citizen;

SELECT COUNT(*) AS total_certificate_types
FROM certificate_type;

SELECT MIN(application_date) AS earliest_application_date
FROM certificate_application;

SELECT MAX(application_date) AS latest_application_date
FROM certificate_application;

SELECT SUM(fee_paid) AS total_fees_paid
FROM certificate_application;

SELECT AVG(fee_paid) AS average_fee_paid
FROM certificate_application;

SELECT MAX(fee_paid) AS maximum_fee_paid
FROM certificate_application;

SELECT MIN(fee_paid) AS minimum_fee_paid
FROM certificate_application;

SELECT
application_status,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY application_status;

SELECT
certificate_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY certificate_id;

SELECT
office_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY office_id;

SELECT
village_name,
COUNT(*) AS total_citizens
FROM citizen
GROUP BY village_name;

SELECT
application_date,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY application_date;

SELECT
certificate_id,
office_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY certificate_id, office_id;

SELECT
ct.certificate_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_name;

SELECT
p.office_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
GROUP BY p.office_name;

SELECT
certificate_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY certificate_id
HAVING COUNT(*) > 2;

SELECT
office_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY office_id
HAVING COUNT(*) > 2;

SELECT
certificate_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY certificate_id
ORDER BY total_applications DESC;

SELECT
office_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY office_id
ORDER BY total_applications ASC;

SELECT
certificate_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY certificate_id
HAVING COUNT(*) > 2
ORDER BY total_applications DESC;

SELECT
certificate_id,
office_id,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY certificate_id, office_id
ORDER BY total_applications DESC
LIMIT 1;

SELECT
application_status,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY application_status
ORDER BY total_applications DESC
LIMIT 1;

SELECT
application_status,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY application_status
ORDER BY total_applications ASC
LIMIT 1;

SELECT
ct.certificate_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_name
ORDER BY total_applications DESC
LIMIT 1;

SELECT
p.office_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
GROUP BY p.office_name
ORDER BY total_applications DESC
LIMIT 1;

SELECT
application_status,
COUNT(*) AS total_applications
FROM certificate_application
GROUP BY application_status
ORDER BY total_applications DESC
LIMIT 1;

SELECT
ct.certificate_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_name
HAVING COUNT(*) > 2;

SELECT
p.office_name,
COUNT(*) AS total_applications
FROM certificate_application a
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
GROUP BY p.office_name
HAVING COUNT(*) > 2;

SELECT
ct.certificate_name,
COUNT(*) AS total_applications,
MIN(a.application_date) AS earliest_application_date,
MAX(a.application_date) AS latest_application_date
FROM certificate_application a
INNER JOIN certificate_type ct
ON a.certificate_id = ct.certificate_type_id
GROUP BY ct.certificate_name;

SELECT
p.office_name,
COUNT(*) AS total_applications,
COUNT(DISTINCT a.certificate_id) AS different_certificate_types
FROM certificate_application a
INNER JOIN panchayat_office p
ON a.office_id = p.office_id
GROUP BY p.office_name;

