
CREATE VIEW ops_analysis_timelines_view AS


SELECT
  ops_data.unique_id,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ntp_date -  site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_ntp,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.cancelled_date - ops_data.site_survey_completed_date -- cant find cancelled date
      ) / 86400.0,
      2
    )
  ) AS survey_to_cancel,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_install,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pto_date - ops_data.site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_pto,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.site_survey_completed_date - ops_data.site_survey_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS survey_scheduled_to_survey_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.created_on - ops_data.site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS sales_to_survey,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.ntp_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) AS sales_to_ntp,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.cad_complete_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_cad_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.ic_submitted_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_ic_submission,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.permit_submitted_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_permit_submission,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.ic_approved_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_ic_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.permit_approved_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_permit_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) AS sales_to_install,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.cancelled_date - ops_data.created_on ----NOT FOUND in other schema
      ) / 86400.0,
      2
    )
  ) AS sales_to_cancel,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pto_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) AS sales_to_pto,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.cad_complete_date - ops_data.cad_requested_date  -- AS per data this field is not required
      ) / 86400.0,
      2
    )
  ) AS cad_requested_to_cad_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.permit_submitted_date - ops_data.cad_requested_date -- AS per data this field is not required
      ) / 86400.0,
      2
    )
  ) AS cad_complete_to_permit_submitted,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.electrical_permit_approved_date - ops_data.cad_requested_date -- AS per data this field is not required
      ) / 86400.0,
      2
    )
  ) AS cad_completed_to_electrical_permit_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.cancelled_date - ops_data.ntp_date --NOT FOUND in other schema
      ) / 86400.0,
      2
    )
  ) AS ntp_to_cancel,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.ntp_date
      ) / 86400.0,
      2
    )
  ) AS ntp_to_install,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pto_date - ops_data.ntp_date
      ) / 86400.0,
      2
    )
  ) AS ntp_to_pto,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.permit_approved_date
      ) / 86400.0,
      2
    )
  ) AS pv_permit_approved_to_install_complete,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.cancelled_date - ops_data.pv_install_completed_date --NOT FOUND in other schema
      ) / 86400.0,
      2
    )
  ) AS install_to_cancel,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pto_date - ops_data.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_pto,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.pv_install_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS install_scheduled_to_install_complete,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.fin_pass_date - ops_data.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_fin,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.fin_scheduled_date - ops_data.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_fin_submitted,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pto_submitted_date - ops_data.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_pto_submitted,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pto_date - ops_data.rtr_approved_date --NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS rtr_pass_pto_pass,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.fin_fail_date - ops_data.rtr_approved_date --NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS rtr_pass_fin_fail,
  Abs(
    Round(
      EXTRACT(
        epoch        FROM
          ops_data.pto_fail_date - ops_data.rtr_approved_date  --NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS rtr_pass_pto_fail,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.rtr_approved_date - ops_data.rtr_request_date_and_time --NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS rtr_speed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.service_completion_date - ops_data.service_created_date -- AS per data this field is not required , NOT FOUND ,
      ) / 86400.0,
      2
    )
  ) AS service_open_to_service_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.mpu_complete_date - ops_data.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS cad_to_mpu_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.mpu_complete_date - ops_data.mpu_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS mpu_scheduled_to_mpu_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.derate_completed_date - ops_data.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS cad_completed_to_derate_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.derate_completed_date - ops_data.derate_completed_date
      ) / 86400.0,
      2
    )
  ) AS derate_scheduled_to_derate_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.battery_complete_date - ops_data.battery_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS battery_scheduled_to_battery_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.created_on - ops_data.cad_review_date  -- AS per data this field is not required
      ) / 86400.0,
      2
    )
  ) AS sales_to_cad_review,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.site_survey_completed_date - ops_data.cad_review_date -- AS per data this field is not required
      ) / 86400.0,
      2
    )
  ) AS survey_to_cad_review,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.site_survey_completed_date - ops_data.fin_pass_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_fin,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.site_survey_completed_date - ops_data.peee_complete_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_stamp,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.site_survey_completed_date - ops_data.mpu_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_mpu,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.site_survey_completed_date - ops_data.derate_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_derate,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.ic_approved_date - ops_data.ic_submitted_date
      ) / 86400.0 + 15 :: numeric,
      2
    )
  ) AS utility_turnaround_15,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.permit_approved_date - ops_data.permit_submitted_date
      ) / 86400.0 + 15 :: numeric,
      2
    )
  ) AS permit_turnaround_15,
  CASE WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) > Greatest(
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            ops_data.ic_approved_date - ops_data.ic_submitted_date
        ) / 86400.0 + 15 :: numeric,
        2
      )
    ),
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            ops_data.permit_approved_date - ops_data.permit_submitted_date
        ) / 86400.0 + 15 :: numeric,
        2
      )
    )
  ) THEN 'Out of SLA' :: text ELSE 'Within SLA' :: text END AS ahj_15_sla,
  CASE WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) > Greatest(
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            ops_data.ic_approved_date - ops_data.ic_submitted_date
        ) / 86400.0 + 7 :: numeric,
        2
      )
    ),
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            ops_data.permit_approved_date - ops_data.permit_submitted_date
        ) / 86400.0 + 7 :: numeric,
        2
      )
    )
  ) THEN 'Out of SLA' :: text ELSE 'Within SLA' :: text END AS ahj_7_sla,
  CASE WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.install_ready_date - ops_data.created_on  -- NOT FOUND
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.install_ready_date - ops_data.created_on  -- NOT FOUND
      ) / 86400.0 - Coalesce(
        Nullif(
          ops_data.total_hold_days, '' :: text   ----------------------------ERRORRRRRRRRRRRRRR
        ) :: numeric,
        0 :: numeric
      ),
      2
    )
  ) > Greatest(
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            ops_data.ic_approved_date - ops_data.ic_submitted_date
        ) / 86400.0 + 15 :: numeric,
        2
      )
    ),
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            ops_data.permit_approved_date - ops_data.permit_submitted_date
        ) / 86400.0 + 15 :: numeric,
        2
      )
    )
  ) THEN 'Out of SLA' :: text ELSE 'Within SLA' :: text END AS ahj_15_sla_install_ready,
  CASE WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.install_ready_date - ops_data.created_on  -- NOT FOUND
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.install_ready_date - ops_data.created_on -- NOT FOUND
      ) / 86400.0 - Coalesce(
        Nullif(
          ops_data.total_hold_days, '' :: text -- NOT FOUND
        ) :: numeric,
        0 :: numeric
      ),
      2
    )
  ) > Greatest(
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            ops_data.ic_approved_date - ops_data.ic_submitted_date
        ) / 86400.0 + 7 :: numeric,
        2
      )
    ),
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            ops_data.permit_approved_date - ops_data.permit_submitted_date
        ) / 86400.0 + 7 :: numeric,
        2
      )
    )
  ) THEN 'Out of SLA' :: text ELSE 'Within SLA' :: text END AS ahj_7_install_ready,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.install_ready_date - ops_data.created_on  -- NOT FOUND
      ) / 86400.0 - Coalesce(
        Nullif(
          ops_data.total_hold_days, '' :: text   -- NOT FOUND
        ) :: numeric,
        0 :: numeric
      ),
      2
    )
  ) AS sales_to_install_ready,
  CASE WHEN ops_data.ic_submitted_date IS NULL
  OR ops_data.created_on IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.ic_submitted_date - ops_data.created_on
      ) / 86400.0,
      2
    )
  ) > 7 :: numeric THEN 'Within SLA' :: text ELSE 'Out of SLA' :: text END AS sales_7_sla,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.rtr_approved_date - ops_data.pv_install_scheduled_date  -- NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS install_ready_rtr_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.permit_created - ops_data.cad_ready
      ) / 86400.0,
      2
    )
  ) AS cad_timelines,
  ops_data.total_hold_days,  -- NOT FOUND
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.install_ready_date - ops_data.created_on  -- NOT FOUND
      ) / 86400.0 - Coalesce(
        Nullif(
          ops_data.total_hold_days, '' :: text  -- NOT FOUND
        ) :: numeric,
        0 :: numeric
      ),
      2
    )
  ) AS install_ready_total_hold_days,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.ntp_date
      ) / 86400.0 + 7 :: numeric,
      2
    )
  ) AS ntp_7days,
  CASE WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.ntp_date
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.pv_install_completed_date - ops_data.ntp_date
      ) / 86400.0,
      2
    )
  ) > 7 :: numeric THEN 'Within SLA' :: text ELSE 'Out of SLA' :: text END AS ntp_7_sla,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.created_on - ops_data.electrical_review_completion_date --NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS sales_to_er_complete,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.site_survey_completed_date - ops_data.electrical_review_completion_date --NOT FOUND
      ) / 86400.0,
      2
    )
  ) AS survey_completed_to_er_complete,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.fin_pass_date - ops_data.fin_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS fin_scheduled_to_finpass,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.ic_approved_date - ops_data.ic_submitted_date
      ) / 86400.0,
      2
    )
  ) AS ic_submitted_to_ic_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ops_data.permit_submitted_date - ops_data.permit_approved_date
      ) / 86400.0,
      2
    )
  ) AS pv_permit_submitted_to_permit_approved
