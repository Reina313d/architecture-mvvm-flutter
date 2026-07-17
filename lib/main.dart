import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/user_viewmodel.dart';
import 'views/user_list_page.dart';



void main(){

runApp(const MyApp());

}



class MyApp extends StatelessWidget{


const MyApp({super.key});


@override
Widget build(BuildContext context){


return ChangeNotifierProvider(

create:(_)=>UserViewModel(),


child:MaterialApp(

debugShowCheckedModeBanner:false,


title:"MVVM Flutter",


theme:ThemeData(
colorScheme:
ColorScheme.fromSeed(
seedColor:Colors.blue
)
),


home:
const UserListPage(),


),


);


}


}