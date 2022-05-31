
# Crypto Converter

It is an app which tells the rate of different cryptocurrency in different currencies
The API is provided by coinapi.io

## API Reference

Get exchange rate between pair of requested assets at specific or current time.

```http
 GET /v1/exchangerate/{asset_id_base}/{asset_id_quote}?time={time}
```
URL Parameters

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `asset_id_base` | `string` | Requested exchange rate base asset identifier |
|`asset_id_quote`|`string`|Requested exchange rate quote asset identifier.|
|`time`|`timestring`|Time at which exchange rate is calculated (optional, if not supplied then current rate is returned)|

Output variables
| Variable | Description                |
| :-------- |  :------------------------- |
| `asset_id_base` | Exchange rate base asset identifier |
|`asset_id_quote`|Exchange rate quote asset identifier|
|`time`|Time in ISO 8601 of the market data used to calculate exchange rate|
|`rate`|Exchange rate between assets|






## Screenshots
![](https://user-images.githubusercontent.com/90124241/170084700-e8d2029f-41c8-4e66-8199-ce8e901dffd7.png)



