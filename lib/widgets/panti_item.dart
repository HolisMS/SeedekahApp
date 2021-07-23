import 'package:flutter/material.dart';

class PantiIem extends StatelessWidget {
  final String name;
  final String telp;
  final String address;
  final Function() ontap;

  PantiIem({this.name, this.telp, this.address, this.ontap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: ontap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            height: size.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name ?? 'name found',
                  style: Theme.of(context).textTheme.bodyText1?.merge(
                        TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  telp ?? 'telp found',
                  style: Theme.of(context).textTheme.bodyText2?.merge(
                        TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  address ?? 'address found',
                  style: Theme.of(context).textTheme.bodyText2?.merge(
                        TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
