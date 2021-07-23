import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/article.dart';
import '../widgets/constant/theme.dart';

class DetailPage extends StatelessWidget {
  final Article article;

  DetailPage({@required this.article});

  final _keyForm = GlobalKey<FormState>();
  final _nominalCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                color: ThemeUi.backgroudColor,
              ),
              Container(
                width: size.width,
                height: size.height * 0.4,
                child: Hero(
                  tag: article.id,
                  child: Image.network(
                    article.urlImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  height: 30,
                  width: 30,
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    type: MaterialType.circle,
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                        ),
                        onTap: () => Get.back(),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                child: Form(
                  key: _keyForm,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: ThemeUi.backgroudColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.merge(TextStyle(
                                  color: Colors.black87,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            article.desc,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.merge(TextStyle(
                                  color: Colors.black87,
                                )),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 3,
                          ),
                          Text(
                            'Masukan nominal donasi',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.merge(TextStyle(
                                  color: ThemeUi.accentColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _nominalCtrl,
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.bodyText1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            )),
                            validator: (txt) =>
                                txt.isEmpty ? 'Nominal masih kosong' : null,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: size.width * 0.5,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: ThemeUi.primaryColor,
                                elevation: 3,
                              ),
                              onPressed: () => _validateForm(),
                              child: Text(
                                'DONASI',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.merge(TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (_keyForm.currentState.validate()) {
      Get.defaultDialog(
        title: 'Berhasil',
        titleStyle: TextStyle(color: ThemeUi.accentColor),
        middleText: 'Terimakasih telah berdonasi!',
      );
      _nominalCtrl.clear();
    }
  }
}
