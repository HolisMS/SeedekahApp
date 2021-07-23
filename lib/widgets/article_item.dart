import 'package:flutter/material.dart';
import '../widgets/constant/theme.dart';

class ArticleItem extends StatelessWidget {
  final String title;
  final String img;
  final Object tag;
  final Function() onTap;

  ArticleItem({this.title, this.img, this.onTap, this.tag});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: size.width,
            height: size.height * 0.3 - 20,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: size.width,
                    child: Hero(
                        tag: tag,
                        child: Image.network(
                          img,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.06,
                  color: ThemeUi.secondaryColor,
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText1?.merge(
                            TextStyle(
                              color: Colors.white,
                            ),
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
