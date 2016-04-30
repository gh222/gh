
--select * from [SSIS].[Configurations_CRA]
Set ANSI_NULLS ON;
Set ANSI_WARNINGS ON;
DECLARE @Source nvarchar(100) SET @Source = 'WGB01DB7047.bbc_cra_prod.dbo.'
DECLARE @SQL nvarchar(4000)

--IF OBJECT_ID('CRA.ACT00263_Basis') IS NOT NULL TRUNCATE TABLE CRA.ACT00263_Basis
 
SET @SQL =
'			INSERT INTO CRA.ACT00263_Basis (contract_sid , udkey_1_sid, descr )
			SELECT DISTINCT xcr.contract_sid,cu1.udkey_1_sid,'''' as descr
			FROM '+@Source+'x_contract_rights xcr
			INNER JOIN '+@Source+'c_udkey_1 cu1   ON cu1.udkey_1_sid = xcr.udkey_1_sid 
			WHERE xcr.udkey_1_group_sid is null
			UNION ALL
			SELECT DISTINCT xcr.contract_sid,cu1.udkey_1_sid,cu1gh.descr as descr
			FROM '+@Source+'x_contract_rights xcr
			INNER JOIN '+@Source+'c_udkey_1_group_hdr cu1gh ON cu1gh.udkey_1_group_sid = xcr.udkey_1_group_sid
			INNER JOIN '+@Source+'c_udkey_1_group_dtl cu1dtl ON cu1dtl.udkey_1_group_sid = xcr.udkey_1_group_sid
			INNER JOIN '+@Source+'c_udkey_1 cu1 ON cu1.udkey_1_sid = cu1dtl.udkey_1_sid 
			WHERE xcr.udkey_1_group_sid is not null	
'
--exec (@SQL)


IF OBJECT_ID('CRA.ACT00263') IS NOT NULL TRUNCATE TABLE CRA.ACT00263
SET @SQL =
'

DECLARE @PSP_udf int
		,@ContributionTypeUdfSid int
		,@release_date_udf int
		,@PactRevSourceUdfSid int
		,@ProducerGrossSid int
SELECT @PSP_udf =  udf_sid from	'+@Source+'c_udf where	name = ''ProductSharePercentage'' 
SELECT @ContributionTypeUdfSid =  udf_sid from	'+@Source+'c_udf where	name =  ''ContributionType''
SELECT @release_date_udf = udf_sid from '+@Source+'c_udf where name = ''ReleaseDate'' 
SELECT @PactRevSourceUdfSid = udf_sid  FROM '+@Source+'c_udf WHERE name = ''PACTRevenueSource''
SELECT @ProducerGrossSid = udkey_9_sid FROM '+@Source+'c_udkey_9 WHERE udkey_9_id = ''PRODUCERS GROSS''

insert into CRA.ACT00263 (contract_sid,contract_id,Contract_Description,Contribution_Type,Contract_Status,Admin_Class,Product_id,Product_Description,Release_Date,Contributor_Id,Formatted_Name,Product_Share_Percentage,[Order],IsPGFlag)
SELECT
xc.contract_sid,
CAST(xc.contract_id as nvarchar(60)) as contract_id
,xc.descr as Contract_Description
,contType.descr as Contribution_Type
,cs.status_id as Contract_Status
,xadm.descr as Admin_Class
,ISNULL(cu1.udkey_1_id,'' '') as Product_id
,ISNULL(cu1.descr,'' '')  as Product_Description
,ISNULL(cu1u.udf_value,'' '')  as Release_Date
,cc.contact_id as Contributor_Id
,cc.formatted_name as Formatted_Name
,ISNULL(xupsp.value,xcuDefaultPSP.udf_value) as Product_Share_Percentage
,(CASE WHEN psp.sort_order IS NULL THEN '' '' ELSE sort_order END) AS ''Order'' 
, CASE xcuPG.udf_value	WHEN @ProducerGrossSid THEN ''Yes'' 	WHEN  NULL THEN ''''	ELSE ''NO'' END AS IsPGFlag

FROM '+@Source+'x_contract xc 
left join '+@Source+'c_status cs on cs.status_sid = xc.status_sid
INNER JOIN (select * from CRA.ACT00263_Basis )products ON xc.contract_sid = products.contract_sid
INNER JOIN '+@Source+'c_udkey_1 cu1 ON products.udkey_1_sid = cu1.udkey_1_sid

LEFT JOIN (SELECT xu.contract_sid,xu.udkey_1_sid, MIN(sort_order_nbr) as sort_order
			FROM '+@Source+'x_contract_udf_lookup xu 
			WHERE xu.udf_sid = @PSP_udf
			AND xu.value IS NOT NULL
			GROUP BY xu.contract_sid,xu.udkey_1_sid )psp ON psp.contract_sid = xc.contract_sid AND (psp.udkey_1_sid = products.udkey_1_sid ) 

LEFT JOIN '+@Source+'x_contract_udf_lookup xuPSP ON xc.contract_sid = xuPSP.contract_sid 
					AND products.udkey_1_sid = xuPSP.udkey_1_sid 
					AND psp.sort_order = xuPSP.sort_order_nbr 
					AND xuPSP.udf_sid = @PSP_udf
					AND (ISNUMERIC(xupsp.value) = 1 OR xupsp.value IS NULL)
LEFT JOIN 	'+@Source+'x_contract_udf xcuDefaultPSP ON xcuDefaultPSP.contract_sid = xc.contract_sid AND	xcuDefaultPSP.udf_sid = @PSP_udf  and xcuDefaultPSP.udf_value <> ''''
INNER JOIN '+@Source+'x_admin_class xadm ON xc.admin_class_sid = xadm.admin_class_sid		
LEFT JOIN (SELECT xcu.contract_sid, cu8.descr 
			FROM '+@Source+'x_contract_udf xcu
			INNER JOIN '+@Source+'c_udkey_8 cu8 ON cu8.udkey_8_sid = xcu.udf_value
			WHERE xcu.udf_Sid = @ContributionTypeUdfSid
			)contType ON contType.contract_sid = xc.contract_sid
LEFT JOIN '+@Source+'c_udkey_1_udf cu1u ON cu1u.udkey_1_sid = cu1.udkey_1_sid AND cu1u.udf_sid = @release_date_udf	
LEFT JOIN '+@Source+'x_contract_participant xcp on xcp.contract_sid = xc.contract_sid
INNER JOIN '+@Source+'c_contact cc ON xcp.contact_sid = cc.contact_sid
LEFT JOIN '+@Source+'x_contract_udf xcuPG ON xc.contract_sid = xcuPG.contract_sid AND xcuPG.udf_sid = @PactRevSourceUdfSid
where xc.contract_sid = original_contract_sid
AND xc.status_sid in (3,5,16,18,26,27)
AND xc.contract_sid = 384
'
exec (@SQL)




