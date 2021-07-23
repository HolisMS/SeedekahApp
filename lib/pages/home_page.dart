import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../pages/detail_page.dart';
import '../model/article.dart';
import '../widgets/article_item.dart';
import '../widgets/constant/theme.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _saldo = '78000';
  String _saldoNew;
  final _saldoCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SeeDEKAH',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: Column(
          children: [
            _buildWallet(),
            SizedBox(
              height: 10,
            ),
            _buildActionMenu(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: _buildListDonate()),
          ],
        ),
      ),
    );
  }

  Future _scan() async {
    String barcodeScan;
    try {
      barcodeScan = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScan);
    } on PlatformException {
      barcodeScan = 'Failed to get platform version';
    }
    if (!mounted) return;
  }

  _topUpDana() {
    return Get.defaultDialog(
      title: 'Masukan saldo anda',
      titleStyle: TextStyle(
        color: Colors.black54,
      ),
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _saldoCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderSide: BorderSide(),
              )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Isi nominal saldo';
                }
                _saldoNew = value;
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: ThemeUi.primaryColor),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _saldo = _saldoNew;
                        });
                        _saldoCtrl.clear();
                        Get.back();
                      }
                    },
                    child: Text(
                      'Isi',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: ThemeUi.accentColor),
                    onPressed: () async {
                      await Get.offAndToNamed('/topup');
                      _saldoCtrl.clear();
                    },
                    child: Text(
                      'Top up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _allertPlaformCheck() {
    return Get.snackbar(
      'Scan barcode',
      'not yet supported Web platform',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }

  Widget _buildWallet() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ThemeUi.primaryColor.withOpacity(0.4),
            ThemeUi.primaryColor.withOpacity(0.6),
            ThemeUi.primaryColor.withOpacity(0.8),
            ThemeUi.primaryColor,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dompet Transaksi',
            style: Theme.of(context).textTheme.headline6?.merge(
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Saldo',
            style: Theme.of(context).textTheme.bodyText1?.merge(
                  TextStyle(
                    color: Colors.white,
                  ),
                ),
          ),
          Text(
            'Rp. $_saldo',
            style: Theme.of(context).textTheme.headline5?.merge(
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionMenu() {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Material(
            color: ThemeUi.secondaryColor,
            borderRadius: BorderRadius.circular(8),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Get.toNamed('/location'),
              child: Container(
                width: size.width,
                height: size.height * 0.08,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Material(
            color: ThemeUi.secondaryColor,
            borderRadius: BorderRadius.circular(8),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              //FIXME: check platform
              onTap: () => (size.width > 500) ? _allertPlaformCheck() : _scan(),
              child: Container(
                width: size.width,
                height: size.height * 0.08,
                child: Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Material(
            color: ThemeUi.accentColor,
            borderRadius: BorderRadius.circular(8),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => _topUpDana(),
              child: Container(
                width: size.width,
                height: size.height * 0.08,
                child: Center(
                  child: Text(
                    'Isi saldo',
                    style: Theme.of(context).textTheme.headline6?.merge(
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListDonate() {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
      builder: (context, snapshot) {
        final List<Article> article = parseArticle(snapshot.data);
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: article.length,
          itemBuilder: (context, index) {
            return ArticleItem(
              tag: article[index].id,
              img: article[index].urlImg,
              title: article[index].title,
              onTap: () => Get.to(() => DetailPage(
                    article: article[index],
                  )),
            );
          },
        );
      },
    );
  }
}
