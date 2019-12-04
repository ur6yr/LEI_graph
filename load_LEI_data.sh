create vertex entity (primary_id LEI string, LEI string, NM_LGL string, NM_OTHER1 string, NM_OTHER1_TYPE string, NM_OTHER2 string, NM_OTHER2_TYPE string, NM_OTHER3 string, NM_OTHER3_TYPE string, NM_OTHER4 string, NM_OTHER4_TYPE string, NM_OTHER5 string, NM_OTHER5_TYPE string, NM_TRANS1 string, NM_TRANS1_TYPE string, NM_TRANS2 string, NM_TRANS2_TYPE string, NM_TRANS3 string, NM_TRANS3_TYPE string,  NM_TRANS4 string, NM_TRANS4_TYPE string, NM_TRANS5 string, NM_TRANS5_TYPE string, FIRST_ADDRESS_LINE string, ADDRESS_NUM string, ADDRESS_NUM_WITHIN_BUILDING string, ADDRESS_MAIL_ROUTING string, ADDITIONAL_ADDRESS_LINE1 string, ADDITIONAL_ADDRESS_LINE2 string, ADDITIONAL_ADDRESS_LINE3 string, ADDRESS_CITY string, ADDRESS_REGION string, ADDRESS_COUNTRY string, ADDRESS_POST_CD string, HQ_ADDRESS_LINE1 string, HQ_ADDRESS_NUM string, HQ_ADDRESS_NUM_WITHIN_BUILDING string, HQ_MAIL_ROUTING string, HQ_ADDITIONAL_ADDRESS_LINE1 string, HQ_ADDITIONAL_ADDRESS_LINE2 string, HQ_ADDITIONAL_ADDRESS_LINE3 string, HQ_CITY string, HQ_REGION string, HQ_COUNTRY string, HQ_POSTAL_CD string, REG_AUTH_ID string, OTHER_REG_AUTH_ID string, REG_AUTH_ENT_ID string, LGL_JRSDCTN string, ENT_CATEGORY string, LGL_FORM_CD string, OTHER_LGL_FORM_CD string, ASSC_ENT_TYPE string, ASSC_ENT_LEI string, ASSC_ENT_NM string, STATUS string, EXP_DT string, EXP_REASON string, SUCC_LEI string, SUCC_NM string, INIT_REG_DT string, REG_LAST_UPDT string, REG_STATUS string, REG_RENEWAL_DT string, MNG_LOU string, REG_VALIDATION_SRC string, VALIDATION_AUTH_ID string, OTHER_VALIDATION_AUTH_ID string, VALIDATION_AUTH_ENT_ID string)

create directed edge IS_DIRECTLY_CONSOLIDATED_BY (from entity, to entity, ID_TYPE string, REL_TYPE string, REL_STATUS string, REG_DT string, REG_LAST_UPDT string, REG_STATUS string, NXT_RENEWAL_DT string, MNG_LOU string, VALIDATION_SRC string, VALIDATION_DOC string, VALIDATION_REF string, REL_START_DT string, REL_END_DT string, REL_PD1_TYPE string, REL_PD2_START_DT string, REL_PD2_END_DT string, REL_PD2_TYPE string, REL_PD3_START_DT string, REL_PD3_END_DT string, REL_PD3_TYPE string, REL_PD4_START_DT string, REL_PD4_END_DT string, REL_PD4_TYPE string, REL_PD5_START_DT string, REL_PD5_END_DT string, REL_PD5_TYPE string, QUAL_DIM string, QUAL_CAT string)

create directed edge IS_ULTIMATELY_CONSOLIDATED_BY (from entity, to entity, ID_TYPE string, REL_TYPE string, REL_STATUS string, REG_DT string, REG_LAST_UPDT string, REG_STATUS string, NXT_RENEWAL_DT string, MNG_LOU string, VALIDATION_SRC string, VALIDATION_DOC string, VALIDATION_REF string, REL_START_DT string, REL_END_DT string, REL_PD1_TYPE string, REL_PD2_START_DT string, REL_PD2_END_DT string, REL_PD2_TYPE string, REL_PD3_START_DT string, REL_PD3_END_DT string, REL_PD3_TYPE string, REL_PD4_START_DT string, REL_PD4_END_DT string, REL_PD4_TYPE string, REL_PD5_START_DT string, REL_PD5_END_DT string, REL_PD5_TYPE string, QUAL_DIM string, QUAL_CAT string)

