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

class CurrentAccount extends Account {
  double loan = 300;

  CurrentAccount(super.holder, super._balance);

  @override
  void send(double value) {
    if (_balance + loan >= value) {
      _balance -= value;
      print("\n$holder's current balance is \$${_balance.toStringAsFixed(2)}");
    }
  }
}

class SavingsAccount extends Account {
  double yield = 0.05;

  SavingsAccount(super.holder, super._balance);

  void calculatesYield() {
    print("\nCalculating $holder's yield");
    _balance += _balance * yield;
  }
}

class SalaryAccount extends Account {
  String enterprise;
  String ein; // (employer identification number)

  SalaryAccount(super.holder, super._balance, this.enterprise, this.ein);

  @override
  void receive(double value) {
    _balance += value;
    print("\nThe $enterprise salary, of EIN $ein in the value \$${value.toStringAsFixed(2)}, was deposited.");
  }
}