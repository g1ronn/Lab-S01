EXERCICIO 1:
10 INPUT "Digite a primeira nota: "; a
20 INPUT "Digite a segunda nota: "; b
30 LET media = (a+b)/2
40 PRINT "Media = " + media
50 IF media >= 60 THEN PRINT "Aprovado direto" ELSE IF media < 30 THEN PRINT "Reprovado direto" ELSE GOTO 70
60 END
70 INPUT "Nota da NP3: "; c
80 LET novaMedia = (media + c) / 2
90 PRINT "Nova media = " + novaMedia
100 IF novaMedia >= 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado na NP3"
110 END
