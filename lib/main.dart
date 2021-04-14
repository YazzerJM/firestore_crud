import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firestore_crud/models/constant.dart';

import 'package:firestore_crud/services/movies_service.dart';

import 'package:firestore_crud/screens/home_screen.dart';
import 'package:firestore_crud/screens/movie_details.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _moviesServices = MoviesService();

    return MultiProvider(
      providers: [
        StreamProvider(create: (_) => _moviesServices.fetchAllMovies())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant.appName,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: Colors.black87,
          textTheme: TextTheme(
            headline6: _buildTextStyle(),
            subtitle2: _buildTextStyle()
          )
        ),
        home: HomeScreen(),
        routes: {
          MovieDetails.routeName: (_) => MovieDetails(),
        },
      ),
    );
  }


  TextStyle _buildTextStyle(){
    return TextStyle(color: Colors.white, shadows: <Shadow>[
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 3.0,
        color: Colors.black
      ),
    ]);
  }
}