import 'package:flutter/material.dart';
import '../../models/user.dart';


class UserCard extends StatelessWidget {


 final User user;


 const UserCard({
  super.key,
  required this.user
 });


 @override
 Widget build(BuildContext context){

 return Card(

  margin:const EdgeInsets.all(10),

  child:ListTile(

   leading:
    const Icon(Icons.person),


   title:
    Text(user.name),


   subtitle:
    Text(user.email),


   trailing:
    const Icon(Icons.arrow_forward),

  ),

 );


 }

}