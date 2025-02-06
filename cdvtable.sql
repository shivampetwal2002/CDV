CREATE TABLE CDV AS
SELECT

-- customers_customers_schema
    c.unique_id AS unique_id_cu,
    c.dealer AS dealer_cu,
    c.project_status AS project_status_cu,
    c.puma AS puma_cu,
    c.credit_expiration_date_field AS credit_expiration_date_cu,
    c.account_executive AS account_executive_cu,
    c.state AS state_cu,
    c.address AS address_cu,
    c.finance_id AS finance_id_cu,
    c.primary_sales_rep AS primary_sales_rep_cu,
    c.secondary_sales_rep AS secondary_sales_rep_cu,
    c.total_system_cost AS contract_total_cu,
    c.email_address AS customer_email_cu,
    c.phone_number AS customer_phone_number_cu,
    c.jeopardy_date AS jeopardy_date_cu,
    c.setter AS setter_cu,
    c.adder_breakdown_and_total_new AS adder_breakdown_total_cu,
    c.office AS office_cu,
    c.utility_company AS utility_company_cu,
    --c.created_on AS customer_created_on,
    c.sale_date AS sale_date_cu,
    c.last_contact_w_ho AS last_contact_w_ho_cu,
    c.customer_name AS customer_name_cu,

--sales_partner_dbhub_schema
    spds.record_id record_id_sales_par,
    spds.partner_id AS partner_id_sales_par,

--prospects_customers_schema
    pc.name AS name_prospects,
    pc.prospect_created_on AS prospect_created_on_prospects,
    pc.working_date AS working_date_prospects,

--sales_rep_dbhub_schema
    sr.team AS team_salesrep,
    sr.team_region_untd AS team_region_untd_salesrep,

-- ntp_ntp_schema
    ntp.finance_type AS finance_type_ntp,
    ntp.net_epc AS net_epc_ntp,
    ntp.prospectid_dealerid_salesrepid AS prospect_id_dealer_id_and_sales_rep_id_ntp,
    ntp.owe_funded_adder_breakdown_total AS owe_funded_adder_breakdown_total_ntp,
    ntp.ahj AS ahj_ntp,
    ntp.total_cost_for_adders AS total_cost_for_adders_ntp,
    ntp.pending_ntp_date AS pending_ntp_date_ntp,
    ntp.ntp_complete_date AS ntp_complete_date_ntp,
    ntp.finance AS finance_ntp,
    --ntp. AS finance_partner,




-- sales_metrics_schema
    sms.cancelled_date AS cancelled_date_sales_me,

-- pv_install_install_subcontracting_schema
    pv.pv_install_day_window AS pv_install_scheduled_date_pv_ins,
    pv.install_complete_1_2 AS install_complete_1_2_date_pv_ins,
    pv.install_complete_2_3 AS install_complete_2_3_date_pv_ins,
    pv.pv_install_created_on AS pv_install_created_date_pv_ins,
    pv.pv_completion_date AS pv_install_completed_date_pv_ins,
    pv.assigned_foreman AS assigned_foreman_pv_ins,
    --pv.work_scheduled_date AS roofing_scheduled_date_pv_ins,
    pv.pv_install_created_on AS roofing_created_date_pv_ins,
    --pv.work_completed_date AS roofing_completed_date_pv_ins,

-- permit_fin_pv_permits_schema
    pf.pv_expected_approval_date AS permit_submittal_eta_permit_fin,
    pf.pv_redlined_date AS pv_redlined_date_permit_fin,
    pf.Created_on AS created_on_permit_fin,
    pf.pv_submitted AS pv_submitted_permit_fin,
    pf.pv_expected_approval_date AS permit_expected_approval_date_permit_fin,
    pf.permit_specialist AS permit_specialist_permit_fin,
    pf.pv_resubmitted AS pv_resubmitted_permit_fin,
    pf.pv_approved AS pv_approved_permit_fin,
    pf.permit_turnaround_time AS permit_turnaround_time_permit_fin,




-- survey_survey_schema
    sss.twond_completion_date AS second_completion_date_survey,
    sss.original_survey_scheduled_date AS original_survey_scheduled_date_survey,
    --sss. AS site_survey_rescheduled_date_survey,
    sss.survey_completion_date AS survey_completion_date_survey,

--planset_cad_schema pcs
    pcs.pe_ee_rejected_date AS cad_rejection_date_planset_cad,
    pcs.pe_ee_rejected_date AS pe_ee_rejected_date_planset_cad,
    pcs.cad_designer_name AS cad_designer_planset_cad,
    pcs.cad_pending_date_h AS cad_ready_planset_cad,
    pcs.cad_complete_date AS cad_complete_date_planset_cad,
    pcs.qa_fixes_pending_date_h AS cad_revision_requested_date_planset_cad,
    pcs.cad_pending_date_h AS abcad_ready_planset_cad,
    pcs.cad_complete_date AS abcad_completed_planset_cad,
    pcs.cad_designer_name AS cad_reviewer_planset_cad,

--pe_ee_stamps_cad_schema
    peee.submitted_date AS submitted_date_peee,
    peee.completion_date AS completion_date_peee,
    peee.redlined_date AS redlined_date_peee,
    peee.stamp_provider AS stamp_provider_peee,

--system_customers_schema
    scs.contracted_system_size_parent AS contracted_system_size_parent_sytem,
    scs.inverter AS inverter_system,
    --scs.module_type AS module_system,
    --scs.inverter_type AS solar_inverter_installed_system
    --scs.module_qty AS solar_modules_installed_system
    --scs.contracted_system_size  AS pv_array_size_kw_system




