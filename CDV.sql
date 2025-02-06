


CREATE MATERIALIZED VIEW Customer_info_mv1 AS
    SELECT

        c.unique_id AS unique_id_1,

    -- customers_customers_schema
        c.dealer,
            c.project_status,
            c.puma AS puma_cat,
            c.credit_expiration_date_field,
            c.account_executive ,
            c.state,
            c.address,
            c.finance_id,
            c.primary_sales_rep ,
            c.secondary_sales_rep ,
            c.total_system_cost AS contract_total,
            c.email_address AS customer_email,
            c.phone_number AS customer_phone_number,
            c.jeopardy_date ,
            c.setter ,
            c.adder_breakdown_total_new,
            c.office ,
            c.utility_company ,
            --c.created_on AS customer_created_on,
            c.sale_date AS contract_date, --
            c.last_contact_w_ho AS customer_last_contacted,
            c.customer_name AS customer,

        --sales_partner_dbhub_schema
            spds.record_id AS dealer_item_id,
            spds.partner_id,

        --prospects_customers_schema
            pc.name AS prospect,
            pc.prospect_created_on AS prospect_created_date,
            pc.working_date AS prospect_working_date,

        --sales_rep_dbhub_schema
            sr.team,
            sr.team_region_untd,

        -- ntp_ntp_schema
            ntp.finance_type AS loan_type,
            ntp.net_epc ,
            ntp.prospect_id_dealer_id_and_sales_rep_id,
            ntp.owe_funded_adder_breakdown_total,
            ntp.ahj ,
            ntp.total_cost_for_adders AS adders_total,
            ntp.pending_ntp_date AS working_date ,
            ntp.ntp_complete_date AS ntp_date,
            ntp.finance AS partner
            --ntp. AS finance_partner,



        FROM
            customers_customers_schema c
        LEFT JOIN
            ntp_ntp_schema ntp ON c.unique_id = ntp.customer_unique_id
        LEFT JOIN
            sales_rep_dbhub_schema sr ON SPLIT_PART(ntp.prospect_id_dealer_id_and_sales_rep_id, ',', 3) = sr.record_id::text
        LEFT JOIN
            sales_partner_dbhub_schema spds ON SPLIT_PART(ntp.prospect_id_dealer_id_and_sales_rep_id, ',', 2) = spds.record_id::text
        LEFT JOIN
            prospects_customers_schema pc ON SPLIT_PART(ntp.prospect_id_dealer_id_and_sales_rep_id, ',', 1) = pc.item_id::text

        WHERE
            c.unique_id IS NOT NULL AND c.unique_id != '' ;



---------------------------------------------------------------------------------------------------------



CREATE MATERIALIZED VIEW Sales_and_permitting_mv2 AS
    SELECT

        sms.unique_id AS customer_unique_id_2,


    -- sales_metrics_schema
        sms.cancelled_date AS cancelled_date,

    -- pv_install_install_subcontracting_schema
        pv.pv_install_day_window AS pv_install_scheduled_date,
        pv.install_complete_1_2 AS pv_install_complete_1_2_date,
        pv.install_complete_2_3 AS pv_install_complete_2_3_date,
        pv.pv_install_created_on ,
        pv.pv_completion_date AS pv_install_completed_date,
        pv.assigned_foreman ,
        --pv.work_scheduled_date AS roofing_scheduled_date,
        pv.pv_install_created_on AS roofing_created_date,
        --pv.work_completed_date AS roofing_completed_date,

    -- permit_fin_pv_permits_schema
        pf.pv_expected_approval_date AS permit_submittal_eta,
        pf.pv_redlined_date AS permit_redlined,
        pf.record_created_on AS permit_created,
        pf.pv_submitted AS permit_submitted_date,
        pf.pv_expected_approval_date AS permit_expected_approval_date,
        pf.permit_specialist AS permitting_specialist,
        pf.pv_resubmitted AS permit_re_submitted_date,
        pf.pv_approved AS permit_approved_date,
        pf.permit_turnaround_time AS permit_turnaround_time

        FROM
            sales_metrics_schema sms
        LEFT JOIN
            pv_install_install_subcontracting_schema pv ON sms.unique_id = pv.customer_unique_id
        LEFT JOIN
            permit_fin_pv_permits_schema pf ON pv.customer_unique_id = pf.customer_unique_id
        WHERE
            sms.unique_id IS NOT NULL AND sms.unique_id != ''
            OR pv.customer_unique_id IS NOT NULL AND pv.customer_unique_id != '' ;



-----------------------------------------------------------------------------------------------------



CREATE MATERIALIZED VIEW Design_and_survey_mv3 AS
    SELECT

        sss.customer_unique_id AS customer_unique_id_3,

    -- survey_survey_schema
        sss.second_completion_date AS survey_2nd_completion_date,
        sss.original_survey_scheduled_date AS site_survey_scheduled_date,
        --sss. AS site_survey_rescheduled_date,
        sss.survey_completion_date AS site_survey_completed_date,

    --planset_cad_schema pcs
        pcs.rejected_date AS cad_rejection_date,
        pcs.rejected_date AS peee_rejection_date,
        pcs.cad_designer_name AS cad_designer,
        pcs.cad_pending_date_h AS cad_ready,
        pcs.cad_complete_date,
        pcs.qa_fixes_pending_date_h AS cad_revision_requested_date,
        pcs.cad_pending_date_h AS abcad_ready,
        pcs.cad_complete_date AS abcad_completed,
        pcs.cad_designer_name AS cad_reviewer,

    --pe_ee_stamps_cad_schema
        peee.submitted_date,
        peee.completion_date,
        peee.redlined_date,
        peee.stamp_provider,

    --system_customers_schema
        scs.contracted_system_size_parent AS system_size,
        scs.inverter AS inverter_part_number
        --scs.module_type AS module,
        --scs.inverter_type AS solar_inverter_installed
        --scs.module_qty AS solar_modules_installed
        --scs.contracted_system_size  AS pv_array_size_kw

            FROM
                survey_survey_schema sss
            LEFT JOIN
                planset_cad_schema pcs ON sss.customer_unique_id = pcs.our_number
            LEFT JOIN
                pe_ee_stamps_cad_schema peee ON pcs.our_number = peee.customer_unique_id
            LEFT JOIN
                    system_customers_schema scs ON peee.customer_unique_id = scs.customer_id
            WHERE
                pcs.our_number IS NOT NULL AND pcs.our_number != ''
                OR sss.customer_unique_id IS NOT NULL AND sss.customer_unique_id !='' ;



