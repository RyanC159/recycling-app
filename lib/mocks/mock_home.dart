import '../models/home.dart';
import '../models/home_fact.dart';

class MockHome extends Home {
  static final List<Home> items = [
    Home(
        id: 0,
        name: 'Paper',
        imageUrl: 'https://en.pimg.jp/047/032/989/1/47032989.jpg',
        facts: <HomeFact>[
          HomeFact(
              title: 'Recyclable materials include:',
              text:
                  'Newspaper, cardboard, magazines, office paper, junk mail, wrapping paper, paper bags, and phone books. Paper can be recycled by placing it in a recycling bin and should be kept dry. Paper can be recycled up to seven times before it is no longer recyclable. Paper is the most common recyclable material in the United States.'),
          HomeFact(
              title: 'Materials that cannot be recycled include:',
              text:
                  'Napkins,  paper towels, waxed paper, and tissue paper. These materials are not recyclable because they are often contaminated with food or other organic materials, which can contaminate the recycling process. Paper that is contaminated with food or other organic materials can be composted. Paper that is contaminated with plastic or other non-recyclable materials should be thrown away.'),
        ],
        videoUrl: 'Bi4iAo8CZVM'),
    Home(
        id: 1,
        name: 'Glass',
        imageUrl: 'https://en.pimg.jp/047/032/991/1/47032991.jpg',
        facts: <HomeFact>[
          HomeFact(
              title: 'Recyclable materials include: Glass bottles, windows pane',
              text:
                  'Glass bottles and jars. Glass can be recycled by placing it in a recycling bin and should be kept dry. Glass can be recycled indefinitely. Glass is the second most common recyclable material in the United States.'),
          HomeFact(
              title: 'Materials that cannot be recycled include:',
              text:
                  'If the glass is contaminated with food or dirt then it can\'t be processed at the recycling facility. Similarly, heat resistant glass such as ovenware and Pyrex, as well as mirrors and crystal, are not recyclable.'),
        ],
        videoUrl: '1rkVCJjEpRQ'),
    Home(
        id: 2,
        name: 'Plastics',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/8044/8044414.png',
        facts: <HomeFact>[
          HomeFact(title: 'Recyclable materials include:', text: 'candy bar wrapper'),
          HomeFact(
              title: 'Materials that cannot be recycled include:', text: 'two'),
        ],
        videoUrl: 'https://www.youtube.com/watch?v=0Ei1z8yqQ8s'),
    Home(
        id: 3,
        name: 'Metals ',
        imageUrl: 'https://en.pimg.jp/047/032/990/1/47032990.jpg',
        facts: <HomeFact>[
          HomeFact(title: 'Recyclable materials include:', text: 'AS11'),
          HomeFact(
              title: 'Materials that cannot be recycled include:', text: 'two'),
        ],
        videoUrl: 'svukqvYOAbI'),
    Home(
        id: 4,
        name: 'Food Waste',
        imageUrl: 'https://en.pimg.jp/047/032/993/1/47032993.jpg',
        facts: <HomeFact>[
          HomeFact(title: 'Recyclable materials include:', text: 'As222'),
          HomeFact(
              title: 'Materials that cannot be recycled include:', text: 'two'),
        ],
        videoUrl: 'eFlhYS-_tpY'),
    Home(
        id: 5,
        name: 'Electronic Waste',
        imageUrl:
            'https://as1.ftcdn.net/v2/jpg/02/15/39/94/1000_F_215399491_vyOxO01PVjdP5Wpl5TNkM9G31h4PU2UF.jpg',
        facts: <HomeFact>[
          HomeFact(title: 'Recyclable materials include:', text: 'AS3'),
          HomeFact(
              title: 'Materials that cannot be recycled include:', text: 'two'),
        ],
        videoUrl: 'https://www.youtube.com/watch?v=0Ei1z8yqQ8s'),
    // Home(
    // id: 6,
    //     name: 'Textile',
    //     imageUrl: 'https://en.pimg.jp/047/032/987/1/47032987.jpg',
    //     facts: <HomeFact>[
    //       HomeFact(title: 'one', text: 'one'),
    //       HomeFact(title: 'two', text: 'two'),
    //     ]),
  ];

  static Home fetchAny() {
    return MockHome.items[0];
  }

  static List<Home> fetchAll() {
    return MockHome.items;
  }

  static Home fetch(int index) {
    return MockHome.items[index];
  }
}


//     );