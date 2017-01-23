xquery version "1.0-ml";
module namespace mandiriToHtml =
  "http://marklogic.com/rest-api/transform/mandiri-to-html";

import module namespace json = "http://marklogic.com/xdmp/json"
    at "/MarkLogic/json/json.xqy";

declare namespace ns = "http://bankmandiri.co.id/ml";
	
declare function mandiriToHtml:transform(
        $context as map:map,
        $params as map:map,
        $content as document-node()
) as document-node()
{

    if (fn:empty($content/*))
    then
        $content
    else
        let $_ := xdmp:log(concat("testing....", map:get($context,"uri")))
        let $uri := map:get($context, 'uri')
		(:
        let $xsl_file := concat('/', fn:tokenize($uri,'/')[2],'-html-output.xsl')
        let $_ := xdmp:log(concat("xsl file: ", $xsl_file))
		:)
		
        let $data := $content/node()
        let $_ := xdmp:log('>>>>>>>>>> data is: ')
        let $_ := xdmp:log($data)
		let $simple := <wlcustcc xmlns="http://bankmandiri.co.id/ml">
<account_type_sk>1</account_type_sk>
<account_type_code>1</account_type_code>
<account_type_desc>NON CORPORATE</account_type_desc>
<master_account_sk>0</master_account_sk>
<master_account_no>5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9</master_account_no>
<master_account_cust_sk>0</master_account_cust_sk>
<master_account_cust_no>5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9</master_account_cust_no>
<master_account_cust_name>e2f79e5b60330bba4c289962231b6ba2957d0b14e7deb3110417003c79dea635</master_account_cust_name>
<account_sk>9112046</account_sk>
<account_no>651b67c748eb308a1a0922af5c8028a799f98967b17f280b6917de7601568fda</account_no>
<account_cust_sk>1589319</account_cust_sk>
<account_cust_no>c12956b818faea3127d58d38df4c3b474f54ca650de64397012cfa6a7be1678b</account_cust_no>
<account_cust_name>c12aeeaf4c2d55f89c8d7cea35c92f0f2e6bd0f3b103a20529656dd8fdf29558</account_cust_name>
<credit_card_account_no>4903cd5e8e64f3c2ffdef0c3ae78599da1be80f94e69a1350a4cbbd914359a6c</credit_card_account_no>
<credit_card_no>5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9</credit_card_no>
<credit_card_account_cust_sk>1589319</credit_card_account_cust_sk>
<credit_card_account_cust_no>c12956b818faea3127d58d38df4c3b474f54ca650de64397012cfa6a7be1678b</credit_card_account_cust_no>
<credit_card_account_cust_name>c12aeeaf4c2d55f89c8d7cea35c92f0f2e6bd0f3b103a20529656dd8fdf29558</credit_card_account_cust_name>
<master_account_limit>0</master_account_limit>
<account_limit>10000000</account_limit>
<credit_card_limit_sk>4</credit_card_limit_sk>
<credit_card_account_limit>10000000</credit_card_account_limit>
<product_type_sk>6</product_type_sk>
<product_detail_code>MMTMPA</product_detail_code>
<rcc_sk>0</rcc_sk>
<rcc_code>0</rcc_code>
<billing_rcc_sk>167</billing_rcc_sk>
<billing_rcc_code>154</billing_rcc_code>
<branch_sk>0</branch_sk>
<branch_id>0</branch_id>
<hub_id>0</hub_id>
<region_id>0</region_id>
<channel_sk>0</channel_sk>
<channel_code>0</channel_code>
<marketing_program_sk>0</marketing_program_sk>
<marketing_program_code>0</marketing_program_code>
<card_type_sk>1</card_type_sk>
<card_type_code>2</card_type_code>
<application_type_sk>0</application_type_sk>
<application_type_code>0</application_type_code>
<agency_sk>0</agency_sk>
<agency_code>0</agency_code>
<tf_user_sk>0</tf_user_sk>
<tf_user_code>0</tf_user_code>
<credit_card_acct_status_sk>3</credit_card_acct_status_sk>
<aggreement_group_code>1</aggreement_group_code>
<aggreement_status_code>9</aggreement_status_code>
<flag_recontest>
</flag_recontest>
<approve_date>2009-06-12 00:00:00</approve_date>
<opening_date>2009-06-12 00:00:00</opening_date>
<opening_datekey>2009-06-12 00:00:00</opening_datekey>
<incoming_date>2009-06-12 00:00:00</incoming_date>
<incoming_datekey>1900-01-01 00:00:00</incoming_datekey>
<first_usage_date>1900-01-01 00:00:00</first_usage_date>
<closing_balance>0.0</closing_balance>
<current_balance>0.0</current_balance>
<highest_balance>0.0</highest_balance>
<amount_due>0.0</amount_due>
<latest_transaction>0</latest_transaction>
<latest_limit_adjustment>0</latest_limit_adjustment>
<ics_ref_no>2063746</ics_ref_no>
<application_no>HQ0900136829</application_no>
<old_application_no>
</old_application_no>
<krknst>0</krknst>
<kravdt>1090612</kravdt>
<service_program_id>MMTPAB</service_program_id>
<ca_employee_sk>0</ca_employee_sk>
<ca_employee_code>0</ca_employee_code>
<group_code>0</group_code>
<insert_date>15130222</insert_date>
<update_date>2016-11-01 00:00:00</update_date>
<delinquency_bucket_sk>1</delinquency_bucket_sk>
<delinquency_code>1</delinquency_code>
<authorization_amount>0.0</authorization_amount>
<credit_card_account_sk>15130222</credit_card_account_sk>
<block_code>\N</block_code>
<marketing_source_code>00000-L-Z-00000</marketing_source_code>
<upgrade_card>N</upgrade_card>
<expired_datekey>\N</expired_datekey>
<aggr_status_change_datekey>1900-01-01 00:00:00</aggr_status_change_datekey>
<cycle_date>10</cycle_date>
<month_waive_annual>12</month_waive_annual>
</wlcustcc>

		let $ada := fn:doc()[/ns:wlcustcc/ns:product_detail_code/text() = "CLRCTL"]		
		let $simple2 := <wlcustcc xmlns="http://bankmandiri.co.id/ml">
			{$ada}
		</wlcustcc>
		let $custom := let $config := json:config("custom")
           return 
             (
              map:put( $config, "whitespace", "ignore" ),

              $config
             )
		return json:transform-to-json($simple,$custom)
		(: 
        let $json := json:object()
        let $_ := map:put($json,'xml', xdmp:quote($simple))
        return xdmp:to-json(document{ $simple })
		:)

        (: return xdmp:to-json($json) :)
		(: sepertinya tdk perlu xslt, langsung saja ambil dokumen lain :)
		(:)
        let $t :=  xdmp:xslt-invoke($xsl_file, document { $data })
        let $_ := xdmp:log(concat('>>>>>>>>>>>>>>>>>>>>>>>>> output is ', $t))
        let $json := json:object()
        let $_ := map:put($json,'xml', xdmp:quote($t))
        return xdmp:to-json($json)
		:)

};

