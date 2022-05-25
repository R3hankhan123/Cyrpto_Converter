import 'package:cryto_converter/model/get_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "INR";
  List<String> prices = [];
  void setprice() async {
    prices.clear();
    setState(() {
      cryptoList.map((crypto) {
        prices.add('Loading...');
      });
    });
    final price = await FetchData.getData(selectedCurrency);
    setState(() {
      prices = price;
    });
  }

  @override
  void initState() {
    super.initState();
    setprice();
  }

  Text getText({required int index}) {
    try {
      return Text(
        '1 ${cryptoList[index]} = ${prices[index]} $selectedCurrency',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      );
    } catch (e) {
      return const Text('Loading...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Coin Converter')),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: cryptoList
                      .asMap()
                      .entries
                      .map((crypto) => SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                child: getText(index: crypto.key),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
                height: 150,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 30),
                color: Colors.blue[900],
                child: CupertinoPicker(
                    useMagnifier: true,
                    magnification: 1.2,
                    offAxisFraction: 0.2,
                    scrollController: FixedExtentScrollController(
                        initialItem: currencyLst.indexOf(selectedCurrency)),
                    backgroundColor: Colors.blue[900],
                    itemExtent: 45.0,
                    onSelectedItemChanged: (selectedIndex) {
                      setState(() {
                        selectedCurrency = currencyLst[selectedIndex];
                      });
                      setprice();
                    },
                    children: currencyLst
                        .map((currency) => Center(
                            child: Text(currency,
                                style: const TextStyle(color: Colors.black))))
                        .toList()))
          ]),
    );
  }
}
