-- Query results from exampleDB
SELECT
     mr.subject_reference AS patient_uri
    ,mr.subject_display AS patient_display
    ,mr.id AS medicationrequest_uri
    ,mr.status AS medicationrequest_status
    ,mr.authoredOn AS medicationrequest_authoredOn
    ,mr.Med_id AS medication_uri
    ,IF(
         LENGTH(mi.coding_display) > 50,
         CONCAT(LEFT(mi.coding_display, 50), '...'),
         mi.coding_display
      ) AS medication_ingredient_display
FROM medication_ingredient AS mi
JOIN medicationrequest mr ON mi.id = mr.Med_id;
