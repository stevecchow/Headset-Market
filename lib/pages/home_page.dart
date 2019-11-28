import 'package:flutter/material.dart';
import '../model/model.dart';

import '../widgets/ProductCard.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'testPage.dart';

// 引入样式常量
import '../constant/style.dart';
import '../constant/customIcons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
    print('index >>> $index');
    if(3 == index){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return Text("xxx");
                  return CounterWidget();
                }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // 开始构建页面
    return Scaffold(
      // 该页面的各种属性：背景色 等等
      backgroundColor: Color(0xFFf3f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(CustomIcons.menu),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(CustomIcons.cart),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("Shop", style: headingStyle),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.12),
                        offset: Offset(0, 10),
                        blurRadius: 30)
                  ]),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                        hintStyle: searchBarStyle,
                        suffixIcon: Icon(CustomIcons.search)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("Headphones", style: headingStyle),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 240,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return ProductCard(
                      imgUrl: product.image,
                      name: product.title,
                      color: product.color);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text("Speakers", style: speakerTitleStyle),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 6),
                                  blurRadius: 6)
                            ]),
                        child: Padding(
                          padding: EdgeInsets.only(left: 22, top: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Rålis", style: productTitleStyle),
                              SizedBox(
                                height: 4,
                              ),
                              Text("Haute Red, Slate Blue,\nMist Grey",
                                  style: speakerdescStyle)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    top: -5,
                    child: Image.asset("assets/speaker.png",
                        fit: BoxFit.cover, width: 150, height: 160),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: BubbleBottomBar(
          backgroundColor: Colors.transparent,
          opacity: 1,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: changePage,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(Icons.home, color: Colors.white),
              title: Text("Home", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  CustomIcons.products,
                  color: Colors.black,
                ),
                activeIcon: Icon(CustomIcons.products, color: Colors.white),
                title: Text("Shop", style: bottomBarItemStyle)),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                activeIcon: Icon(Icons.favorite_border, color: Colors.white),
                title: Text("Favorite", style: bottomBarItemStyle)),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                activeIcon: Icon(Icons.person, color: Colors.white),
                title: Text("Profile", style: bottomBarItemStyle))
          ],
        ),
      ),
    );
  }
}