FROM
  (
    SELECT
      customers_customers_schema.unique_id,
      service_requests_service_electrical_schema.record_created_on as created_on,
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
      permit_fin_pv_permits_schema.created_on AS permit_created, -- AS per data this field is not required
      --internal_ops_metrics_schema.electrical_review_completion_date,-- NOT FOUND

    ----
    ntp_ntp_schema.ntp_complete_date AS ntp_date,
    pv_install_install_subcontracting_schema.pv_completion_date as pv_install_completed_date,
    pv_install_install_subcontracting_schema.pv_install_day_window as pv_install_scheduled_date,
    pto_ic_schema.pto_granted as pto_date,
    fin_permits_fin_schema.approved_date as fin_pass_date,
    fin_permits_fin_schema.pv_fin_date as fin_scheduled_date,
    mpu_service_electrical_schema.pk_or_cutover_date_of_completion as mpu_complete_date,
    mpu_service_electrical_schema.pk_or_cutover_date_of_completion as mpu_scheduled_date,
    derates_service_electrical_schema.completion_date as derate_completed_date,
    batteries_service_electrical_schema.battery_installation_date as  battery_scheduled_date,
    batteries_service_electrical_schema.completion_date as battery_complete_date,

    --new mapped fields which were not found
    customers_customers_schema.cancel_date as cancelled_date,
    rtr_two_install_subcontracting_schema.install_rtr_pass as rtr_approved_date,
    rtr_two_install_subcontracting_schema.install_rtr_pending_date as rtr_request_date_and_time,
    permit_fin_pv_permits_schema.pv_redlined_date as fin_fail_date,
    service_requests_service_electrical_schema.pto_date as service_created_date, -- **reassign -> (service_request_created_on ) _it is giving error , text+all empty
    pv_install_install_subcontracting_schema.pv_scheduling_ready_date as install_ready_date,

    --customers_customers_schema.?????? as total_hold_days, --------------have to reassign ,--------------------------- CHECK,
    planset_cad_schema.hold_duration_days as total_hold_days, --------- temp using this field , have to remove it
    planset_cad_schema.dat_complete_date as electrical_review_completion_date,
    planset_cad_schema.record_created_on as cad_requested_date,
    service_requests_service_electrical_schema.completion_date as service_completion_date , --
    planset_cad_schema.cadr1_pass_date as cad_review_date




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
      pv_install_install_subcontracting_schema,
    ----
      fin_permits_fin_schema,
      mpu_service_electrical_schema,
      derates_service_electrical_schema,
      batteries_service_electrical_schema,
      rtr_two_install_subcontracting_schema,
      service_requests_service_electrical_schema

    WHERE
      customers_customers_schema.unique_id IS NOT NULL
      AND customers_customers_schema.unique_id :: text <> '' :: text
    AND service_requests_service_electrical_schema.service_request_created_on IS NOT NULL
    AND service_requests_service_electrical_schema.service_request_created_on != ''

  ) ops_data

