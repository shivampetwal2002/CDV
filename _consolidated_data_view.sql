
CREATE VIEW
    consolidated_data_view AS
SELECT
    intOpsMetSchema.unique_id,
    --intopsmetschema.installer, -- AS per data this field is not required
    intopsmetschema.customer_last_contacted,
    intopsmetschema.home_owner,
    intopsmetschema.office,
    intopsmetschema.system_size,
    intopsmetschema.prospect_working_date,
    --intopsmetschema.hours_to_welcome_call, -- AS per data this field is not required
    --intopsmetschema.first_5_days_date,  -- AS per data this field is not required
    intopsmetschema.site_survey_scheduled_date,
    --intopsmetschema.site_survey_rescheduled_date, --NOT FOUND in schema
    intopsmetschema.site_survey_completed_date,
    --intopsmetschema.cad_rejection_date, --NOT FOUND in schema
    intopsmetschema.peee_rejection_date,
    --intopsmetschema.cad_requested_date, -- AS per data this field is not required
    intopsmetschema.cad_designer,
    intopsmetschema.cad_ready,
    intopsmetschema.cad_complete_date,
    --intopsmetschema.cad_redline, -- AS per data this field is not required
    intopsmetschema.cad_revision_requested_date,
    --intopsmetschema.cad_revisions_completed, -- AS per data this field is not required
    intopsmetschema.abcad_ready,
    intopsmetschema.abcad_completed,
    --intopsmetschema.abcad_revised, -- AS per data this field is not required
    --intopsmetschema.abcad_revisions_completed, -- AS per data this field is not required
    --intopsmetschema.cad_review_date, -- AS per data this field is not required
    intopsmetschema.cad_reviewer,
    intopsmetschema.permit_redlined,
    intopsmetschema.peee_submitted_date,
    --intopsmetschema.ab_permit_redlined, -- AS per data this field is not required
    intopsmetschema.peee_complete_date,
    intopsmetschema.peee_redline_date,
    intopsmetschema.stamp_provider,
    intopsmetschema.ahj,
    intopsmetschema.permit_created,
    intopsmetschema.permit_submitted_date,
    intopsmetschema.pv_expected_approval_date as permit_expected_approval_date,
    intopsmetschema.permitting_specialist,
    intopsmetschema.permit_re_submitted_date,
    intopsmetschema.permit_approved_date,
    intopsmetschema.fire_permit_created_date,
    intopsmetschema.fire_permit_submitted_date,
    intopsmetschema.fire_permit_approved_date,
    intopsmetschema.battery_permit_created_date,
    intopsmetschema.battery_permit_submitted_date,
    intopsmetschema.battery_permit_approved_date,
    intopsmetschema.electrical_permit_created_date,
    intopsmetschema.electrical_permit_submitted_date,
    intopsmetschema.electrical_permit_approved_date,
    intopsmetschema.pv_redlined_date,
    intopsmetschema.permit_turnaround_time,
    intopsmetschema.ic_created_date,
    intopsmetschema.ic_submitted_date,
    intopsmetschema.ic_expected_approval_date,
    --intopsmetschema.utility_specialist, --NOT FOUND in schema
    intopsmetschema.utility_company,
    intopsmetschema.ic_re_submitted_date,
    intopsmetschema.ic_approved_date,
    intopsmetschema.ic_rejection_date,
    intopsmetschema.canceled_date,
    intopsmetschema.pv_install_created_date,
    intopsmetschema.pv_install_completed_date,
    --intopsmetschema.electrical_submitted_date, -- AS per data this field is not required
    --intopsmetschema.electrical_approved_date, -- AS per data this field is not required
    intopsmetschema.pto_created_date,
    intopsmetschema.pto_submitted_date,
    intopsmetschema.pto_fail_date,
    intopsmetschema.pto_date,
    intopsmetschema.inverter_part_number,
    intopsmetschema.module,
    intopsmetschema.created_on,
    salmetschema.customer,
    salmetschema.prospect,
    salmetschema.project_status,
    salmetschema.puma_cat,
    salmetschema.puma_cat_supervisor,
    salmetschema.source,
    salmetschema.loan_type,
    salmetschema.contract_date,
    salmetschema.contract_date_r,
    salmetschema.ntp_working_date,
    salmetschema.ntp_date,
    salmetschema.ntp_date_r,
    intopsmetschema.credit_expiration_date_field,
    salmetschema.shaky_status_date,
    salmetschema.cancelled_date,
    salmetschema.pv_install_scheduled_date,
    salmetschema.install_eta_date AS install_eta,----
    salmetschema.dealer,
    salmetschema.account_executive,
    salmetschema.partner,
    salmetschema.state,
    salmetschema.customer_address AS address,  ----
    salmetschema.finance_company,
    salmetschema.finance_id,
    salmetschema.primary_sales_rep,
    salmetschema.secondary_sales_rep,
    salmetschema.contract_total,
    salmetschema.net_epc,
    salmetschema.prospect_created_on,
    salmetschema.wc_1,
    salmetschema.wc_2,
    salmetschema.active_date,
    salmetschema.permit_submittal_eta,
    salmetschema.estimated_project_lifespan,
    salmetschema.adjusted_project_lifespan,
    salmetschema.project_lifespan_delta,
    salmetschema.customer_email,
    salmetschema.customer_phone_number,
    salmetschema.team_region_untd,
    salmetschema.jeopardy_date,
    salmetschema.recruiter,
    salmetschema.setter,
    salmetschema.pv_install_completed_date_r,
    salmetschema.prospect_id_dealer_id_and_sales_rep_id, ----
    fieldopsschema.director,
    fieldopsschema.surveyor_name,
    fieldopsschema.permit_redline_count,
    fieldopsschema.install_funding_redlined,
    fieldopsschema.permit_resubmitted_date,
    fieldopsschema.ab_resubmitted_date,
    fieldopsschema.install_ready_date,
    fieldopsschema.install_rescheduled_date,
    fieldopsschema.install_team,
    fieldopsschema.install_manager,
    fieldopsschema.rtr_request_date_and_time,
    fieldopsschema.rtr_approved_date,
    fieldopsschema.rtr_reviewer,
    fieldopsschema.roofing_created_date,
    fieldopsschema.roofing_scheduled_date,
    fieldopsschema.roofing_completed_date,
    fieldopsschema.derate_ready_date,
    fieldopsschema.derate_scheduled_date,
    fieldopsschema.derate_completed_date,
    fieldopsschema.derate_tech,
    fieldopsschema.mpu_ready_date,
    fieldopsschema.mpu_scheduled_date,
    fieldopsschema.mpu_tech,
    fieldopsschema.battery_ready_date,
    fieldopsschema.battery_scheduled_date,
    fieldopsschema.battery_complete_date,
    fieldopsschema.initial_battery_tech,
    fieldopsschema.fin_scheduled_date,
    fieldopsschema.technician_assigned,
    fieldopsschema.fin_rescheduled_date,
    fieldopsschema.fin_created_date,
    fieldopsschema.fin_fail_date,
    fieldopsschema.fin_pass_date,
    fieldopsschema.service_created_date,
    fieldopsschema.service_pending_action_date,
    fieldopsschema.service_reschedule_count,
    fieldopsschema.service_reschedule_date,
    fieldopsschema.service_scheduled_date,
    fieldopsschema.service_completion_date,
    fieldopsschema.mpu_created_date,
    fieldopsschema.mpu_complete_date,
    fieldopsschema.fin_pv_redlined_date,
    fieldopsschema.derate_created_date,
    fieldopsschema.first_battery_type,
    fieldopsschema.first_battery_qty,
    fieldopsschema.second_battery_type,
    fieldopsschema.second_battery_qty,
    salmetschema.survey_2nd_completion_date,
    salmetschema.pv_install_complete_1_2_date,
    salmetschema.pv_install_complete_2_3_date,
    salmetschema.adder_breakdown_total, ----
    salmetschema.adders_total,
    salmetschema.adder_breakdown_total_1, ---- ? before it was: adder_breakdown_and_total2
    salmetschema.owe_funded_adder_breakdown_total, ----
    secondfieldopsschema.trenching_ws_open,
    secondfieldopsschema.trenching_completed,
    secondfieldopsschema.trenching_scheduled,
    secondfieldopsschema.roofing_status,
    secondfieldopsschema.assigned_foreman,
    split_part (salmetschema.team_region_untd, '/', 1) AS team,
    split_part (salmetschema.team_region_untd, '/', 2) AS region,
    CASE
        WHEN intOpsMetSchema.system_size IS NULL
        OR intOpsMetSchema.system_size <= 0 THEN 0
        ELSE salMetSchema.contract_total / (intOpsMetSchema.system_size * 1000)
    END AS epc
