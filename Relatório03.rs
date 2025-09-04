Exercicio 1
use std::io;

fn verificar_senha(senha: &str) -> bool {
    if senha.len() < 8 {
        return false;
    }

    let mut tem_numero = false;
    let mut tem_maiuscula = false;

    for c in senha.chars() {
        if c.is_ascii_digit() {
            tem_numero = true;
        }
        if c.is_ascii_uppercase() {
            tem_maiuscula = true;
        }
    }
    tem_numero && tem_maiuscula
}

fn main() {
    loop {
        println!("Digite uma senha:");

        let mut senha = String::new();
        io::stdin()
            .read_line(&mut senha)
            .expect("Falha ao ler a linha");

        
        let senha = senha.trim();

        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida. Tente novamente.");
        }
    }
}

Exercicio 2
use std::io;
fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    
    println!("Jogador 1, escolha 'par' ou 'impar':");

    let mut escolha = String::new();
    io::stdin().read_line(&mut escolha).expect("Erro ao ler entrada");
    let escolha = escolha.trim().to_lowercase();

    println!("Jogador 1, digite seu número (inteiro):");
    let mut num1 = String::new();
    io::stdin().read_line(&mut num1).expect("Erro ao ler número");
    let num1: i32 = num1.trim().parse().expect("Digite um número válido!");

    println!("Jogador 2, digite seu número (inteiro):");
    let mut num2 = String::new();
    io::stdin().read_line(&mut num2).expect("Erro ao ler número");
    let num2: i32 = num2.trim().parse().expect("Digite um número válido!");

    let soma = num1 + num2;
    println!("A soma dos números é: {}", soma);

    
    let soma_par = eh_par(soma);

    if (soma_par && escolha == "par") || (!soma_par && escolha == "impar") {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}

Exercício 3:
use std::io;
fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        println!("{} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
    println!("Digite o número da tabuada:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Erro ao ler número");
    let numero: i32 = input.trim().parse().expect("Digite um número válido!");
    
    
    println!("Digite o limite inferior:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Erro ao ler número");
    let limite_inferior: i32 = input.trim().parse().expect("Digite um número válido!");
    
    
    println!("Digite o limite superior:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Erro ao ler número");
    let limite_superior: i32 = input.trim().parse().expect("Digite um número válido!");

    imprimir_tabuada(numero, limite_inferior, limite_superior);
}

Exercicio 4
fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let peso1 = 2.0;
    let peso2 = 3.0;
    let peso3 = 5.0;

    (nota1 * peso1 + nota2 * peso2 + nota3 * peso3) / (peso1 + peso2 + peso3)
}

fn main() {
    let nota1 = 7.5;
    let nota2 = 8.0;
    let nota3 = 9.2;

    
    let media = calcular_media(nota1, nota2, nota3);
    println!("Média: {:.2}", media);

    if media >= 7.0 {
        println!("Aluno Aprovado");
    } else {
        println!("Aluno Reprovado");
    }
}



