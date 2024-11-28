-- Google BigQuery SQL code to filter participants with levodopa-induced dyskinesias who have genetic data available
-- Dataset: amp-pd-research.2023_v4release_1027
-- Author: Vinicius Correa

SELECT demo.participant_id, demo.GUID, race, code_upd2401_time_spent_with_dyskinesias, code_upd2402_functional_impact_of_dyskinesias 
FROM `amp-pd-research.2023_v4release_1027.Demographics` demo, `amp-pd-research.2023_v4release_1027.MDS_UPDRS_Part_IV` UPDRS
WHERE demo.participant_id = UPDRS.participant_id
AND demo.participant_id IN (SELECT participant_id FROM `amp-pd-research.2023_v4release_1027.MDS_UPDRS_Part_IV` GROUP BY participant_id HAVING COUNT (participant_id) > 1)
AND code_upd2401_time_spent_with_dyskinesias > 1
AND demo.participant_id IN (SELECT participant_id FROM `amp-pd-research.2023_v4release_1027_genomics_WB_DWGS.wgs_WB_DWGS_samples`);


-- Google BigQuery SQL code to filter participants without levodopa-induced dyskinesias who have genetic data available
-- Dataset: amp-pd-research.2023_v4release_1027
-- Author: Vinicius Correa

SELECT demo.participant_id, demo.GUID, race, code_upd2401_time_spent_with_dyskinesias, code_upd2402_functional_impact_of_dyskinesias 
FROM `amp-pd-research.2023_v4release_1027.Demographics` demo, `amp-pd-research.2023_v4release_1027.MDS_UPDRS_Part_IV` UPDRS
WHERE demo.participant_id = UPDRS.participant_id
AND demo.participant_id IN (SELECT participant_id FROM `amp-pd-research.2023_v4release_1027.MDS_UPDRS_Part_IV` GROUP BY participant_id HAVING COUNT (participant_id) > 1)
AND code_upd2401_time_spent_with_dyskinesias = 0
AND demo.participant_id IN (SELECT participant_id FROM `amp-pd-research.2023_v4release_1027_genomics_WB_DWGS.wgs_WB_DWGS_samples`);

