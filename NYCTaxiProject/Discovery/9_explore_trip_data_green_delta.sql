USE nyc_taxi_discovery;

SELECT TOP 100
*
FROM OPENROWSET(
    BULK 'trip_data_green_delta/',
    DATA_SOURCE = 'nyc_taxi_data_raw',
    FORMAT = 'DELTA'
) AS trip_data

SELECT TOP 100
*
FROM OPENROWSET(
    BULK 'trip_data_green_delta/year=2020',
    DATA_SOURCE = 'nyc_taxi_data_raw',
    FORMAT = 'DELTA'
) AS trip_data

EXEC sp_describe_first_result_set N'
SELECT TOP 100
*
FROM OPENROWSET(
    BULK ''trip_data_green_delta/'',
    DATA_SOURCE = ''nyc_taxi_data_raw'',
    FORMAT = ''DELTA''
) AS trip_data'

SELECT TOP 100
       *
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) 
   WITH (
        tip_amount FLOAT,
        trip_type INT,
        year VARCHAR(4),
        month VARCHAR(2)
   )AS trip_data;  

SELECT COUNT(DISTINCT payment_type)
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) AS trip_data

   SELECT COUNT(DISTINCT payment_type)
   FROM OPENROWSET(
       BULK 'trip_data_green_delta/',
       DATA_SOURCE = 'nyc_taxi_data_raw',
       FORMAT = 'DELTA'
   ) AS trip_data
   WHERE year = '2020' AND month = '01';  

