CREATE TABLE Campaign_Info AS
SELECT 
    Campaign_ID,
    Company,
    Campaign_Type,
    Target_Audience,
    Duration,
    Channel_Used,
    Location,
    Language,
    Customer_Segment,
    Date AS Start_Date
FROM MARKETING_CAMPAIGN;

CREATE TABLE Campaign_Performance AS
SELECT 
    Campaign_ID,
    Conversion_Rate,
    Acquisition_Cost,
    ROI,
    Clicks,
    Impressions,
    Engagement_Score,
    CASE 
        WHEN Impressions > 0 THEN (Clicks * 1.0 / Impressions) * 100
        ELSE 0
    END AS Engagement_Rate,
    CASE 
        WHEN Clicks > 0 THEN Acquisition_Cost / Clicks
        ELSE NULL
    END AS Cost_Per_Click,
    CASE 
        WHEN Impressions > 0 THEN (Clicks * 1.0 / Impressions) * 100
        ELSE 0
    END AS Click_Through_Rate,
    CASE 
        WHEN Impressions > 0 THEN (Acquisition_Cost * 1.0 / Impressions) * 1000
        ELSE NULL
    END AS Cost_Per_Thousand_Impressions,
    (ROI * 100) AS ROI_Percentage,
    CASE 
        WHEN Clicks > 0 AND Conversion_Rate > 0 THEN Acquisition_Cost / (Clicks * Conversion_Rate)
        ELSE NULL
    END AS Effective_Cost_Per_Conversion,
    (Clicks * Conversion_Rate) AS Conversion_Count

FROM MARKETING_CAMPAIGN;