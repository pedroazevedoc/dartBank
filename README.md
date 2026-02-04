# DartBank - OOP Dart Project

DartBank is a simple command-line banking application developed in Dart, demonstrating object-oriented programming principles. The project includes features such as account creation, deposits, withdrawals, and balance inquiries.

## Objetives
- Apply the 4 pillars of OOP in a real-world scenario
- Implement classes, inheritance, encapsulation, and polymorphism in Dart
- Practice Dart programming language features and syntax
- Create a solid base for future projects using OOP principles

## Implemented Features
- Polymorphism in banking operations
- Encapsulation of sensitive data
- Abstraction for different account types

## Dart SDK Installation Instructions
To install Dart with apt-get, perform the following steps.

1. Clone the repository:
    ```bash
    git clone git@github.com:pedroazevedoc/dartBank.git
    cd dartBank
    ```

2. Update the package index files and install the secure HTTP package.
    ```bash
    sudo apt-get update && sudo apt-get install apt-transport-https
    ```

3. Download and add the Google Linux GPG public key.
    ```bash
    wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub \
    | sudo gpg  --dearmor -o /usr/share/keyrings/dart.gpg
    ```

4. Add the Dart package repository to your Linux system.
    ```bash
    echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' \
    | sudo tee /etc/apt/sources.list.d/dart_stable.list
    ```

    Substitute amd64 with armhf, arm64, or riscv64 as needed for your system.


5. Use the following sudo apt-get commands.
    ```bash
    sudo apt-get update && sudo apt-get install dart
    ```
  
## Run the project
To run the DartBank project, navigate to the project directory and execute the following command:

```bash
dart run bin/dartBank.dart
```