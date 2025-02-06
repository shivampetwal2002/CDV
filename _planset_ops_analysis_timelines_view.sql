
CREATE VIEW planset_ops_analysis_timelines_view AS
SELECT
  intopsmetschema.unique_id,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.rtr_approved_date - intopsmetschema.pv_install_scheduled_date -- NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS install_ready_rtr_approved,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.permit_created - intopsmetschema.cad_ready
      ) / 86400.0,
      2
    )
  ) AS cad_timelines,
  projectmgmt.total_hold_days, -- NOT FOUND
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.install_ready_date - intopsmetschema.created_on -- NOT FOUND
      ) / 86400.0 - COALESCE(
        NULLIF(
          intopsmetschema.total_hold_days, '' :: text -- NOT FOUND
        ):: numeric,
        0 :: numeric
      ),
      2
    )
  ) AS install_ready_total_hold_days,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.pv_install_completed_date - intopsmetschema.ntp_date
      ) / 86400.0 + 7 :: numeric,
      2
    )
  ) AS ntp_7days,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.created_on - intopsmetschema.electrical_review_completion_date -- NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS sales_to_er_complete,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.created_on - planset.dat_complete_date
      ) / 86400.0,
      2
    )
  ) AS sales_to_dat_complete_date,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - intopsmetschema.electrical_review_completion_date  -- NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS survey_completed_to_er_complete,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - planset.dat_complete_date
      ) / 86400.0,
      2
    )
  ) AS survey_completed_to_dat_complete,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.fin_pass_date - intopsmetschema.fin_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS fin_scheduled_to_finpass,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.ic_approved_date - intopsmetschema.ic_submitted_date
      ) / 86400.0,
      2
    )
  ) AS ic_submitted_to_ic_approved,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.permit_submitted_date - intopsmetschema.permit_approved_date
      ) / 86400.0,
      2
    )
  ) AS pv_permit_submitted_to_permit_approved,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.created_on - planset.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS sales_to_cad_complete_date,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - planset.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS survey_completed_to_cad_complete_date,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          planset.dat_pending_date_h - planset.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS dat_to_cad_complete_date,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          planset.dat_pending_date_h - planset.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS dat_pending_to_cad_complete_date,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          planset.cad_pending_date_h - planset.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS cad_pending_to_cad_complete_date,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.contract_date - planset.plan_set_complete_day
      ) / 86400.0,
      2
    )
  ) AS sales_to_planset_complete_day,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - planset.plan_set_complete_day
      ) / 86400.0,
      2
    )
  ) AS survey_completed_to_planset_complete_day,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.pto_date - planset.plan_set_complete_day
      ) / 86400.0,
      2
    )
  ) AS planset_complete_day_to_pto,
  abs(
    round(
      EXTRACT(
        epoch
        FROM
          planset.dat_complete_date - planset.plan_set_complete_day
      ) / 86400.0,
      2
    )
  ) AS planset_complete_day_to_dat
FROM
  (
    SELECT
      customers_customers_schema.unique_id,
      customers_customers_schema.ss_appointment_date AS site_survey_scheduled_date,
      customers_customers_schema.ss_completed_date AS site_survey_completed_date,
      planset_cad_schema.cad_complete_date,
      ic_ic_pto_schema.ic_submitted_date,
      permit_fin_pv_permits_schema.pv_submitted as permit_submitted_date,
      ic_ic_pto_schema.ic_approved_date,
      permit_fin_pv_permits_schema.pv_approved as permit_approved_date,
      --internal_ops_metrics_schema.cad_requested_date, -- AS per data this field is not required
      pto_ic_schema.podio_redlined_date AS pto_fail_date,
      electrical_permits_permit_fin_schema.approved AS electrical_permit_approved_date ,
      pto_ic_schema.submitted AS pto_submitted_date,
      planset_cad_schema.cad_pending_date_h AS cad_ready,
      pe_ee_stamps_cad_schema.completion_date AS peee_complete_date,
      --internal_ops_metrics_schema.cad_review_date, -- AS per data this field is not required
      permit_fin_pv_permits_schema.created_on AS permit_created,
      --internal_ops_metrics_schema.electrical_review_completion_date, --NOT FOUND
      customers_customers_schema.item_created_on as created_on,

     ----------------new added---------------
    pv_install_install_subcontracting_schema.pv_install_day_window as pv_install_scheduled_date,
    pv_install_install_subcontracting_schema.pv_completion_date as pv_install_completed_date,
    fin_permits_fin_schema.approved_date as fin_pass_date,
    fin_permits_fin_schema.pv_fin_date as fin_scheduled_date,
    ntp_ntp_schema.ntp_complete_date AS ntp_date,
    customers_customers_schema.sale_date AS contract_date,
    pto_ic_schema.pto_granted as pto_date

    FROM
      --internal_ops_metrics_schema,
        pto_ic_schema,
        customers_customers_schema,
        pe_ee_stamps_cad_schema,
        planset_cad_schema,


      ic_ic_pto_schema,
      electrical_permits_permit_fin_schema,
      permit_fin_pv_permits_schema,
      ntp_ntp_schema,
      fin_permits_fin_schema,
      pv_install_install_subcontracting_schema

    WHERE
      customers_customers_schema.unique_id IS NOT NULL
      AND customers_customers_schema.unique_id :: text <> '' :: text

  ) intopsmetschema


