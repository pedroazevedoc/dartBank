import 'dart:io';
import 'package:bank/account.dart';

void main() {
  Account pedroAccount = Account("Pedro", 1000);
  Account marianaAccount = Account("Mariana", 5000);

  List<Account> accounts = <Account>[pedroAccount, marianaAccount];

  print("\nBank's accounts:");
  for (Account account in accounts) {
    print("Holder: ${account.holder}"); 
    print("Holder: ${account.getBalance().toStringAsFixed(2)}"); 
  }

  print("Type an value to ${pedroAccount.holder} receive:");
  double value = double.parse(stdin.readLineSync()!);

  pedroAccount.receive(value);

  print("Type an value to ${marianaAccount.holder} send:");
  value = double.parse(stdin.readLineSync()!);

  marianaAccount.send(value);

  for (Account account in accounts) {
    print("Holder: ${account.holder}"); 
    print("Holder: ${account.getBalance().toStringAsFixed(2)}"); 
  }
}