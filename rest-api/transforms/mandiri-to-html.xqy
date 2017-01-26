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
		
		(: let $doc_custcc := fn:doc('/mandiri-custcc/WebLogic_Customer_CCdev/000000_0-0-1.json') :)
		let $doc_custcc := fn:doc('/mandiri-custcc/WebLogic_Customer_CCdev/000000_0-0-1.json')
		let $doc_edctrans := fn:collection('mandiri-edctrans')['Mid'="6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b"]
		let $doc_transcc := fn:collection('mandiri-transcc')[credit_card_no = $doc_custcc/credit_card_no]
		let $obj := object-node { 
		  'account_type_code' : number-node { $doc_custcc/account_type_code }
		  ,'account_type_desc' : $doc_custcc/account_type_desc
		  ,'account_no' : $doc_custcc/account_no
		  ,'account_cust_name' : $doc_custcc/account_cust_name
		  ,'account_limit' : $doc_custcc/account_limit
		  ,'application_no' : $doc_custcc/application_no
		  ,'credit_card_no' : $doc_custcc/credit_card_no
		  ,'credit_card_account_limit' : $doc_custcc/credit_card_account_limit
		  ,'product_detail_code' : $doc_custcc/product_detail_code
		  ,'service_program_id' : $doc_custcc/service_program_id
		  ,'authorization_amount' : $doc_custcc/authorization_amount
		  ,'approve_date' : $doc_custcc/approve_date
		  ,'current_balance' : $doc_custcc/current_balance
		  ,'highest_balance' : $doc_custcc/highest_balance
		  ,'closing_balance' : $doc_custcc/closing_balance
		  ,'amount_due' : $doc_custcc/amount_due
		  ,'latest_transaction' : $doc_custcc/latest_transaction
		  ,'transactions' : array-node{
				  for $item in $doc_transcc
					return xdmp:from-json($item)          
				  }
		}
		return xdmp:to-json($obj)
};

