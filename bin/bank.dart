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
      case 1:
        accountActions();
        break;

      case 2:
        break;

      case 3:
        for (Account account in accounts) {
          account.printsAccountDescription();
        }
        sleep(const Duration(seconds: 2)); // 'sleep' to give the user time to read the message.
        break;

      case 9:
        print("Leaving of the bank...");
        break;

      default:
        print("Invalid command. Type again!");
        sleep(const Duration(seconds: 2)); // 'sleep' to give the user time to read the message.
    }
  }
}

// Menu actions
void accountActions() {
  int command = 9;
  while (command != 0) {
    clearScreen();
    menuOptions['account']!();

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

// Operations - CRUD
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
      isHolderAvaible = verifyHolder(holder);
    } while (isHolderAvaible);

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
  sleep(const Duration(seconds: 2)); // 'sleep' to give the user time to read the message.
}

void openSalaryAccount() {
  bool isHolderAvaible = false;
  String holder = '';
  do {
    print("Type the holder's name:");
    holder = stdin.readLineSync()!;
    isHolderAvaible = verifyHolder(holder);
  } while (isHolderAvaible);

  print("Type the enterprise name:");
  String enterprise = stdin.readLineSync()!;

  print("Type the EIN:");
  String ein = stdin.readLineSync()!;

  print("How much of money do you want to send to your account?");
  double balance = double.parse(stdin.readLineSync()!);

  print("\nOpening account...");
  accounts.add(SalaryAccount(holder, balance, enterprise, ein));
}

bool verifyCommand(String value) {
  if (value == '' || value.isEmpty) {
    print("Invalid command. Type again!");
    return false;
  }
  return true;
}

// Verify if already exists a holder with the name of new holder
bool verifyHolder(String value) {
  bool isCorrect = verifyCommand(value);
  if (isCorrect) return false;
  
  for (Account account in accounts) {
    if (account.holder == value) {
      print("Holder's name are unavaible");
      return false;
    }
  }
  return true;
}

// Views
Map<String, Function> menuOptions = {
  'main': () => {
    print("Welcome to Dart Bank! What do you need?"),
    print("[1] Open an account"),
    print("[2] Make a transaction"),
    print("[3] View accounts"),
    print("[9] Leave the bank"),
  },
  'account': () => {
    print("Which account do you need?"),
    print("[1] Current account"),
    print("[2] Savings account"),
    print("[3] Salary account"),
    print("[4] Enterprise account"),
    print("[5] Investment account"),
    print("[0] Back to menu"),
  },
};

void header() {
  print(" :::====  :::====  :::= === :::  ===");
  print(" :::  === :::  === :::===== ::: === ");
  print(" =======  ======== ======== ======  ");
  print(" ===  === ===  === === ==== === === ");
  print(" =======  ===  === ===  === ===  ===");
  print("                                    ");
}

void clearScreen() {
  if (Platform.isWindows) {
    // To Windows
    print(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    // To Linux and macOS
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}