import 'package:corona/Country.dart';
import 'package:corona/helper.dart';
import 'package:corona/home/InfoShow.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final List<Country> countries;

  Details({
    this.countries,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      height: data.size.height,
      width: data.size.width,
      child: Center(
        child: DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.1,
          maxChildSize: 0.85,
          builder: (BuildContext context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: blackBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Center(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: countries.length * 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        child: Center(
                          child: Text(
                            'Details',
                            style: TextStyle(
                              color: purple,
                              fontSize: data.size.width * 0.08,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      );
                    } else if (index % 2 == 1) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: data.size.width * 0.1,
                          vertical: data.size.height * 0.05,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                countries[index ~/ 2].name,
                                style: TextStyle(
                                  color: cyan,
                                  fontSize: data.size.width * 0.1,
                                ),
                              ),
                              SizedBox(
                                height: data.size.width * 0.08,
                              ),
                              InfoShow(
                                top: countries[index ~/ 2].totalCases,
                                left: countries[index ~/ 2].deaths,
                                right: countries[index ~/ 2].recovered,
                                size: data.size.width * 0.08,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: data.size.width * 0.1,
                        ),
                        height: data.size.height * 0.005,
                        decoration: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(
                            data.size.height * 0.005,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
