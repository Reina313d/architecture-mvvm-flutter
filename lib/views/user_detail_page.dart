import 'package:flutter/material.dart';
import '../models/user.dart';


class UserDetailPage extends StatelessWidget{


 final User user;


 const UserDetailPage({
 super.key,
 required this.user
 });



 @override
 Widget build(BuildContext context){


 return Scaffold(

 appBar:AppBar(
 title:const Text("Détails utilisateur"),
 ),


 body:Padding(

 padding:const EdgeInsets.all(20),

 child:Column(

 crossAxisAlignment:
 CrossAxisAlignment.start,


 children:[


 Text(
 user.name,
 style:const TextStyle(
 fontSize:25
 ),
 ),


 const SizedBox(height:20),


 Text(user.email),


 ],


 ),

 ),

 );


 }


}