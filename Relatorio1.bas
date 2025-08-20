EXERCICIO 1:
10 INPUT "Digite a primeira nota: "; a
20 INPUT "Digite a segunda nota: "; b
30 LET media = (VAL(a) + VAL(b))/2
40 PRINT "Media = " + media
50 IF media >= 60 THEN PRINT "Aprovado direto" ELSE IF media < 30 THEN PRINT "Reprovado direto" ELSE GOTO 70
60 END
70 INPUT "Nota da NP3: "; c
80 LET novaMedia = (VAL(c) + VAL(media))/2
90 PRINT "Nova media = " + novaMedia
100 IF novaMedia >= 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado na NP3"
110 END


EXERCICIO 3:
  10 INPUT "Digite a temperatura em Celsius: "; celsius
  20 kelvin = celsius + 273
  30 fahrenheit = (celsius * 9 / 5) + 32
  40 PRINT "Temperatura em Celsius: " + celsius
  50 PRINT "Temperatura em Kelvin: " + kelvin
  60 PRINT "Temperatura em Fahrenheit: " + fahrenheit

EXERCICIO 4:
10 INPUT "Digite a altura (em metros): "; altura
20 INPUT "Digite o peso (em kg): "; peso
30 LET imc = peso / (altura * altura)
40 PRINT "O IMC calculado é: " + imc
