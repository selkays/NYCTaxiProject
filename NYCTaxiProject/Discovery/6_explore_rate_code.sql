USE nyc_taxi_discovery

SELECT rate_code_id, rate_code
FROM
    OPENROWSET(
        BULK 'rate_code.json',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '1.0',
        FIELDTERMINATOR = '0x0b',
        FIELDQUOTE = '0X0b',
        ROWTERMINATOR = '0X0b'
    ) 
    WITH (
        jsonDoc NVARCHAR(MAX)
    ) AS rate_code
    CROSS APPLY OPENJSON(jsonDoc)
    WITH(
        rate_code_id TINYINT,
        rate_code VARCHAR(20)
    ) ;

-- Process multi line file

SELECT rate_code_id, rate_code
FROM
    OPENROWSET(
        BULK 'rate_code_multi_line.json',
        DATA_SOURCE = 'nyc_taxi_data_raw',
        FORMAT = 'CSV',
        PARSER_VERSION = '1.0',
        FIELDTERMINATOR = '0x0b',
        FIELDQUOTE = '0X0b',
        ROWTERMINATOR = '0X0b'
    ) 
    WITH (
        jsonDoc NVARCHAR(MAX)
    ) AS rate_code
    CROSS APPLY OPENJSON(jsonDoc)
    WITH(
        rate_code_id TINYINT,
        rate_code VARCHAR(20)
    ) ;   
