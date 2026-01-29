import 'dart:io';

void main() {
  Account pedroAccount = Account("Pedro", 1000);
  Account marianaAccount = Account("Mariana", 5000);

  List<Account> accounts = <Account>[pedroAccount, marianaAccount];

  print("\nBank's accounts:");
  for(Account account in accounts){
    print("Holder: ${account.holder}"); 
    print("Balance: R\$${account._balance.toStringAsFixed(2)}\n"); 
  }

  print("Type an value to ${pedroAccount.holder} receive:");
  double value = double.parse(stdin.readLineSync()!);

  pedroAccount.receive(value);

  print("Type an value to ${marianaAccount.holder} send:");
  value = double.parse(stdin.readLineSync()!);

  marianaAccount.send(value);

  for(Account account in accounts){
    print("Holder: ${account.holder}"); 
    print("Balance: R\$${account._balance.toStringAsFixed(2)}\n"); 
  }
}

class Account {
  String holder;
  double _balance;

  Account(this.holder, this._balance);

  void receive(double value) {
    _balance += value;
    print("Transaction conclude with success.\n");
  }

  void send(double value) {
    if (_balance >= value) {
      if (_balance == value) {
        print("The balance of $holder will be reseted, because the value of transaction equals of the balance.\n");
      }
      _balance -= value;
      print("Transaction conclude with success.\n");
    } else {
      print("Occured an error in the transaction. The sender has no balance to conclude.\n");
    }
  }
}