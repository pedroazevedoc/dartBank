abstract class Account {
  String holder;
  double _balance;

  Account(this.holder, this._balance);

  void receive(double value) {
    _balance += value;
    print("\nTransaction conclude with success.");
    printsBalance();
  }

  void send(double value) {
    if (_balance >= value) {
      if (_balance == value) {
        print("$holder's balance will be reseted, because the value of transaction equals of the balance.\n");
      }
      _balance -= value;
      print("\nTransaction conclude with success.");
      printsBalance();
    } else {
      print("\nOccured an error in the transaction. The sender has no balance to conclude.\n");
    }
  }

  void printsBalance() {
    print("$holder's current balance is \$${_balance.toStringAsFixed(2)}\n");
  }

  void printsAccountDescription() {
    print("Holder: $holder | Balance: \$${_balance.toStringAsFixed(2)}\n");
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
      print("\nTransaction conclude with success.");
      printsBalance();
    } else {
      print("\nOccured an error in the transaction. The sender has no balance to conclude.\n");
    }
  }
}

class SavingsAccount extends Account {
  double yield = 0.05;

  SavingsAccount(super.holder, super._balance);

  void calculatesYield() {
    print("\nCalculating $holder's yield");
    _balance += (_balance * yield);
    printsBalance();
  }
}

class SalaryAccount extends Account {
  String enterprise;
  String ein; // (employer identification number)

  SalaryAccount(super.holder, super._balance, this.enterprise, this.ein);

  void salaryDeposit(double value) {
    _balance += value;
    print("\nThe $enterprise salary, of EIN $ein in the value \$${value.toStringAsFixed(2)}, was deposited.");
    printsBalance();
  }

  @override
  void printsAccountDescription() {
    print("Holder: $holder | Balance: \$${_balance.toStringAsFixed(2)}");
    print("Enterprise: $enterprise | EIN: $ein\n");
  }
}

mixin Tax {
  double rate = 0.03;

  double taxedValue(double value) {
    return value * rate;
  }
}

class EnterpriseAccount extends Account with Tax {
  EnterpriseAccount(super.holder, super._balance);

  @override
  void send(double value) {
    if (_balance >= value + taxedValue(value)) {
      print("Calculating tax...");
      _balance -= value + taxedValue(value);
      printsBalance();
    } else {
      print("\nOccured an error in the transaction. The sender has no balance to conclude.\n");
    }
  }

  @override
  void receive(double value) {
    print("Calculating tax...");
    _balance += value - taxedValue(value);
    printsBalance();
  }
}

class InvestmentAccount extends Account with Tax {
  InvestmentAccount(super.holder, super._balance);
  
  @override
  void send(double value) {
    if (_balance >= value + taxedValue(value)) {
      _balance -= value + taxedValue(value);
      printsBalance();
    } else {
      print("\nOccured an error in the transaction. The sender has no balance to conclude.\n");
    }
  }

  @override
  void receive(double value) {
    _balance += value - taxedValue(value);
    printsBalance();
  }
}