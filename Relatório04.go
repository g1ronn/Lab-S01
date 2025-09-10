Exercício 1:
package main

import "fmt"

func classificar_numero(numero int){
	if numero > 0 {
		fmt.Println("O número é positivo")
	}else if numero < 0 {
		fmt.Println("O número é negativo")
	}else{
		fmt.Println("O número é zero")
	}
}

func main(){
	fmt.Println("Digite um número:")
	var numero int
	fmt.Scan(&numero)
	classificar_numero(numero)
	fmt.Println("Fim do programa")
}


Exercício 2:
package main

import "fmt"

func main(){
	var num int
	fmt.Println("Digite um número: ")
	fmt.Scan(&num)
	switch num % 2{
		case 0:
			fmt.Println("O número é par")
		case 1:
			fmt.Println("O número é ímpar")
		default:
			fmt.Println("Número inválido")
	}
}

Exercício 3:
package main

import "fmt"

func fibonacci(n int) []int {
	res := []int{0, 1}
	for i := 2; i < n; i++ {
		x := res[i-1] + res[i-2]
		res = append(res, x)
	}

	return res
}

func main() {
	var n int
	fmt.Print("Quantos números da sequência de Fibonacci você quer? ")
	fmt.Scan(&n)
	res := fibonacci(n)
	fmt.Println("Sequência de Fibonacci:", res)
}


Exercício 4:
package main

import "fmt"
func verificarlogin(usuario, senha string) bool{
	if usuario == "senha" && senha == "admin"{
		return true
	}else{
		return false
	}
}

func main(){
	var usuario, senha string
	for {
		fmt.Print("Digite o nome de usuário: ")
		fmt.Scan(&usuario)
		fmt.Print("Digite a senha: ")
		fmt.Scan(&senha)
		
		if verificarlogin(usuario, senha) {
			fmt.Println("Login bem-sucedido!")
			break 
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}
