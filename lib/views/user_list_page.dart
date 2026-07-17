import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/user_viewmodel.dart';
import 'widgets/user_card.dart';
import 'user_detail_page.dart';


class UserListPage extends StatefulWidget{

 const UserListPage({super.key});


 @override
 State<UserListPage> createState()=>_UserListPageState();

}



class _UserListPageState extends State<UserListPage>{


 @override
 void initState(){

 super.initState();

 Future.microtask(
 ()=>context.read<UserViewModel>().loadUsers()
 );

 }



 @override
 Widget build(BuildContext context){


 final vm=context.watch<UserViewModel>();


 return Scaffold(

 appBar:AppBar(
  title:const Text("Annuaire MVVM"),
 ),



 body:


 vm.isLoading ?

 const Center(
 child:CircularProgressIndicator()
 )

 :

 vm.errorMessage!=null ?

 Center(
 child:Column(
 mainAxisAlignment:MainAxisAlignment.center,
 children:[

 Text(vm.errorMessage!),


 ElevatedButton(
 onPressed:(){
 vm.loadUsers();
 },
 child:const Text("Réessayer")
 )


 ],
 )
 )


 :

 vm.users.isEmpty ?

 const Center(
 child:Text("Aucun utilisateur")
 )


 :

 ListView.builder(

 itemCount:vm.users.length,

 itemBuilder:(context,index){

 final user=vm.users[index];


 return GestureDetector(

 onTap:(){

 Navigator.push(
 context,
 MaterialPageRoute(
 builder:(_)=>
 UserDetailPage(user:user)
 )
 );

 },

 child:UserCard(user:user),

 );


 }

 )

 );


 }


}