--Select *
--From master..DR_Air_Pollution
--Order by 3,4

----Maximum number of deaths attributed to air pollution for each entity 
--Select Entity, Year, MAX(cast([Deaths that are from all causes attributed to air pollution per ] as int)) as MaxDeaths
--From master..DR_Air_Pollution
--Where Entity is not null
--Group by Entity, Year
--Order by MaxDeaths asc;

----
---- Total Deaths Attributed to Air Pollution Over the Years
--SELECT 
--    Year, 
--    SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS FLOAT)) AS TotalDeaths
--FROM 
--    master..DR_Air_Pollution
--GROUP BY 
--    Year
--ORDER BY 
--    Year ASC;
----Deaths Attributed to Air Pollution for a Specific Country Over the Years
--SELECT 
--    Year, 
--    CAST([Deaths that are from all causes attributed to air pollution per ] AS INT) AS Deaths
--FROM 
--    master..DR_Air_Pollution
--WHERE 
--    Entity = 'Afghanistan'
--ORDER BY 
--    Year ASC;
----3. Comparison of Different Types of Air Pollution Over the Years for a Specific Country
--SELECT 
--    Year,
--    CAST([Deaths that are from all causes attributed to air pollution per ]  AS INT) AS HouseholdAirPollution,
--    CAST([Deaths that are from all causes attributed to air pollution per ]AS INT) AS AmbientParticulateMatter,
--    CAST([Deaths that are from all causes attributed to air pollution per ] AS INT) AS AmbientOzonePollution
--FROM 
--    master..DR_Air_Pollution
--WHERE 
--    Entity = 'Afghanistan'
--ORDER BY 
--    Year ASC;


----4. Top 10 Countries with the Highest Deaths Attributed to Air Pollution for a Specific Year
--SELECT 
--    TOP 10 Entity, 
--    CAST([Deaths that are from all causes attributed to air pollution per ]AS INT) AS Deaths
--FROM 
--    master..DR_Air_Pollution
--WHERE 
--    Year = 2019
--ORDER BY 
--    Deaths DESC;
----5. Trend of Air Pollution-Related Deaths in a Specific Region Over the Years
--SELECT 
--    Year, 
--    CAST([Deaths that are from all causes attributed to air pollution per ] AS INT) AS Deaths
--FROM 
--    master..DR_Air_Pollution
--WHERE 
--    Entity = 'African Region (WHO)'
--ORDER BY 
--    Year ASC;
----6. Average Deaths Attributed to Air Pollution by Region
--SELECT 
--    Entity, 
--    AVG(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) AS AvgDeaths
--FROM 
--    master..DR_Air_Pollution
--GROUP BY 
--    Entity
--ORDER BY 
--    AvgDeaths DESC;

---- Select Data that we are going to be using
SELECT 
    SUM(CAST([Deaths that are from all causes attributed to household air poll]  AS INT)) AS TotalHouseholdAPD_Sum,
    SUM(CAST([Deaths that are from all causes attributed to ambient ozone poll] AS INT)) AS TotalAPM_Sum,
    SUM(CAST([Deaths that are from all causes attributed to ambient particulat] AS INT)) AS TotalAPP_Sum,
	SUM(CAST([Deaths that are from all causes attributed to air pollution per ] as INT)) AS TotalAP_SUM
	
FROM 
    master..DR_Air_Pollution

SELECT 
    SUM(CAST([Deaths that are from all causes attributed to household air poll] AS INT)) AS TotalHouseholdAPD_Sum,
    SUM(CAST([Deaths that are from all causes attributed to ambient ozone poll] AS INT)) AS TotalAPM_Sum,
    SUM(CAST([Deaths that are from all causes attributed to ambient particulat] AS INT)) AS TotalAPP_Sum,
    SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) AS TotalAP_SUM,

    CAST(SUM(CAST([Deaths that are from all causes attributed to household air poll] AS INT)) AS FLOAT) / 
        SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT))  AS TotalHouseholdAPD_Percentage,
    CAST(SUM(CAST([Deaths that are from all causes attributed to ambient ozone poll] AS INT)) AS FLOAT) / 
        SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) AS TotalAPM_Percentage,
    CAST(SUM(CAST([Deaths that are from all causes attributed to ambient particulat] AS INT)) AS FLOAT) / 
        SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) AS TotalAPP_Percentage

FROM 
    master..DR_Air_Pollution;

SELECT 
    Entity AS Location,
    SUM([Deaths that are from all causes attributed to household air poll]) AS TotalHouseholdAirPollutionDeaths,
    SUM([Deaths that are from all causes attributed to ambient particulat]) AS TotalAmbientParticulateMatterDeaths,
    SUM([Deaths that are from all causes attributed to air pollution per ]) AS TotalAirPollutionDeaths,
    SUM([Deaths that are from all causes attributed to ambient ozone poll]) AS TotalAmbientOzonePollutionDeaths,
    SUM([Deaths that are from all causes attributed to household air poll]) +
    SUM([Deaths that are from all causes attributed to air pollution per ]) +
    SUM([Deaths that are from all causes attributed to ambient particulat]) +
    SUM([Deaths that are from all causes attributed to ambient ozone poll]) AS TotalDeaths,
	CAST(SUM(CAST([Deaths that are from all causes attributed to household air poll] AS INT)) AS FLOAT) /
        SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) * 100 AS PercentageHouseholdAPD,
    CAST(SUM(CAST([Deaths that are from all causes attributed to ambient ozone poll] AS INT)) AS FLOAT) /
        SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) * 100 AS PercentageAPM,
    CAST(SUM(CAST([Deaths that are from all causes attributed to ambient particulat] AS INT)) AS FLOAT) /
        SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) * 100 AS PercentageAPP,
    CAST(SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) AS FLOAT) /
        SUM(CAST([Deaths that are from all causes attributed to air pollution per ] AS INT)) * 100 AS PercentageAP,
	Year
FROM 
    master..DR_Air_Pollution
GROUP BY Entity,Year
ORDER BY Location;
