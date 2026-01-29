void main() {
  Account pedroAccount = Account("Pedro", 1000);
  Account marianaAccount = Account("Mariana", 5000);

  List<Account> accounts = <Account>[pedroAccount, marianaAccount];

  for(Account account in accounts){
    print(account.holder); 
    print(account.balance); 
  }
}

class Account {
  String holder;
  double balance;

  Account(this.holder, this.balance);
}