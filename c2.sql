CREATE TABLE CDV (

    unique_id_1 TEXT,
    dealer TEXT,
    project_status TEXT,
    puma TEXT,
    credit_expiration_date_field timestamp,
    account_executive TEXT,
    state TEXT,
    address TEXT,
    finance_id TEXT,
    primary_sales_rep TEXT,
    secondary_sales_rep TEXT,
    contract_total TEXT,
    customer_email TEXT,
    customer_phone_number TEXT,
    jeopardy_date timestamp,

    setter TEXT,
    adder_breakdown_total_new NUMERIC,
    office TEXT,
    utility_company TEXT,
    sale_date timestamp,
    last_contact_w_ho timestamp,
    customer_name TEXT,

    record_id bigint unique ,
    partner_id TEXT,
    name TEXT,
    prospect_created_on DATE,
    working_date timestamp,
    team TEXT,
    team_region_untd TEXT,
    finance_type TEXT,
    net_epc NUMERIC,
    prospect_id_dealer_id_and_sales_rep_id TEXT,
    owe_funded_adder_breakdown_total NUMERIC,
    ahj TEXT,
    total_cost_for_adders NUMERIC,
    pending_ntp_date timestamp
    ntp_complete_date timestamp,
    finance TEXT,
    cancelled_date timestamp,


    cancelled_date DATE,
    pv_install_day_window DATE,
    install_complete_1_2 DATE,
    install_complete_2_3 DATE,
    pv_install_created_on DATE,
    pv_completion_date DATE,
    assigned_foreman TEXT,
    pv_install_created_on DATE,
    permit_submittal_eta DATE,
    permit_redlined DATE,
    permit_created DATE,
    permit_submitted_date DATE,
    permit_expected_approval_date DATE,
    permitting_specialist TEXT,
    permit_re_submitted_date DATE,
    permit_approved_date DATE,
    permit_turnaround_time NUMERIC,

    -- Columns from Design_and_survey_mv3
    customer_unique_id_3 TEXT,
    survey_2nd_completion_date DATE,
    site_survey_scheduled_date DATE,
    site_survey_completed_date DATE,
    cad_rejection_date DATE,
    peee_rejection_date DATE,
    cad_designer TEXT,
    cad_ready DATE,
    cad_complete_date DATE,
    cad_revision_requested_date DATE,
    abcad_ready DATE,
    abcad_completed DATE,
    cad_reviewer TEXT,
    submitted_date DATE,
    completion_date DATE,
    redlined_date DATE,
    stamp_provider TEXT,
    system_size NUMERIC,
    inverter_part_number TEXT,

    -- Columns from permits_and_utility_mv4
    customer_unique_id_4 TEXT,
    fire_permit_created_date DATE,
    fire_permit_submitted_date DATE,
    fire_permit_approved_date DATE,
    battery_permit_created_on DATE,
    battery_permit_submitted_date DATE,
    battery_permit_approved_date DATE,
    battery_scheduled_date DATE,
    battery_complete_date DATE,
    electrical_permit_created_date DATE,
    electrical_permit_submitted_date DATE,
    electrical_permit_approved_date DATE,
    ic_created_date DATE,
    ic_submitted_date DATE,
    ic_expected_approval_date DATE,
    ic_re_submitted_date DATE,
    ic_approved_date DATE,
    ic_rejection_date DATE,
    pto_created_on DATE,
    pto_submitted_date DATE,
    pto_specialist TEXT,
    pto_fail_date DATE,
    pto_date DATE,
    fin_created_date DATE,
    inspection_scheduled_date DATE,
    inspection_completed_date DATE,
    fin_pass_date DATE,
    final_inspection_passed_date DATE,
    trenching_completed DATE,
    trenching_ws_open DATE,
    trenching_scheduled DATE,
    app_status TEXT,
    mpu_created_date DATE,
    mpu_scheduled_date DATE,
    mpu_complete_date DATE,
    derate_created_date DATE,
    derate_scheduled_date DATE,
    derate_completed_date DATE
);