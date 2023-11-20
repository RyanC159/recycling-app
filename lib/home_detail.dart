import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '/models/home.dart';
import 'mocks/mock_home.dart';
import 'styles.dart';

class HomeDetail extends StatelessWidget {
  final int homeID;

  HomeDetail(this.homeID);

  @override
  Widget build(BuildContext context) {
    var home = MockHome.fetch(this.homeID);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          home.name!,
          style: Styles.navBarTitle,
        )),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, home),
        )));
  }

  List<Widget> _renderBody(BuildContext context, Home home) {
    var result = List<Widget>.empty(growable: true);
    result.add(_bannerImage(home.imageUrl!, 170.0));
    result.add(_renderVideo(home.videoUrl!, 170.0));
    result.addAll(_renderFacts(context, home));

    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Home home) {
    var result = List<Widget>.empty(growable: true);
    for (var i = 0; i < home.facts!.length; i++) {
      result.add(_sectionTitle(home.facts![i].title!));
      result.add(_sectionText(home.facts![i].text!));
    }
    return result;
  }

  Widget _sectionTitle(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: Styles.headerLarge,
        ));
  }

  Widget _sectionText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Text(
          text,
          style: Styles.textDefault,
        ));
  }

  Widget _bannerImage(String imageUrl, double height) {
    return Container(
        constraints: BoxConstraints.tightFor(height: height),
        child: Image.network(imageUrl, fit: BoxFit.fitWidth));
  }

  Widget _renderVideo(String videoUrl, double height) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoUrl,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
            ],
          );
        },
      ),
    );
  }
}