JOIN pto_ic_schema pis on intopsmetschema.unique_id :: text = pis.customer_unique_id :: text
JOIN customers_customers_schema c on pis.customer_unique_id :: text = c.unique_id :: text
JOIN pe_ee_stamps_cad_schema peee on c.unique_id :: text = peee.customer_unique_id :: text
JOIN planset_cad_schema pcs on peee.customer_unique_id :: text = pcs.our_number :: text
JOIN ic_ic_pto_schema iicps on pcs.our_number  :: text = iicps.customer_unique_id :: text
JOIN electrical_permits_permit_fin_schema eppfs on iicps.customer_unique_id :: text = eppfs.customer_unique_id :: text
JOIN permit_fin_pv_permits_schema pfpps on eppfs.customer_unique_id :: text  = pfpps.customer_unique_id :: text
JOIN ntp_ntp_schema ntp on pfpps.customer_unique_id :: text = ntp.unique_id:: text
JOIN fin_permits_fin_schema fpfs on ntp.unique_id:: text :: text = fpfs.customer_unique_id :: text



  JOIN (

    SELECT
      planset_cad_schema.record_id,
      planset_cad_schema.customer,
      planset_cad_schema.our_number,
      planset_cad_schema.priority,
      planset_cad_schema.active_inactive,
      planset_cad_schema.plan_set_version,
      planset_cad_schema.project_status,
      planset_cad_schema.project_status_new,
      planset_cad_schema.customer_status,
      --planset_cad_schema.plan_set_status2, -- NOT FOUND exact field
      planset_cad_schema.plan_set_status,
      planset_cad_schema.query_reason,
      planset_cad_schema.query_notes,
      planset_cad_schema.project_notes,
      planset_cad_schema.ahj,
      planset_cad_schema.finance_company,
      planset_cad_schema.design_database_links,
      --planset_cad_schema.install_site_capture_link, -- NOT FOUND exact field
      planset_cad_schema.site_capture_link,
      planset_cad_schema.ntp,
      --planset_cad_schema.calculation, -- NOT FOUND
      planset_cad_schema.dat_status,
      planset_cad_schema.dat_assign_query,
      planset_cad_schema.dat_fail_reason,
      planset_cad_schema.dat_fail_date,
      planset_cad_schema.dat_pending_date_h,
      planset_cad_schema.dat_in_progress_date_h,
      planset_cad_schema.dat_pending_query_date_h,
      planset_cad_schema.dat_query_resolved_date_h,
      planset_cad_schema.dat_back_in_progress_date_h,
      planset_cad_schema.dat_complete_date,
      --planset_cad_schema.field, --NOT FOUND
      planset_cad_schema.cad_status,
      planset_cad_schema.cad_pending_date_h,
      planset_cad_schema.cad_in_progress_date_h,
      planset_cad_schema.cad_pending_query_date_h,
      planset_cad_schema.cad_query_resolved_date_h,
      planset_cad_schema.cad_back_in_progress_date_h,
      planset_cad_schema.cad_qa_pending_date_h,
      planset_cad_schema.cad_qa_in_progress_date_h,
      planset_cad_schema.cad_complete_date,
      planset_cad_schema.revision_request_id,
      planset_cad_schema.requested_by,
      planset_cad_schema.requesting_department,
      planset_cad_schema.revision_request_notes,
      planset_cad_schema.revision_reason,
      planset_cad_schema.was_install_deviation_approved_by_hotline,
      --planset_cad_schema.field_2, --NOT FOUND
      planset_cad_schema.cadr1_status,
      planset_cad_schema.cadr_1_assign_query,
      planset_cad_schema.cadr1_coordinator_name,
      planset_cad_schema.cadr1_pending_date_h,
      planset_cad_schema.cadr1_in_progress_date_h,
      planset_cad_schema.cadr1_pending_query_date_h,
      planset_cad_schema.cadr1_query_resolved_date_h,
      planset_cad_schema.cadr1_back_in_progress_date_h,
      planset_cad_schema.cadr1_pass_date,
      planset_cad_schema.cadr1_fail_date,
      planset_cad_schema.qa_fixes_pending_query_date_h,
      planset_cad_schema.qa_fixes_query_resolved_date_h,
      planset_cad_schema.qa_fixes_back_in_progress_date_h,
      planset_cad_schema.qa_fixes_complete_date,
      --planset_cad_schema.field_4, --NOT FOUND
      planset_cad_schema.cadr2_fail_date,
      planset_cad_schema.cadr2_pass_date,
      planset_cad_schema.pe_ee_stamp_date_and_time,
      planset_cad_schema.pe_ee_not_required_date_h,
      planset_cad_schema.pe_ee_pending_review_date_h,
      planset_cad_schema.pe_ee_pending_submission_date_h,
      planset_cad_schema.pe_ee_submission_in_progress_date_h,
      planset_cad_schema.pe_ee_submitted_date_h,
      planset_cad_schema.pe_ee_pending_query_date_h,
      planset_cad_schema.pe_ee_query_resolved_date_h,
      planset_cad_schema.pe_ee_back_in_progress_date_h,
      planset_cad_schema.pe_ee_approved_date,
      planset_cad_schema.pe_ee_rejected_date,
      planset_cad_schema.plan_set_inactive_date,
      planset_cad_schema.plan_set_complete_day,
      --planset_cad_schema.plan_set_created_to_inactive_or_complete, --NOT FOUND
      planset_cad_schema.most_recent_plan_set_h
      --planset_cad_schema.plan_set_created_to_complete, --NOT FOUND
      --planset_cad_schema.plan_set_created_to_inactive --NOT FOUND
    FROM
      planset_cad_schema
  ) planset ON intopsmetschema.unique_id :: text = planset.our_number;

