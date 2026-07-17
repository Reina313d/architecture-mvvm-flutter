import '../models/user.dart';
import '../services/user_service.dart';


class UserRepository {

 final UserService service = UserService();


 Future<List<User>> getUsers() async {

   final data = await service.fetchUsers();

   return data
       .map((e)=>e.toModel())
       .toList();

 }

}