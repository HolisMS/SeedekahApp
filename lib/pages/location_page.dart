import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../maps.dart';
import '../model/panti.dart';
import '../widgets/panti_item.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi panti asuhan'),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _buildListPanti(),
      ),
    );
  }

  Widget _buildListPanti() {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/panti_doc.json'),
      builder: (context, snapshot) {
        final List<Panti> panti = parsePanti(snapshot.data);
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: panti.length,
          itemBuilder: (context, index) {
            return PantiIem(
              name: panti[index].name,
              telp: panti[index].telp,
              address: panti[index].address,
              ontap: () => MapUtils.openMap(-6.893959, 107.633917),
            );
          },
        );
      },
    );
  }
}
