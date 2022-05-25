import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currencyLst = [
  'INR',
  'USD',
  'EUR',
  'GBP',
  'CAD',
  'AUD',
  'JPY',
  'CHF',
  'CNY',
  'SEK',
  'NZD',
  'MXN',
  'SGD',
  'HKD',
  'NOK',
  'TRY',
  'RUB',
  'ZAR',
  'BRL',
  'MYR',
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'XRP',
  'SOL',
  'DOGE',
  'MATIC',
  'LUNA',
  'THETA',
];

class FetchData {
  static Future<List<String>> getData(String selectedCurreny) async {
    List<String> prices = [];
    String url;
    for (int i = 0; i < cryptoList.length; i++) {
      url =
          'https://rest.coinapi.io/v1/exchangerate/${cryptoList[i]}/$selectedCurreny';
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri,
          headers: {'X-CoinAPI-Key': '0D199DE9-5E0F-4474-83BE-65EACD5B8AB1'});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double Price = data['rate'];
        prices.add(Price.toStringAsFixed(4));
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return prices;
  }
}
