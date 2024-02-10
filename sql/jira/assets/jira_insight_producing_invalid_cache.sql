/*
    Insight producing "InvalidCacheLoadException:
    loadAll failed to return a value for xxx" or "This attribute needs to be indexed" errors
    link:
        https://confluence.atlassian.com/jirakb/insight-producing-invalidcacheloadexception-loadall-failed-to-return-a-value-for-xxx-or-this-attribute-needs-to-be-indexed-errors-1063163284.html
 */

SELECT "ID", "NAME", "REMOVABLE", "TYPE", "LABEL", "INDEXED"
FROM "AO_8542F1_IFJ_OBJ_TYPE_ATTR"
WHERE ("REMOVABLE" = 'false' OR "TYPE" = 1)
  AND ("INDEXED" != 'true' OR "INDEXED" is NULL);


-- Set only the necessary attributes to be indexed
UPDATE "AO_8542F1_IFJ_OBJ_TYPE_ATTR"
SET "INDEXED" = 'true'
WHERE ("REMOVABLE" = 'false' OR "TYPE" = 1)
  AND ("INDEXED" != 'true' OR "INDEXED" is NULL);



-- Set all attributes but 'textarea' types to be indexed:
UPDATE "AO_8542F1_IFJ_OBJ_TYPE_ATTR"
SET "INDEXED" = 'true'
WHERE "DEFAULT_TYPE_ID" != 9 AND ("INDEXED" != 'true' OR "INDEXED" is NULL);
