import 'package:bank/account.dart';

void main() {
  var bernardoAccount = CurrentAccount("Bernardo", 10000);
  var juliaAccount = SavingsAccount("Julia", 4000);
  var fernandaAccount = SalaryAccount("Fernanda", 15000, "Distripeças Distribuidora de Peças LTDA", "00-0000000"); 
  var distripecasAccount = EnterpriseAccount("Distripeças Distribuidora de Peças LTDA", 2000);
  var marianaAccount = InvestmentAccount("Mariana", 2000);

  List<Account> accounts = <Account>[bernardoAccount, juliaAccount, fernandaAccount, distripecasAccount, marianaAccount];

  print("\nBank's accounts:");
  for (Account account in accounts) {
    print("Holder: ${account.holder} | Balance: \$${account.getBalance().toStringAsFixed(2)}"); 
  }

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
  juliaAccount.printsBalance();

  fernandaAccount.receive(7500);
  distripecasAccount.send(1000);
  marianaAccount.receive(1000);
}