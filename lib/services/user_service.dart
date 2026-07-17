import '../dto/user_dto.dart';


class UserService {


 Future<List<UserDto>> fetchUsers() async {

   await Future.delayed(
     const Duration(seconds:2)
   );


   return [
     UserDto(
       id:1,
       name:"Ramatoulaye Diouf",
       email:"ramatoulaye@gmail.com"
     ),

     UserDto(
       id:2,
       name:"Fatou Ndiaye",
       email:"fatou@gmail.com"
     ),

     UserDto(
       id:3,
       name:"Alioune Diop",
       email:"alioune@gmail.com"
     ),

   ];

 }

}