FROM
    (
        SELECT
            permit_fin_pv_permits_schema.pv_expected_approval_date as permit_expected_approval_date,
            customers_customers_schema.credit_expiration_date_field,
            customers_customers_schema.unique_id,
            --installer, -- AS per data this field is not required
            customers_customers_schema.last_contact_w_ho as customer_last_contacted,
            customers_customers_schema.customer_name as home_owner,
            customers_customers_schema.office,
            system_customers_schema.contracted_system_size_parent as system_size,
            prospects_customers_schema.working_date as prospect_working_date,
            --hours_to_welcome_call, -- AS per data this field is not required
            --first_5_days_date, -- AS per data this field is not required
            customers_customers_schema.ss_appointment_date AS site_survey_scheduled_date,----
            --site_survey_rescheduled_date, --NOT FOUND in schema
            customers_customers_schema.ss_completed_date AS site_survey_completed_date,----
            --cad_rejection_date, --NOT FOUND in schema
            planset_cad_schema.pe_ee_rejected_date AS peee_rejection_date,
            --cad_requested_date, -- AS per data this field is not required
            planset_cad_schema.cad_designer_name AS cad_designer,
            planset_cad_schema.cad_pending_date_h AS cad_ready,
            planset_cad_schema.cad_complete_date,
            --cad_redline, -- AS per data this field is not required
            planset_cad_schema.qa_fixes_pending_date_h AS cad_revision_requested_date,
            --cad_revisions_completed, -- AS per data this field is not required
            planset_cad_schema.cad_pending_date_h AS abcad_ready,
            planset_cad_schema.cad_complete_date AS abcad_completed,
            --abcad_revised, -- AS per data this field is not required
            --abcad_revisions_completed, -- AS per data this field is not required
            --cad_review_date, -- AS per data this field is not required
            planset_cad_schema.cad_designer_name AS cad_reviewer,
            permit_fin_pv_permits_schema.pv_redlined_date AS permit_redlined,
            pe_ee_stamps_cad_schema.submitted_date AS peee_submitted_date,
            --ab_permit_redlined, -- AS per data this field is not required
            pe_ee_stamps_cad_schema.completion_date AS peee_complete_date,
            pe_ee_stamps_cad_schema.redlined_date AS peee_redline_date,
            pe_ee_stamps_cad_schema.stamp_provider,
            planset_cad_schema.ahj,
            permit_fin_pv_permits_schema.created_on AS permit_created,
            permit_fin_pv_permits_schema.pv_submitted as permit_submitted_date,
            permit_fin_pv_permits_schema.pv_expected_approval_date,
            permit_fin_pv_permits_schema.permit_specialist AS permitting_specialist,
            permit_fin_pv_permits_schema.pv_resubmitted AS permit_re_submitted_date,
            permit_fin_pv_permits_schema.pv_approved as permit_approved_date,
            fire_permits_permit_fin_schema.fire_permit_created_on AS fire_permit_created_date,
            fire_permits_permit_fin_schema.submitted AS fire_permit_submitted_date,
            fire_permits_permit_fin_schema.approved AS fire_permit_approved_date,
            battery_permits_permit_fin_schema.battery_permit_created_on AS battery_permit_created_date,
            battery_permits_permit_fin_schema.submitted AS battery_permit_submitted_date,
            battery_permits_permit_fin_schema.approved AS battery_permit_approved_date,
            electrical_permits_permit_fin_schema.created_on AS electrical_permit_created_date,
            electrical_permits_permit_fin_schema.submitted_date AS electrical_permit_submitted_date,
            electrical_permits_permit_fin_schema.approved AS electrical_permit_approved_date,
            permit_fin_pv_permits_schema.pv_redlined_date,
            permit_fin_pv_permits_schema.permit_turnaround_time,
            ic_ic_pto_schema.created_on AS ic_created_date,
            ic_ic_pto_schema.ic_submitted_date,
            ic_ic_pto_schema.ic_estimated_approval_date AS ic_expected_approval_date,
            --utility_specialist,  --NOT FOUND in schema
            customers_customers_schema.utility_company,
            ic_ic_pto_schema.ic_resubmitted_date AS ic_re_submitted_date,
            ic_ic_pto_schema.ic_approved_date,
            ic_ic_pto_schema.ic_rejection_date,
            -- sales_metrics_schema.cancelled_date,  --NOT FOUND in other schema
            pv_install_install_subcontracting_schema.created_on AS pv_install_created_date,
            pv_install_install_subcontracting_schema.pv_completion_date as pv_install_completed_date,
            --electrical_submitted_date, -- AS per data this field is not required
            --electrical_approved_date, -- AS per data this field is not required
            pto_ic_schema.pto_created_on AS pto_created_date,
            pto_ic_schema.submitted as pto_submitted_date,
            pto_ic_schema.podio_redlined_date AS pto_fail_date,
            pto_ic_schema.pto_granted as pto_date,
            ntp_ntp_schema.inverter_part_number,
            --system_customers_schema.module_type as module, --NOT FOUND exact
            customers_customers_schema.item_created_on as created_on

        FROM
            --internal_ops_metrics_schema,
            customers_customers_schema,
            planset_cad_schema,
            battery_permits_permit_fin_schema,
            fire_permits_permit_fin_schema,
            electrical_permits_permit_fin_schema,
            ic_ic_pto_schema,
            pe_ee_stamps_cad_schema,
            pto_ic_schema,
            permit_fin_pv_permits_schema,
            ntp_ntp_schema,
            pv_install_install_subcontracting_schema,
            survey_survey_schema,
            system_customers_schema,
            prospects_customers_schema



        WHERE
            customers_customers_schema.unique_id IS NOT NULL
            AND customers_customers_schema.unique_id <> ''
    ) intOpsMetSchema
    LEFT JOIN sales_metrics_schema salMetSchema ON intOpsMetSchema.unique_id = salMetSchema.unique_id
    LEFT JOIN field_ops_metrics_schema fieldOpsSchema ON intOpsMetSchema.unique_id = fieldOpsSchema.unique_id
    LEFT JOIN second_field_ops_metrics_schema secondfieldOpsSchema ON intOpsMetSchema.unique_id = secondfieldOpsSchema.unique_id;