-- fire_permits_permit_fin_schema
    fppfs.fire_permit_created_on AS created_date_fire_permit,
    fppfs.submitted AS submitted_date_fire_permit,
    fppfs.approved AS approved_date_fire_permit,

-- battery_permits_permit_fin_schema
    bppfs.battery_permit_created_on AS created_on_battery_permit,
    bppfs.submitted AS submitted_date_battery_permit,
    bppfs.approved AS approved_date_battery_permit,

--batteries_service_electrical_schema
    bses.battery_installation_date AS scheduled_date_bat_ser,
    bses.completion_date AS complete_date_bat_ser,

-- electrical_permits_permit_fin_schema
    eppfs.created_on AS electrical_permit_created_on_elec_per,
    eppfs.submitted_date AS electrical_permit_submitted_date_elec_per,
    eppfs.approved AS electrical_permit_approved_date_elec_per,

-- ic_ic_pto_schema
    iips.created_on AS created_date_ic_ic,
    iips.ic_submitted_date AS submitted_date_ic_ic,
    iips.ic_estimated_approval_date AS expected_approval_date_ic_ic,
    --iips.Utility_Specialist  AS utility_specialist_ic_ic,
    iips.ic_resubmitted_date AS re_submitted_date_ic_ic,
    iips.ic_approved_date AS approved_date_ic_ic,
    iips.ic_rejection_date AS rejection_date_ic_ic,

--pto_ic_schema
    pis.pto_created_on AS created_on_pto,
    pis.submitted AS submitted_date_pto,
    pis.pto_specialist AS pto_specialist,
    pis.podio_redlined_date AS fail_date_pto,
    pis.pto_granted AS date_pto,

--fin_permit_fin_schema fp;
    fp.created_on AS created_date_fin_per,
    fp.fin_scheduled_on AS inspection_scheduled_date_fin_per,
    fp.approved_date AS approved_date_fin_per,
    fp.approved_date AS fin_pass_date_fin_per,
    fp.approved_date AS final_inspection_passed_date_fin_per,
    --fp. AS fin_scheduled_date,


-- trenching_service_electrical_schema
    tses.completion_date AS completion_date_trench_ser,
    tses.trenching_created_on AS trenching_created_trench_ser,
    tses.work_scheduled_date AS scheduled_trench_ser,

--roofing_request_install_subcontracting_schema
    rriss.app_status AS app_status_roof_req,

-- mpu_service_electrical_schema
    mses.mpu_created_on AS created_date_mpu_ser,
    mses.pk_or_cutover_date AS scheduled_date_mpu_ser,
    mses.pk_or_cutover_date_of_completion AS complete_date_mpu_ser,

-- derates_service_electrical_schema
    dses.derate_created_on AS created_date_derate,
    dses.scheduled_date AS scheduled_date_derate,
    dses.completion_date AS completed_date_derate





FROM customers_customers_schema c
LEFT JOIN ntp_ntp_schema ntp ON c.unique_id = ntp.unique_id
LEFT JOIN sales_rep_dbhub_schema sr ON SPLIT_PART(ntp.prospectid_dealerid_salesrepid, ',', 3) = sr.record_id::text
LEFT JOIN sales_partner_dbhub_schema spds ON SPLIT_PART(ntp.prospectid_dealerid_salesrepid, ',', 2) = spds.record_id::text
LEFT JOIN prospects_customers_schema pc ON SPLIT_PART(ntp.prospectid_dealerid_salesrepid, ',', 1) = pc.record_id::text
LEFT JOIN sales_metrics_schema sms ON c.unique_id = sms.unique_id
LEFT JOIN pv_install_install_subcontracting_schema pv ON sms.unique_id = pv.customer_unique_id
LEFT JOIN permit_fin_pv_permits_schema pf ON pv.customer_unique_id = pf.customer_unique_id
LEFT JOIN survey_survey_schema sss ON c.unique_id = sss.customer_unique_id
LEFT JOIN planset_cad_schema pcs ON sss.customer_unique_id = pcs.our_number
LEFT JOIN pe_ee_stamps_cad_schema peee ON pcs.our_number = peee.customer_unique_id
LEFT JOIN system_customers_schema scs ON peee.customer_unique_id = scs.customer_id
LEFT JOIN ic_ic_pto_schema iips ON c.unique_id = iips.unique_id
LEFT JOIN fire_permits_permit_fin_schema fppfs ON iips.unique_id = fppfs.customer_unique_id
LEFT JOIN battery_permits_permit_fin_schema bppfs ON fppfs.customer_unique_id = bppfs.customer_unique_id
LEFT JOIN electrical_permits_permit_fin_schema eppfs ON fppfs.customer_unique_id = eppfs.customer_unique_id
LEFT JOIN pto_ic_schema pis ON iips.unique_id = pis.unique_id
LEFT JOIN fin_permits_fin_schema fp ON pis.unique_id = fp.unique_id
LEFT JOIN trenching_service_electrical_schema tses ON fp.unique_id = tses.unique_id
LEFT JOIN roofing_request_install_subcontracting_schema rriss ON tses.unique_id = rriss.unique_id
LEFT JOIN mpu_service_electrical_schema mses ON rriss.unique_id = mses.unique_id
LEFT JOIN derates_service_electrical_schema dses ON mses.unique_id = dses.unique_id
LEFT JOIN batteries_service_electrical_schema bses ON dses.unique_id = bses.customer_unique_id
WHERE c.unique_id IS NOT NULL
AND c.unique_id != '';