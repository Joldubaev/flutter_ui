import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Messages',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                    const SizedBox(width: 35),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Onlines',
                        style: TextStyle(color: Colors.grey, fontSize: 22),
                      ),
                    ),
                    const SizedBox(width: 35),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Groups',
                        style: TextStyle(color: Colors.grey, fontSize: 22),
                      ),
                    ),
                    const SizedBox(width: 35),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'More',
                        style: TextStyle(color: Colors.grey, fontSize: 22),
                      ),
                    ),
                    const SizedBox(width: 35),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
              decoration: const BoxDecoration(
                  color: Color(0xff27c1a9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              height: 220,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Favorite contacts',
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        BuildContactAvatar(
                          filname: 'img1.jpeg',
                          name: 'Alla',
                        ),
                        BuildContactAvatar(
                          filname: 'img2.jpeg',
                          name: 'Jully',
                        ),
                        BuildContactAvatar(
                          filname: 'img3.jpeg',
                          name: 'Mike',
                        ),
                        BuildContactAvatar(
                          filname: 'img4.jpg',
                          name: 'Kler',
                        ),
                        BuildContactAvatar(
                          filname: 'img5.jpeg',
                          name: 'Moene',
                        ),
                        BuildContactAvatar(
                          filname: 'img6.jpeg',
                          name: 'Julie',
                        ),
                        BuildContactAvatar(
                          filname: 'img7.jpeg',
                          name: 'Allen',
                        ),
                        BuildContactAvatar(
                          filname: 'img8.jpg',
                          name: 'John',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildContactAvatar extends StatelessWidget {
  final String filname;
  final String name;

  const BuildContactAvatar({
    Key? key,
    required this.filname,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          UserAvatar(
            filname: filname,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String filname;
  const UserAvatar({
    Key? key,
    required this.filname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 32,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: Image.asset('assets/images/$filname').image,
      ),
    );
  }
}
