Exercicio 1:
#include <iostream>
using namespace std;

int fibonacci(int n) {
    if (n == 0) {
        return 0;  
    }
    else if (n == 1) {
        return 1;  
    }
    else {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

int main() {
    int n;

    cout << "Digite algum numero: ";
    cin >> n;

    cout << "Fibonacci(" << n << ") = " << fibonacci(n) << endl;

    return 0;
}

Exercicio 2:
#include <iostream>
using namespace std;
float somarArray(float arr[], int tamanho) {
    float soma = 0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i]; 
    }
    return soma;
}

int main() {
    int tamanho;

    cout << "Digite o tamanho que deseja: ";
    cin >> tamanho;

    float arr[tamanho]; 

    cout << "Digite os valores desejados: " << endl;
    for (int i = 0; i < tamanho; i++) {
        cin >> arr[i];
    }

    float resultado = somarArray(arr, tamanho);

    cout << "Soma = " << resultado << endl;

    return 0;
}

Exercicio 3:
#include <iostream>
using namespace std;

int main() {
    int quantidade;
    float nota, soma = 0;

    cout << "Digite quantas notas quer inserir: ";
    cin >> quantidade;

    for (int i = 0; i < quantidade; i++) {
        cout << "Digite a nota " << i + 1 << ": ";
        cin >> nota;

        soma += nota;
    }

    float media = soma / quantidade;

    cout << "Media= " << media << endl;

    if (media >= 7) {
        cout << "Aluno Aprovado!" << endl;
    } else {
        cout << "Aluno Reprovado!" << endl;
    }

    return 0;
}

Exercicio 4:
#include <iostream>
using namespace std;

double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}

double celsiusParaKelvin(double celsius) {
    return celsius + 273.15;
}

int main() {
    int opcao;
    double celsius;

    do {
        cout << "1. Converter Celsius para Fahrenheit" << endl;
        cout << "2. Converter Celsius para Kelvin" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << "Resultado: " << celsiusParaFahrenheit(celsius) << " F" << endl;
                break;

            case 2:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << "Resultado: " << celsiusParaKelvin(celsius) << " K" << endl;
                break;

            case 3:
                cout << "Fim do programa" << endl;
                break;

            default:
                cout << "Opcao nao existe" << endl;
        }
    } while (opcao != 3);

    return 0;
}

