import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/constant/theme.dart';

class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up'),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Text(
            'Pilih metode isi saldo',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.merge(TextStyle(color: Colors.black54)),
          ),
          _buildListBank(context, img: 'assets/images/bca.png', bank: 'BCA'),
          _buildListBank(context, img: 'assets/images/bni.png', bank: 'BNI'),
          _buildListBank(context, img: 'assets/images/bri.png', bank: 'BRI'),
          _buildListBank(context,
              img: 'assets/images/permata.png', bank: 'Permata Bank'),
          SizedBox(
            height: 8,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 8,
          ),
          _buildMoreBank(context),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeUi.primaryColor,
                ),
                child: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Agen',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.merge(TextStyle(color: Colors.black54)),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: Image.asset('assets/images/alfamart.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 100,
                  height: 30,
                  child: Image.asset('assets/images/alfamidi.png'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Container(
                  width: 100,
                  height: 40,
                  child: Image.asset('assets/images/indomaret.png'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildListBank(BuildContext context,
      {@required String img, @required String bank}) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              Container(
                height: 35,
                child: Image.asset(img),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                bank,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.merge(TextStyle(color: Colors.black54)),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMoreBank(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lihat semua bank',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.merge(TextStyle(color: ThemeUi.accentColor)),
          ),
          Text(
            'dan bank lainnya',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.merge(TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
