import 'dart:io';
import 'package:bank/account.dart';

List<Account> accounts = [];

void main() {
  int command = 0;
  while (command != 9) {
    clearScreen();
    header();

    menuOptions['main']!();
    command = int.parse(stdin.readLineSync()!);

    switch (command) {
      case 0:
        print("Leaving of the bank...");
        exit(0);

      case 1:
        openActions();
        break;

      case 2:
        transactionActions();
        break;

      case 3:
        viewActions();
        break;

      default:
        print("Invalid command. Type again!");
        sleep(const Duration(seconds: 2)); // 'sleep' to give the user time to read the message.
    }
  }
}

// Map with menu options
Map<String, Function> menuOptions = {
  'main': () => {
    print("Welcome to Dart Bank! What do you need?"),
    print("[1] Open an account"),
    print("[2] Make a transaction"),
    print("[3] Calculate yield of savings account"),
    print("[4] View accounts"),
    print("[0] Leave the bank"),
  },
  'account-open': () => {
    print("Which account do you need?"),
    print("[1] Current account"),
    print("[2] Savings account"),
    print("[3] Salary account"),
    print("[4] Enterprise account"),
    print("[5] Investment account"),
    print("[0] Back to menu"),
  },
  'account-transaction': () => {
    print("Which transaction you'll make?"),
    print("[1] Make a withdrawal"),
    print("[2] Deposit"),
    print("[3] Deposit in salary account"),
    print("[0] Back to menu"),
  },
};

/*
 * Menu actions
 */
void openActions() {
  int command = 9;
  while (command != 0) {
    clearScreen();
    menuOptions['account-open']!();

    command = int.parse(stdin.readLineSync()!);
    if (command >= 1 && command <= 5) {
      openAccount(command);
    } else if (command == 0) {
      // Return to the main menu
      return;
    } else {
      print("Invalid command. Type again!");
      sleep(const Duration(seconds: 2));
    }
  }
}

void transactionActions() {
  if (!checksIfHaveOpenAccounts()) {
    return;
  }

  int command = 9;
  while (command != 0) {
    clearScreen();
    menuOptions['account-transaction']!();

    command = int.parse(stdin.readLineSync()!);
    switch (command) {
      case 0: 
        // Return to the main menu
        return;

      case 1:
        makeTransactions('withdrawal');
        break;

      case 2:
        makeTransactions('deposit');
        break;

      case 3:
        makeTransactions('salary deposit');
        break;

      default:
        print("Invalid command. Type again!");
        sleep(const Duration(seconds: 2));
    }
  }
}

void viewActions() {
  if (!checksIfHaveOpenAccounts()) {
    return;
  }

  for (Account account in accounts) {
    account.printsAccountDescription();
  }
  sleep(const Duration(seconds: 2));
}

/*
 * Operations
 */
// Open Account
void openAccount(int accountType) {
  clearScreen();
  print("== Open an account ==");
  
  if (accountType == 3) {
    openSalaryAccount();
  } else {
    bool isHolderAvaible = false;
    String holder = '';
    do {
      print("Type the holder's name:");
      holder = stdin.readLineSync()!;
      isHolderAvaible = verifyHolder(holder, 'open-account');
    } while (!isHolderAvaible);

    print("How much of money do you want to send to your account?");
    double balance = double.parse(stdin.readLineSync()!);

    print("\nOpening account...");
    dynamic newAccount;
    switch (accountType) {
      case 1:
        newAccount = CurrentAccount(holder, balance);
        break;
        
      case 2:
        newAccount = SavingsAccount(holder, balance);
        break;

      case 4:
        newAccount = EnterpriseAccount(holder, balance);
        break;

      case 5:
        newAccount = InvestmentAccount(holder, balance);
        break;
    }
    accounts.add(newAccount);
  }

  print("Account open with success!");
  sleep(const Duration(seconds: 2));
}

// Open Salary Account
void openSalaryAccount() {
  bool isHolderAvaible = false;
  String holder = '';
  do {
    print("Type the holder's name:");
    holder = stdin.readLineSync()!;
    isHolderAvaible = verifyHolder(holder, 'open-account');
  } while (!isHolderAvaible);

  print("Type the enterprise name:");
  String enterprise = stdin.readLineSync()!;

  print("Type the EIN:");
  String ein = stdin.readLineSync()!;

  print("How much of money do you want to send to your account?");
  double balance = double.parse(stdin.readLineSync()!);

  print("\nOpening account...");
  accounts.add(SalaryAccount(holder, balance, enterprise, ein));
}

// Withdraw and Deposits
void makeTransactions(String transactionType) {
  clearScreen();
  bool isHolderAvaible = false;
  String holder = '';

  print("== Making a $transactionType ==");
  do {
    print("Type the account's holder:");
    holder = stdin.readLineSync()!;
    isHolderAvaible = verifyHolder(holder, 'make-transaction');
  } while (!isHolderAvaible);

  print("Type the value:");
  double value = double.parse(stdin.readLineSync()!);

  dynamic account = accounts.firstWhere((ac) => ac.holder == holder);
  
  switch (transactionType) {
    case 'withdrawal':
      account.send(value);
      break;

    case 'deposit':
      account.receive(value);
      break;
    
    case 'salary deposit':
      account.salaryDeposit(value);
      break;
  }
  sleep(const Duration(seconds: 2));
}

/*
 * Functions - Verifications
 */
// Verifies if the command is correct
bool verifyCommand(String value) {
  if (value == '' || value.isEmpty) {
    print("Invalid command. Type again!");
    return false;
  }
  return true;
}

// Verifies if the holder / account exists
bool verifyHolder(String value, String prefix) {
  if (!verifyCommand(value)) return false;

  bool wasFound = false;

  // If accounts are empty, don't need holder's verification
  if (accounts.isNotEmpty) {
    for (Account account in accounts) {
      if (account.holder == value) {
        if (prefix == "open-account") {
          print("Holder's name are unavaible");
          return false;
        } else {
          wasFound = true;
        }
      }
    }
  }

  if (prefix == 'make-transaction' && !wasFound) {
    print("Don't found any account with this holder");
    print("Please try again.\n");
    sleep(const Duration(seconds: 2));
    return false;
  }
  return true;
}

// Checks if have some open account
bool checksIfHaveOpenAccounts() {
  if (accounts.isEmpty) {
    print("\nI'm sorry, has no one account open");
    sleep(const Duration(seconds: 2));
    return false;
  }
  return true;
}

/*
 * Functions - Others
 */
// Prints header
void header() {
  print(" :::====  :::====  :::= === :::  ===");
  print(" :::  === :::  === :::===== ::: === ");
  print(" =======  ======== ======== ======  ");
  print(" ===  === ===  === === ==== === === ");
  print(" =======  ===  === ===  === ===  ===");
  print("                                    ");
}

// Clear terminal
void clearScreen() {
  if (Platform.isWindows) {
    // To Windows
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    // To Linux and macOS
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}