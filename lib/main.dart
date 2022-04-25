
import 'package:exercice_basique/main_title_text.dart';
import 'package:exercice_basique/post.dart';
import 'package:exercice_basique/section_title.dart';
import 'package:flutter/material.dart';
import 'post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {
  // const BasicPage({Key? key}) : super(key: key);

  List<Post> posts = [
    Post(name: "Meyer Lupin", time: "5 minutes", imagePath: "android/images/carnaval.jpg", desc: "Petit tour au Magic World, on s'est bien amusés et en plus il n'y avait pas grand nombre. Bref, le kiff", likes: 70, comments: 20),
    Post(name: "Meyer Lupin", time: "2 jours", imagePath: "android/images/mountain.jpg", desc: "La montagne ça vous gagne", likes: 38, comments: 5),
    Post(name: "Meyer Lupin", time: "1 semaines", imagePath: "android/images/work.jpg", desc: "Retour au boulot àprès plusieurs mois de confinement", likes: 10, comments: 2),
    Post(name: "Meyer Lupin", time: "5 ans", imagePath: "android/images/playa.jpg", desc: "Le boulot en remote c'est le pied: la preuve ceci sera mon bureau pour les prochaines semaines", likes: 535, comments: 100)
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook Profile"),
      ),
        body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset("android/images/cover.jpg", height: 200, fit: BoxFit.cover,),
                   Padding(padding: const EdgeInsets.only(top: 125),
                  child: CircleAvatar(radius: 75, backgroundColor: Colors.white,
                  child: myProfilePic(radius: 72),
                  ),
                  )
                ],
              ),
              Row(
                children: const [
                  Spacer(),
                  MainTitleText(data: "Meyer Lupin"),
                  Spacer()
                ],
              ),
                  const Padding(padding: EdgeInsets.all(10),
                  child:   Text(
                    "Un jour les chats domineront le monde, mais pas aujourd'hui, c'est l'heure de la sieste",
                    style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ),
              Row(
                children:  [
                  Expanded(child: buttonContainer(text: "Modifier le profil")),
                  buttonContainer(icon: Icons.border_color)
                ],
              ),
              const Divider(thickness: 2,),
              const SectionTitle("A propos de moi"),
              aboutRow(icon: Icons.house, text: "Cergy, France"),
              aboutRow(icon: Icons.work, text: "Développeur Flutter"),
              aboutRow(icon: Icons.favorite, text: "En couple avec mon chat"),
              const Divider(thickness: 2,),
              const SectionTitle("Amis"),
              allFriends(width/3.5),
              const Divider(thickness: 2,),
              const SectionTitle("Mes Posts"),
              allPosts()
            ],
          ),
        )
    );
  }

  CircleAvatar myProfilePic({required double radius}) {
    return  CircleAvatar(radius: radius, backgroundImage: const AssetImage("android/images/profile.jpg"),);
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue
      ),
      child: (icon == null)
          ? Center(child: Text(text ?? "", style: const TextStyle(color: Colors.white),))
          : Icon(icon, color: Colors.white,),
      height: 50,
    );
  }

  Widget aboutRow({required icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(padding: const EdgeInsets.all(5),
        child: Text(text),
        )
      ],
    );
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.grey)]
          ),
        ),
        Text(name),
        const Padding(padding: EdgeInsets.only(bottom: 5))
      ],
    );
  }

Row allFriends(double width) {
    Map<String, String> friends = {
      "José": "android/images/cat.jpg",
      "Maggie": "android/images/sunflower.jpg",
      "Douggy": "android/images/duck.jpg",
    };
    List<Widget> children = [];
    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));

    });
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
}

Column allPosts() {
    List<Widget> postToAdd = [];
    posts.forEach((element) {
      postToAdd.add(post(post: element));
    });
    return Column(children: postToAdd);
}

Container post({required Post post}){
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfilePic(radius: 20),
              const Padding(padding: EdgeInsets.only(left: 8)),
               Text(post.name),
              const Spacer(),
              timeText(post.getTime())
            ],
          ),
           Padding(padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(post.imagePath, fit: BoxFit.cover,)
          ),
          Text(post.desc, style: const TextStyle(
            color: Colors.blueAccent
          ),
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              const Icon(Icons.favorite),
              Text(post.getLikes()),
              const Icon(Icons.message),
              Text(post.getComments())
            ],
          )
        ],
      ),
    );
}

Text timeText(String time) {
    return Text("Il y a $time", style: const TextStyle(color: Colors.blue),);
}

}
