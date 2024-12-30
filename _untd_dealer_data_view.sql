
CREATE OR replace VIEW untd_dealer_data_view AS
SELECT unique_id,
       contract_date,
       ntp_date,
       cancelled_date,
       jeopardy_date,
       pv_install_completed_date,
       dealer,
       primary_sales_rep,
       setter,
       state,
       system_size,
       team_region_untd,
       project_status,
       prospect_id_dealer_id_and_sales_rep_id,
       Split_part(team_region_untd, '/', 1) AS team,
       Split_part(team_region_untd, '/', 2) AS regionssss
FROM   sales_metrics_schema
WHERE  ( (
                     contract_date >= Date_trunc('month', CURRENT_DATE::timestamp WITH time zone)
              AND    contract_date < (Date_trunc('month', CURRENT_DATE::timestamp WITH time zone) + '1 mon'::interval))
       OR     (
                     ntp_date >= date_trunc('month', CURRENT_DATE::timestamp WITH time zone)
              AND    ntp_date < (date_trunc('month', CURRENT_DATE::timestamp WITH time zone) + '1 mon'::interval))
       OR     (
                     cancelled_date >= date_trunc('month', CURRENT_DATE::timestamp WITH time zone)
              AND    cancelled_date < (date_trunc('month', CURRENT_DATE::timestamp WITH time zone) + '1 mon'::interval))
       OR     (
                     pv_install_completed_date >= date_trunc('month', CURRENT_DATE::timestamp WITH time zone)
              AND    pv_install_completed_date < (date_trunc('month', CURRENT_DATE::timestamp WITH time zone) + '1 mon'::interval)
              AND    dealer = 'UNTD') );

--CREATE PUBLICATION sp_pub FOR TABLE sales_partner_dbhub_schema;
--ALTER TABLE sp_pub REPLICA IDENTITY FULL;

/* Add a default Admin User to Login tables */
/******************************************************************************************/
/* Insert Default Data in all the rquried tables */
/******************************SETTINGS DB TABLE END ***********************************************/
/******************************* Adding All Stored Procedures ***********************************/