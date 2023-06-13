import 'package:flutter/material.dart';
import 'package:travel_ui/models/destination.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/hotel.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Exclusive Hotels',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext ctx, int idx) {
                Hotel hotel = hotels[idx];
                return Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 250,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom: 15,
                          child: Container(
                            width: 250,
                            height: 130,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  hotel.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  hotel.address,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  '\$${hotel.price} / night',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 6)
                              ]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                    height: 190,
                                    width: 230,
                                    image: AssetImage(hotel.imageUrl),
                                    fit: BoxFit.cover),
                              ),
                            ],
                          ),
                        )
                      ],
                    ));
              }),
        )
      ],
    );
  }
}