-----------------------------------------------------------------------------------------------------



CREATE MATERIALIZED VIEW permits_and_utility_mv4 AS
     SELECT
        iips.customer_unique_id AS customer_unique_id_4,

     -- fire_permits_permit_fin_schema
        fppfs.created_on AS fire_permit_created_date,
        fppfs.submitted AS fire_permit_submitted_date,
        fppfs.approved AS fire_permit_approved_date,

     -- battery_permits_permit_fin_schema
        bppfs.battery_permit_created_on,
        bppfs.submitted AS battery_permit_submitted_date,
        bppfs.approved AS battery_permit_approved_date,

     --batteries_service_electrical_schema
        bses.battery_installation_date AS battery_scheduled_date,
        bses.completion_date AS battery_complete_date,

     -- electrical_permits_permit_fin_schema
        eppfs.electrical_permit_created_on  AS electrical_permit_created_date,
        eppfs.submitted_date AS electrical_permit_submitted_date,
        eppfs.approved AS electrical_permit_approved_date,

     -- ic_ic_pto_schema
        iips.ic_created_on AS ic_created_date,
        iips.ic_submitted_date AS ic_submitted_date,
        iips.ic_estimated_approval_date AS ic_expected_approval_date,
        --iips.Utility_Specialist  AS utility_specialist,
        iips.ic_resubmitted_date AS ic_re_submitted_date,
        iips.ic_approved_date AS ic_approved_date,
        iips.ic_rejection_date AS ic_rejection_date,

     --pto_ic_schema
        pis.pto_created_on,
        pis.submitted AS pto_submitted_date,
        pis.pto_specialist,
        pis.podio_redlined_date AS pto_fail_date,
        pis.pto_granted AS pto_date,

     --fin_permit_fin_schema fp;
        fp.fin_created_on AS fin_created_date,
        fp.fin_scheduled_on  AS inspection_scheduled_date,
        fp.approved_date  AS inspection_completed_date,
        fp.approved_date AS fin_pass_date,
        --fp. AS fin_scheduled_date,
        fp.approved_date AS final_inspection_passed_date,


     -- trenching_service_electrical_schema
        tses.completion_date AS trenching_completed,
        tses.trenching_created_on AS trenching_ws_open,
        tses.work_scheduled_date AS trenching_scheduled,

     --roofing_request_install_subcontracting_schema
        rriss.app_status,

     -- mpu_service_electrical_schema
        mses.mpu_created_on AS mpu_created_date,
        mses.pk_or_cutover_date AS mpu_scheduled_date,
        mses.pk_or_cutover_date_of_completion AS mpu_complete_date,

     -- derates_service_electrical_schema
        dses.derate_created_on AS derate_created_date,
        dses.scheduled_date AS derate_scheduled_date,
        dses.completion_date AS derate_completed_date

        FROM
            ic_ic_pto_schema iips
        LEFT JOIN
            fire_permits_permit_fin_schema fppfs ON iips.customer_unique_id = fppfs.customer_unique_id
        LEFT JOIN
            battery_permits_permit_fin_schema bppfs ON fppfs.customer_unique_id = bppfs.customer_unique_id
        LEFT JOIN
            electrical_permits_permit_fin_schema eppfs ON fppfs.customer_unique_id = eppfs.customer_unique_id
        LEFT JOIN
            pto_ic_pto_schema pis ON iips.customer_unique_id = pis.customer_unique_id
        LEFT JOIN
            fin_permit_fin_schema fp ON pis.customer_unique_id = fp.customer_unique_id
        LEFT JOIN
            trenching_service_electrical_schema tses ON fp.customer_unique_id = tses.customer_unique_id
        LEFT JOIN
            roofing_request_install_subcontracting_schema rriss ON tses.customer_unique_id = rriss.customer_unique_id
        LEFT JOIN
            mpu_service_electrical_schema mses ON rriss.customer_unique_id = mses.customer_unique_id
        LEFT JOIN
            derates_service_electrical_schema dses ON mses.customer_unique_id = dses.customer_unique_id
        LEFT JOIN
            batteries_service_electrical_schema bses ON dses.customer_unique_id = bses.customer_unique_id
        WHERE
            iips.customer_unique_id IS NOT NULL AND iips.customer_unique_id != '' ;



-------------------------------------------------------------------------------------------------------



CREATE MATERIALIZED VIEW CDV AS
    SELECT
        mv1.*,
        mv2.*,
        mv3.*,
        mv4.*

        FROM
            Customer_info_mv1 mv1
        JOIN
            Sales_and_permitting_mv2 mv2 ON mv1.unique_id_1 = mv2.customer_unique_id_2
        JOIN
            Design_and_survey_mv3 mv3 ON mv2.customer_unique_id_2 = mv3.customer_unique_id_3
        JOIN
            permits_and_utility_mv4 mv4 ON mv3.customer_unique_id_3 = mv4.customer_unique_id_4;
