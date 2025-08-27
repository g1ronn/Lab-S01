Exercicio 1:
io.write("Digite o valor de M (início do intervalo): ")
local M = tonumber(io.read())
io.write("Digite o valor de N (fim do intervalo): ")
local N = tonumber(io.read())
io.write("Digite o valor de X (para encontrar os múltiplos): ")
local X = tonumber(io.read())

if M == nil or N == nil or X == nil then
  print("Entrada inválida. Por favor, digite apenas números inteiros.")
else
  print(string.format("\nOs múltiplos de %d no intervalo de %d a %d são:", X, M, N))
  for i = M, N do
    if i % X == 0 then
      print(i)
    end
  end
end

Exercicio 2: 
print("Digite quantos números você deseja colocar:")
local n = tonumber(io.read())  
local tabela = {}

for i = 1, n do
    print("Digite o número " .. i .. ":")
    tabela[i] = tonumber(io.read())
end
local maior = tabela[1]
for i = 2, n do
    if tabela[i] > maior then
        maior = tabela[i]
    end
end
print("O maior valor é: " .. maior)

Exercicio 3:
print("Digite os números desejados:")
local n = tonumber(io.read())
local numeros = {}
local pares = {}

for i = 1, n do
    print("Digite o número " .. i .. ":")
    numeros[i] = tonumber(io.read())
end

for i = 1, n do
    if numeros[i] % 2 == 0 then
        table.insert(pares, numeros[i])
    end
end

print("Os números pares são:")
for i = 1, #pares do
    print(pares[i])
end

Exercicio 4:
io.write("Digite o primeiro número: ")
local x = tonumber(io.read())
io.write("Digite o segundo número: ")
local y = tonumber(io.read())

io.write("Digite o operador matemático desejado (+, -, *, /): ")
local operador = io.read()

if x == nil or y == nil then
    print("Entrada de números inválida.")
else
    if operador == "+" then
        local resultado = x + y
        print(string.format("Resultado: %d + %d = %d", x, y, resultado))
    elseif operador == "-" then
        local resultado = x - y
        print(string.format("Resultado: %d - %d = %d", x, y, resultado))
    elseif operador == "*" then
        local resultado = x * y
        print(string.format("Resultado: %d * %d = %d", x, y, resultado))
    elseif operador == "/" then
        if y == 0 then
            print("Divisão por zero não existe")
        else
            local resultado = x / y
            print(string.format("Resultado: %d / %d = %d", x, y, resultado))
        end
    else
        print("Operador inválido")
    end
end
