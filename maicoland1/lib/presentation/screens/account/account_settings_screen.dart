import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maicolandapp/logic/blocs/account/account_bloc/account_bloc.dart';
import 'package:maicolandapp/model/repository/authentication_repository.dart';
import 'package:maicolandapp/model/repository/user_repository.dart';
import 'package:maicolandapp/presentation/resources/resources.dart';
import 'package:maicolandapp/presentation/screens/account/account_auth_phone.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  bool _passwordVisible = false;
  // final AuthenticationRepository _auth =  AuthenticationRepository();
  // get user => _auth.user ; 
  // var _userService = UserService();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _usernameController = TextEditingController(); 
  final _newRepeatPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _changePasswordKey =  GlobalKey<FormState>();
   final _changeUsernameKey =  GlobalKey<FormState>();
   final _changePhoneNumberKey =  GlobalKey<FormState>();
  //  final UserRepository _userRepository = UserRepository(); 
  @override
  void initState() {
    _passwordVisible = false;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Thay ?????i m???t kh???u ",1),
            buildAccountOptionRow(context, "Thay ?????i t??n ????ng nh???p ",2),
                 buildAccountOptionRow(context, "Thay ?????i s??? ??i???n tho???i ",3),
            const SizedBox(
              height: 40,
            ),
            //  Row(
            //   children: const [
            //     Icon(
            //       Icons.volume_up_outlined,
            //       color: Colors.green,
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Text(
            //       "Notifications",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // const Divider(
            //   height: 15,
            //   thickness: 2,
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // buildNotificationOptionRow("New for you", true),
            // buildNotificationOptionRow("Account activity", true),
            // buildNotificationOptionRow("Opportunity", false),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: OutlineButton(
                padding:const EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Quay l???i ",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title, int index) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  index == 1 ? changePasswordForm(context) : Container(),
                  index == 2 ? changeUsernameForm(context) : Container(),
                  index == 3 ? changePhoneNumberForm(context) : Container(),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Form changePasswordForm(BuildContext context){
    return Form(
      key: _changePasswordKey,
      child: Column(
          children:[
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _oldPasswordController,
              decoration: const InputDecoration(
                labelText: 'M???t kh???u c??',
                hintText: 'Vui l??ng nh???p m???t kh???u c??',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _newPasswordController,
              decoration: const InputDecoration(
                labelText: 'M???t kh???u m???i ',
                hintText: 'Vui l??ng nh???p m???t kh???u m???i',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _newRepeatPasswordController,
              decoration: const InputDecoration(
                labelText: 'M???t kh???u m???i',
                hintText: 'Vui l??ng nh???p l???i m???t kh???u m???i',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: TextButton(

                onPressed: () async {
                  print("1");
                  // String? userId = await _userService.getUserId();
                  // var   passwordCorrect = await _userService.checkPassword(_oldPasswordController.text, userId.toString());
                  // if (passwordCorrect) {
// 
                  // }
                  // else {
                  //   print("Sai");
                  // }
                },

                child: const Text("L??u",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
          ]
      ),

    );
  }
   Form changeUsernameForm(BuildContext context){
    return Form(
      key: _changeUsernameKey,
      child: Column(
          children:[
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _usernameController,
              decoration:  InputDecoration(
                labelText:"Nh???p t??n ????ng nh???p m???i",
                hintText: ""
              ),
            ),
            
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: TextButton(

                onPressed: () async {
                  try{
                  // await _userRepository.changeUsername(_usernameController.text);
                   BlocProvider.of<AccountBloc>(context).add(AccountLoad());
                  Navigator.of(context).pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
                     ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Thay ?????i t??n ????ng nh???p th??nh c??ng!", style : TextStyle(color : AppColors.white)),
                              backgroundColor: AppColors.appGreen1,
                            ),
                          );
                  
                  }catch(e){
 ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Thay ?????i t??n ????ng nh???p th???t b???i!"),
                              backgroundColor: Colors.red,
                            ),
                          );
                  }

                },

                child: const Text("L??u",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
          ]
      ),

    );
  }
 Widget changePhoneNumberForm(BuildContext context){
    // return AccountAuthPhone(user: user);
    return Container();
  
  }
  bool isPhone(String input) => RegExp(
  r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
).hasMatch(input);

}