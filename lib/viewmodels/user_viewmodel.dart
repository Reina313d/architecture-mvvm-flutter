import 'package:flutter/material.dart';

import '../models/user.dart';
import '../repositories/user_repository.dart';


class UserViewModel extends ChangeNotifier{


 final UserRepository repository =
     UserRepository();


 List<User> users=[];


 bool isLoading=false;


 String? errorMessage;



 Future<void> loadUsers() async{


 try{

  isLoading=true;
  errorMessage=null;

  notifyListeners();


  users = await repository.getUsers();


  isLoading=false;

  notifyListeners();


 }catch(e){

  isLoading=false;

  errorMessage="Erreur de chargement";

  notifyListeners();

 }

 }



}