JOIN pto_ic_schema pis on ops_data.unique_id  = pis.customer_unique_id
JOIN customers_customers_schema c on pis.customer_unique_id  = c.unique_id
JOIN pe_ee_stamps_cad_schema peee on c.unique_id  = peee.customer_unique_id
JOIN planset_cad_schema pcs on peee.customer_unique_id  = pcs.our_number
JOIN ic_ic_pto_schema iicps on pcs.our_number   = iicps.customer_unique_id
JOIN electrical_permits_permit_fin_schema eppfs on iicps.customer_unique_id  = eppfs.customer_unique_id
JOIN permit_fin_pv_permits_schema pfpps on eppfs.customer_unique_id   = pfpps.customer_unique_id
JOIN ntp_ntp_schema ntp on pfpps.customer_unique_id   = ntp.unique_id
JOIN fin_permits_fin_schema fpfs on ntp.unique_id  = fpfs.customer_unique_id
JOIN mpu_service_electrical_schema mses on fpfs.customer_unique_id   = mses.customer_unique_id
JOIN derates_service_electrical_schema dses on mses.customer_unique_id   = dses.customer_unique_id
JOIN batteries_service_electrical_schema bses on dses.customer_unique_id  = bses.customer_unique_id
JOIN rtr_two_install_subcontracting_schema rtiss  on bses.customer_unique_id  = rtiss.customer_unique_id
JOIN service_requests_service_electrical_schema srses on rtiss.customer_unique_id = srses.customer_unique_id
