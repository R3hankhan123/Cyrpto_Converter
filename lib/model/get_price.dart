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
  //'LTC',
  'XRP',
  'SOL',
  //'SHIB',
  //'DOGE',
  //'MATIC',
  'LUNA',
  //'THETA'
];

class FetchData {
  static Future<List<String>> getData(String selectedCurreny) async {
    List<String> prices = [];
    String Url;
    for (int i = 0; i < cryptoList.length; i++) {
      Url =
          'https://rest.coinapi.io/v1/exchangerate/${cryptoList[i]}/$selectedCurreny';
      Uri url = Uri.parse(Url);
      http.Response response = await http.get(url,
          headers: {'X-CoinAPI-Key': '0D199DE9-5E0F-4474-83BE-65EACD5B8AB1'});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        prices.add(data['rate'].toString());
      } else {
        prices.add('0.0');
      }
    }
    return prices;
  }
}