create graph LEI (*)

USE GRAPH LEI
BEGIN
CREATE LOADING JOB load_LEIVS FOR GRAPH LEI {
DEFINE FILENAME file1="/home/tigergraph/tigergraph/20190724-0000-gleif-goldencopy-lei2-golden-copy.csv";
LOAD file1 TO VERTEX entity VALUES ($"LEI", $"LEI", $"NM_LGL", $"NM_OTHER1", $"NM_OTHER1_TYPE", $"NM_OTHER2", $"NM_OTHER2_TYPE", $"NM_OTHER3", $"NM_OTHER3_TYPE", $"NM_OTHER4", $"NM_OTHER4_TYPE", $"NM_OTHER5", $"NM_OTHER5_TYPE", $"NM_TRANS1", $"NM_TRANS1_TYPE", $"NM_TRANS2", $"NM_TRANS2_TYPE", $"NM_TRANS3", $"NM_TRANS3_TYPE",  $"NM_TRANS4", $"NM_TRANS4_TYPE", $"NM_TRANS5", $"NM_TRANS5_TYPE", $"FIRST_ADDRESS_LINE", $"ADDRESS_NUM", $"ADDRESS_NUM_WITHIN_BUILDING", $"ADDRESS_MAIL_ROUTING", $"ADDITIONAL_ADDRESS_LINE1", $"ADDITIONAL_ADDRESS_LINE2", $"ADDITIONAL_ADDRESS_LINE3", $"ADDRESS_CITY", $"ADDRESS_REGION", $"ADDRESS_COUNTRY", $"ADDRESS_POST_CD", $"HQ_ADDRESS_LINE1", $"HQ_ADDRESS_NUM", $"HQ_ADDRESS_NUM_WITHIN_BUILDING", $"HQ_MAIL_ROUTING", $"HQ_ADDITIONAL_ADDRESS_LINE1", $"HQ_ADDITIONAL_ADDRESS_LINE2", $"HQ_ADDITIONAL_ADDRESS_LINE3", $"HQ_CITY", $"HQ_REGION", $"HQ_COUNTRY", $"HQ_POSTAL_CD", $"REG_AUTH_ID", $"OTHER_REG_AUTH_ID", $"REG_AUTH_ENT_ID", $"LGL_JRSDCTN", $"ENT_CATEGORY", $"LGL_FORM_CD", $"OTHER_LGL_FORM_CD", $"ASSC_ENT_TYPE", $"ASSC_ENT_LEI", $"ASSC_ENT_NM", $"STATUS", $"EXP_DT", $"EXP_REASON", $"SUCC_LEI", $"SUCC_NM", $"INIT_REG_DT", $"REG_LAST_UPDT", $"REG_STATUS", $"REG_RENEWAL_DT", $"MNG_LOU", $"REG_VALIDATION_SRC", $"VALIDATION_AUTH_ID", $"OTHER_VALIDATION_AUTH_ID", $"VALIDATION_AUTH_ENT_ID") USING header="true", separator=",";
}
End



USE GRAPH LEI
BEGIN
CREATE LOADING JOB load_LEIU FOR GRAPH LEI {
DEFINE FILENAME file2="/home/tigergraph/tigergraph/ultimate_parent.csv";
LOAD file2 TO EDGE IS_ULTIMATELY_CONSOLIDATED_BY VALUES ($0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29) USING header="true", separator=",";
}
END



USE GRAPH LEI
BEGIN
CREATE LOADING JOB load_LEID FOR GRAPH LEI {
DEFINE FILENAME file2="/home/tigergraph/tigergraph/direct_parent.csv";
LOAD file2 TO EDGE IS_DIRECTLY_CONSOLIDATED_BY VALUES ($0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29) USING header="true", separator=",";
}
END