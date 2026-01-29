class Account {
  String holder;
  double _balance;

  Account(this.holder, this._balance);

  void receive(double value) {
    _balance += value;
    print("\nTransaction conclude with success.");
    print("$holder's current balance is \$${_balance.toStringAsFixed(2)}\n");
  }

  void send(double value) {
    if (_balance >= value) {
      if (_balance == value) {
        print("$holder's balance will be reseted, because the value of transaction equals of the balance.\n");
      }
      _balance -= value;
      print("\nTransaction conclude with success.");
      print("$holder's current balance is \$${_balance.toStringAsFixed(2)}\n");
    } else {
      print("\nOccured an error in the transaction. The sender has no balance to conclude.\n");
    }
  }

  double getBalance() {
    return _balance;
  }
}