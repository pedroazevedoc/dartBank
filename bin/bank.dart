void main() {
  Conta contaPedro = Conta("Pedro", 1000);
  Conta contaMariana = Conta("Mariana", 5000);

  List<Conta> contas = <Conta>[contaPedro, contaMariana];

  for(Conta conta in contas){
    print(conta.titular); 
    print(conta.saldo); 
  }
}

class Conta {
  String titular;
  double saldo;

  Conta(this.titular, this.saldo);
}