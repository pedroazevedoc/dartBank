import 'dart:io';
import 'package:bank/account.dart';

void main() {
  Account pedroAccount = Account("Pedro", 1000);
  Account marianaAccount = Account("Mariana", 5000);

  CurrentAccount bernardoAccount = CurrentAccount("Bernardo", 10000);
  SavingsAccount juliaAccount = SavingsAccount("Julia", 4000);
  SalaryAccount fernandaAccount = SalaryAccount("Fernanda", 15000, "Distripeças Distribuidora de Peças LTDA", "00-0000000"); 

  List<Account> accounts = <Account>[pedroAccount, marianaAccount, bernardoAccount, juliaAccount, fernandaAccount];

  print("\nBank's accounts:");
  for (Account account in accounts) {
    print("Holder: ${account.holder} | Balance: \$${account.getBalance().toStringAsFixed(2)}"); 
  }

  print("\nType an value to ${pedroAccount.holder} receive:");
  double value = double.parse(stdin.readLineSync()!);

  pedroAccount.receive(value);

  print("Type an value to ${marianaAccount.holder} send:");
  value = double.parse(stdin.readLineSync()!);

  marianaAccount.send(value);

  print("Bank's accounts:");
  for (Account account in accounts) {
    print("Holder: ${account.holder} | Balance: \$${account.getBalance().toStringAsFixed(2)}"); 
  }

  bernardoAccount.send(10300);
  juliaAccount.send(10300);
    
  print("Bank's accounts:");
  for (Account account in accounts) {
    print("Holder: ${account.holder} | Balance: \$${account.getBalance().toStringAsFixed(2)}"); 
  }

  juliaAccount.calculatesYield();
  print("Julia's balance: \$${juliaAccount.getBalance().toStringAsFixed(2)}");

  fernandaAccount.receive(7500);
}