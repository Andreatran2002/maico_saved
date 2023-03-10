import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maicolandapp/model/entity/user.dart';
// import 'package:maicolandapp/model/api/user/Account_user.dart';
import 'package:maicolandapp/model/repository/authentication_repository.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AuthenticationRepository authenticationRepo;

  AccountBloc({required this.authenticationRepo}) : super(AccountLoading()){
    on<AccountLoad>(_mapAccountLoadToState);
    on<AccountRefresh>((event,emit){
        emit(AccountLoading());
    });
  }


  void _mapAccountLoadToState(AccountLoad event, Emitter<AccountState> emit,) async {
    try {

      User user = User("test","test","test","test","test","test","test");

      emit(AccountLoaded(user: user));
    } catch (e) {
      emit(AccountNotLoaded("Lỗi nè " + e.toString()));
    }
  }
  
}
