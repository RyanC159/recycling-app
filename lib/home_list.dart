import 'package:flutter/material.dart';
import 'components/home_tile.dart';
import '/models/home.dart';
import 'styles.dart';
import 'home_detail.dart';

const ListItemHeight = 245.0;

class HomeList extends StatelessWidget {
  final List<Home> homes;

  HomeList(this.homes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recyclable Materials", style: Styles.navBarTitle)),
      body: ListView.builder(
        itemCount: this.homes.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var home = this.homes[index];
    return GestureDetector(
      onTap: () => _navigateToHomeDetail(context, home.id!),
      child:
      Container(
      height: ListItemHeight,
      child: Stack(children: [
        _tileImage(
            home.imageUrl, MediaQuery.of(context).size.width, ListItemHeight),
        _tileFooter(home),
      ]),
    ));
  }

  void _navigateToHomeDetail(BuildContext context, int homeID) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeDetail(homeID),
        ));
  }

  Widget _tileImage(String? url, double width, double height) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Image.network(url!, fit: BoxFit.cover),
    );
  }

  Widget _tileFooter(Home home) {
    final info = HomeTile(home: home, darkTheme: true);
    final overlay = Container(
      padding: EdgeInsets.symmetric(
          vertical: 5.0, horizontal: Styles.horizontalPaddingDefault),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: info,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [overlay],
    );
  }

  Widget _itemTitle(Home home) {
    return Text('${home.name}', style: Styles.textDefault);
  }
}
