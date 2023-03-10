import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maicolandapp/model/entity/news.dart';
class WidgetHomeCardNews extends StatelessWidget {
   WidgetHomeCardNews({
    Key? key,
    required this.news
  }) : super(key: key);

  News news;
  void openNewsDetails(BuildContext context,News item) {
    Navigator.pushNamed(context, '/news/details', arguments: item);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openNewsDetails(context,news),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20),
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
                // borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 2,
                        ),
                      ],
                      // borderRadius: const BorderRadius.only(
                      //   topLeft: Radius.circular(5),
                      //   topRight: Radius.circular(5),
                      // ),
                      image: DecorationImage(
                        image: NetworkImage(news.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[ Text(
                                "Ng??y ????ng : ${news.dateCreated.day}/${news.dateCreated.month}/${news.dateCreated.year}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                    fontFamily: "Montserrat",
                                    fontSize: 9,
                                    fontStyle : FontStyle.italic
                                ),
                              ),
                              ]
                          ),
                          const SizedBox(height: 5),
                          Container(
                            child: Text(
                              news.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                                fontSize: 16,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 10,
            child: Container(
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 2,
                left: 5,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/fire.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    (daysBetween(news.dateCreated,DateTime.now())==0)? "H??m nay":daysBetween(news.dateCreated,DateTime.now()).toString()+ " ng??y tr?????c",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}