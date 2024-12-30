
CREATE VIEW ops_analysis_timelines_view AS
SELECT
  intopsmetschema.unique_id,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          ntp_date -  intopsmetschema.site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_ntp,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.cancelled_date - intopsmetschema.site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_cancel,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - intopsmetschema.site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_install,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.pto_date - intopsmetschema.site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_pto,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - intopsmetschema.site_survey_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS survey_scheduled_to_survey_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.created_on - intopsmetschema.site_survey_completed_date
      ) / 86400.0,
      2
    )
  ) AS sales_to_survey,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.ntp_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sales_to_ntp,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.cad_complete_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_cad_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.ic_submitted_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_ic_submission,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.permit_submitted_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_permit_submission,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.ic_approved_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_ic_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.permit_approved_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sale_to_permit_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sales_to_install,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.cancelled_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sales_to_cancel,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pto_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) AS sales_to_pto,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.cad_complete_date - intopsmetschema.cad_requested_date
      ) / 86400.0,
      2
    )
  ) AS cad_requested_to_cad_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.permit_submitted_date - intopsmetschema.cad_requested_date
      ) / 86400.0,
      2
    )
  ) AS cad_complete_to_permit_submitted,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.electrical_permit_approved_date - intopsmetschema.cad_requested_date
      ) / 86400.0,
      2
    )
  ) AS cad_completed_to_electrical_permit_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.cancelled_date - salmetschema.ntp_date
      ) / 86400.0,
      2
    )
  ) AS ntp_to_cancel,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - salmetschema.ntp_date
      ) / 86400.0,
      2
    )
  ) AS ntp_to_install,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pto_date - salmetschema.ntp_date
      ) / 86400.0,
      2
    )
  ) AS ntp_to_pto,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - intopsmetschema.permit_approved_date
      ) / 86400.0,
      2
    )
  ) AS pv_permit_approved_to_install_complete,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.cancelled_date - salmetschema.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_cancel,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pto_date - salmetschema.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_pto,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - fieldopsschema.pv_install_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS install_scheduled_to_install_complete,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.fin_pass_date - salmetschema.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_fin,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.fin_scheduled_date - salmetschema.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_fin_submitted,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.pto_submitted_date - salmetschema.pv_install_completed_date
      ) / 86400.0,
      2
    )
  ) AS install_to_pto_submitted,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pto_date - fieldopsschema.rtr_approved_date
      ) / 86400.0,
      2
    )
  ) AS rtr_pass_pto_pass,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.fin_fail_date - fieldopsschema.rtr_approved_date
      ) / 86400.0,
      2
    )
  ) AS rtr_pass_fin_fail,
  Abs(
    Round(
      EXTRACT(
        epoch        FROM
          intopsmetschema.pto_fail_date - fieldopsschema.rtr_approved_date
      ) / 86400.0,
      2
    )
  ) AS rtr_pass_pto_fail,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.rtr_approved_date - fieldopsschema.rtr_request_date_and_time
      ) / 86400.0,
      2
    )
  ) AS rtr_speed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.service_completion_date - fieldopsschema.service_created_date
      ) / 86400.0,
      2
    )
  ) AS service_open_to_service_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.mpu_complete_date - intopsmetschema.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS cad_to_mpu_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.mpu_complete_date - fieldopsschema.mpu_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS mpu_scheduled_to_mpu_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.derate_completed_date - intopsmetschema.cad_complete_date
      ) / 86400.0,
      2
    )
  ) AS cad_completed_to_derate_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.derate_completed_date - fieldopsschema.derate_completed_date
      ) / 86400.0,
      2
    )
  ) AS derate_scheduled_to_derate_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.battery_complete_date - fieldopsschema.battery_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS battery_scheduled_to_battery_completed,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.created_on - intopsmetschema.cad_review_date
      ) / 86400.0,
      2
    )
  ) AS sales_to_cad_review,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - intopsmetschema.cad_review_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_cad_review,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - fieldopsschema.fin_pass_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_fin,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - intopsmetschema.peee_complete_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_stamp,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - fieldopsschema.mpu_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_mpu,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - fieldopsschema.derate_completed_date
      ) / 86400.0,
      2
    )
  ) AS survey_to_derate,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.ic_approved_date - intopsmetschema.ic_submitted_date
      ) / 86400.0 + 15 :: numeric,
      2
    )
  ) AS utility_turnaround_15,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.permit_approved_date - intopsmetschema.permit_submitted_date
      ) / 86400.0 + 15 :: numeric,
      2
    )
  ) AS permit_turnaround_15,
  CASE WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) > Greatest(
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            intopsmetschema.ic_approved_date - intopsmetschema.ic_submitted_date
        ) / 86400.0 + 15 :: numeric,
        2
      )
    ),
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            intopsmetschema.permit_approved_date - intopsmetschema.permit_submitted_date
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
          salmetschema.pv_install_completed_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) > Greatest(
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            intopsmetschema.ic_approved_date - intopsmetschema.ic_submitted_date
        ) / 86400.0 + 7 :: numeric,
        2
      )
    ),
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            intopsmetschema.permit_approved_date - intopsmetschema.permit_submitted_date
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
          fieldopsschema.install_ready_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.install_ready_date - intopsmetschema.created_on
      ) / 86400.0 - Coalesce(
        Nullif(
          projectmgmt.total_hold_days, '' :: text
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
            intopsmetschema.ic_approved_date - intopsmetschema.ic_submitted_date
        ) / 86400.0 + 15 :: numeric,
        2
      )
    ),
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            intopsmetschema.permit_approved_date - intopsmetschema.permit_submitted_date
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
          fieldopsschema.install_ready_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.install_ready_date - intopsmetschema.created_on
      ) / 86400.0 - Coalesce(
        Nullif(
          projectmgmt.total_hold_days, '' :: text
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
            intopsmetschema.ic_approved_date - intopsmetschema.ic_submitted_date
        ) / 86400.0 + 7 :: numeric,
        2
      )
    ),
    Abs(
      Round(
        EXTRACT(
          epoch
          FROM
            intopsmetschema.permit_approved_date - intopsmetschema.permit_submitted_date
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
          fieldopsschema.install_ready_date - intopsmetschema.created_on
      ) / 86400.0 - Coalesce(
        Nullif(
          projectmgmt.total_hold_days, '' :: text
        ) :: numeric,
        0 :: numeric
      ),
      2
    )
  ) AS sales_to_install_ready,
  CASE WHEN intopsmetschema.ic_submitted_date IS NULL
  OR intopsmetschema.created_on IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.ic_submitted_date - intopsmetschema.created_on
      ) / 86400.0,
      2
    )
  ) > 7 :: numeric THEN 'Within SLA' :: text ELSE 'Out of SLA' :: text END AS sales_7_sla,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.rtr_approved_date - fieldopsschema.pv_install_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS install_ready_rtr_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.permit_created - intopsmetschema.cad_ready
      ) / 86400.0,
      2
    )
  ) AS cad_timelines,
  projectmgmt.total_hold_days,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.install_ready_date - intopsmetschema.created_on
      ) / 86400.0 - Coalesce(
        Nullif(
          projectmgmt.total_hold_days, '' :: text
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
          salmetschema.pv_install_completed_date - salmetschema.ntp_date
      ) / 86400.0 + 7 :: numeric,
      2
    )
  ) AS ntp_7days,
  CASE WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - salmetschema.ntp_date
      ) / 86400.0,
      2
    )
  ) IS NULL THEN NULL :: text WHEN Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          salmetschema.pv_install_completed_date - salmetschema.ntp_date
      ) / 86400.0,
      2
    )
  ) > 7 :: numeric THEN 'Within SLA' :: text ELSE 'Out of SLA' :: text END AS ntp_7_sla,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.created_on - intopsmetschema.electrical_review_completion_date
      ) / 86400.0,
      2
    )
  ) AS sales_to_er_complete,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.site_survey_completed_date - intopsmetschema.electrical_review_completion_date
      ) / 86400.0,
      2
    )
  ) AS survey_completed_to_er_complete,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          fieldopsschema.fin_pass_date - fieldopsschema.fin_scheduled_date
      ) / 86400.0,
      2
    )
  ) AS fin_scheduled_to_finpass,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.ic_approved_date - intopsmetschema.ic_submitted_date
      ) / 86400.0,
      2
    )
  ) AS ic_submitted_to_ic_approved,
  Abs(
    Round(
      EXTRACT(
        epoch
        FROM
          intopsmetschema.permit_submitted_date - intopsmetschema.permit_approved_date
      ) / 86400.0,
      2
    )
  ) AS pv_permit_submitted_to_permit_approved
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
      permit_fin_pv_permits_schema.created_on AS permit_created, -- AS per data this field is not required
      --internal_ops_metrics_schema.electrical_review_completion_date,-- AS per data this field is not required
      customers_customers_schema.item_created_on as created_on,

    --
    ntp_ntp_schema.ntp_complete_date AS ntp_date
    FROM
      --internal_ops_metrics_schema,
      pto_ic_schema,
      customers_customers_schema,
      pe_ee_stamps_cad_schema,
      planset_cad_schema,
      ic_ic_pto_schema,
      electrical_permits_permit_fin_schema,
      permit_fin_pv_permits_schema,
      ntp_ntp_schema
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
JOIN ntp_ntp_schema ntp on pfpps.customer_unique_id :: text = ntp.unique_id


JOIN field_ops_metrics_schema fieldopsschema ON intopsmetschema.unique_id :: text = fieldopsschema.unique_id :: text
JOIN project_mgmt_metrics_schema projectmgmt ON intopsmetschema.unique_id :: text = projectmgmt.unique_id :: text;


