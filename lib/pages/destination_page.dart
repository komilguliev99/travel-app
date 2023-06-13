import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/activity.dart';
import '../models/destination.dart';

class DestinationPage extends StatefulWidget {
  final Destination destination;
  const DestinationPage({Key? key, required this.destination})
      : super(key: key);

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  Widget _buildRatingStars(int rating) {
    String stars = '';

    int i = 0;
    while (i < rating) {
      stars += '⭐ ';
      i++;
    }

    return Text(stars.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ]),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.black),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.search),
                            iconSize: 30,
                            color: Colors.black),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(FontAwesomeIcons.sortAmountDown),
                            iconSize: 25,
                            color: Colors.black)
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.city,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 16,
                          color: Colors.white70,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(widget.destination.country,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 20)),
                      ],
                    )
                  ],
                ),
              ),
              const Positioned(
                  right: 20,
                  bottom: 20,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 26,
                  )),
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext ctx, int idx) {
                  Activity activity = widget.destination.activities[idx];
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 5, 30, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 130,
                                    child: Text(
                                      activity.name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${activity.price}',
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Text('per pax',
                                          style: TextStyle(color: Colors.grey))
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                activity.type,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              _buildRatingStars(activity.rating),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 75,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[200],
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      activity.startTimes[0],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 75,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[200],
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      activity.startTimes[1],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 15,
                          bottom: 15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              width: 110,
                              image: AssetImage(activity.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ))
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
