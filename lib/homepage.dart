import '../Components/dynamicchip.dart';
import '../Components/cardevent.dart';
import 'package:flutter/material.dart';
// import 'CardT.dart';

class HomePages extends StatefulWidget {
  const HomePages({
    super.key,
  });

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Welcome Name
                      Column(
                        children: const [
                          Text('Welcome Boss',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  height: 1.33,
                                  color: Color(0xff3b383e))),
                          Text(
                            // tungtee9sD (57:18316)
                            'TUNG TEE',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              height: 1.2222222222,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Icon(Icons.notifications_outlined),
                          Icon(Icons.account_circle),
                        ],
                      ),
                    ],
                  ),

                  //Search Bar
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 16),
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search Event',
                      ))),
                ]),
              ),
              //Chip
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [dynamicChip()],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Event',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2222222222,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const CardLayout(
                      thumbnail: Image(
                        image: NetworkImage(
                            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                        fit: BoxFit.cover,
                        height: 100,
                        width: 80,
                      ),
                      title: 'หมู',
                      subtitle:
                          'Flutter continues to improve and expand its horizons. '
                          'This text should max out at two lines and clip',
                      toptitle: 'Fri 17 Mar 08:09',
                      amountPerson: '5',
                      maxPerson: '10',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _DemoBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add New Item',
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 80.0,
      child: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open popup menu',
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                final SnackBar snackBar = SnackBar(
                  content: const Text('Yay! A SnackBar!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}