import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import 'package:FindYourPet/app/view/widgets/subtitle.dart';

import '../../controller/link_controller.dart';

class CardInsidePage extends StatelessWidget {
  CardInsidePage({
    super.key,
    this.image,
    required this.imageURL,
    required this.name,
    required this.status,
    required this.description,
    required this.telephone,
    required this.map,
  });

  final String? image;
  final String imageURL;
  final String name;
  final String status;
  final String description;
  final String telephone;
  final String map;

  final controller = LinkController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(imageURL)))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_pin,
                          size: 16,
                        ),
                        label: Text(
                          'Está na região de: $map',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 12),
                          const SubTitle(
                            title: 'Situação do animal',
                          ),
                          Text(status),
                          const SizedBox(height: 12),
                          const SubTitle(title: 'Descrição'),
                          Text(description),
                          const SizedBox(height: 24),
                          Center(
                            child: TextButton.icon(
                              icon: const FaIcon(
                                FontAwesomeIcons.whatsapp,
                                size: 18,
                              ),
                              label: const Text(
                                'ENTRAR EM CONTATO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () async {
                                await controller.openLink(
                                  context: context,
                                  urlParam:
                                      "https://api.whatsapp.com/send?phone=$telephone&text=Olá%2C+tudo+bom%3F+Vim+do+FindYourPet+e+estou+interessada+em+saber+mais+a+respeito+do+pet+que+está+no+anúncio+..",
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
