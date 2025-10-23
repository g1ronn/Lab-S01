Exercicio 1:
class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end
  
  def preco_base
    @preco_base
  end

  def preco_base=(valor)
    if valor > 0
      @preco_base = valor
    else
      raise "O preço base deve ser positivo!"
    end
  end

  def preco_final
    @preco_base
  end

  def to_s
    "Drink: #{@nome} | Preço base: $#{@preco_base}"
  end
end


class DrinkPrincipal < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    @preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
    "Drink Principal: #{@nome} | Preço base: $#{@preco_base} | " \
    "Anos desde criação: #{@anos_desde_criacao} | Preço final: $#{preco_final}"
  end
end

puts "Digite o nome do drink:"
nome = gets.chomp

puts "Digite o preço base:"
preco = gets.chomp.to_f

puts "Digite a idade do drink (em anos):"
anos = gets.chomp.to_i

drink = DrinkPrincipal.new(nome, preco, anos)

puts "\n#{drink}"


Exercicio 2:
class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "Este método deve ser implementado nas subclasses"
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} está tocando '#{peca}' no piano"
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} está tocando '#{peca}' no violino"
  end
end

class Maestro
  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    @musicos.each { |musico| musico.tocar_partitura(peca) }
  end

  def mudar_foco(estado)
    mensagens = @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}"
    end
    mensagens.each { |msg| puts msg }
  end
end

musicos = [
  Pianista.new("Caio", "Piano"),
  Violinista.new("Pedro", "Violino")
]

maestro = Maestro.new(musicos)

puts "Digite o nome da peça:"
peca = gets.chomp

maestro.mudar_foco("Concentrado")
maestro.iniciar_ensaio(peca)

Exercicio 3:
class MicroondasUnidade
  def aquecer_por
    puts "MicroOndas está envinado o D-Mail..."
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "D-Mail enviado às #{@hora_envio}: #{@conteudo}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new 
    @dmails = []                      
  end

  def enviar_dmail
    puts "\nEscreva o D-Mail:"
    conteudo = gets.chomp

    puts "Digite o horário de envio:"
    hora_envio = gets.chomp

    @unidade.aquecer_por

    novo_dmail = DMail.new(conteudo, hora_envio)
    @dmails << novo_dmail

    puts "D-Mail foi enviado"
  end

  def listar_dmails(horario_corte)
    puts "\nD-Mails enviados após #{horario_corte}:"
    dmails_filtrados = @dmails.select { |d| d.hora_envio > horario_corte }

    if dmails_filtrados.empty?
      puts "Nenhum D-Mail encontrado após esse horário."
    else
      dmails_filtrados.each { |dmail| puts dmail }
    end
  end
end

telefone = TelefoneDeMicroondas.new

loop do
  puts "1. Enviar D-Mail"
  puts "2. Listar D-Mails após certo horário"
  puts "3. Sair"
  print "Escolha uma opção: "
  opcao = gets.chomp.to_i

  case opcao
  when 1
    telefone.enviar_dmail
  when 2
    puts "Digite o horário:"
    horario_corte = gets.chomp
    telefone.listar_dmails(horario_corte)
  when 3
    puts "Encerrando o programa..."
    break
  else
    puts "Opção inválida!"
  end
end

Exercicio 4:
module Rastreavel
  def obter_localizacao(hora)
    "Localização de #{@nome} às #{hora}: #{@localizacao}"
  end
end

module Perigoso
  def calcular_risco
    "#{@nome} é perigoso"
  end
end

class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome)
    @nome = nome
    @localizacao = "Desconhecida"
  end

  def to_s
    "#{@nome} esta em #{@localizacao}"
  end
end

class Detetive < Participante
  include Rastreavel

  def investigar
    "#{@nome} está analisando pistas no local #{@localizacao}."
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def tramar
    "#{@nome} está tramando algo em #{@localizacao}"
  end
end

class Cenario
  def initialize
    @participantes = []
  end

  def adicionar_participante(participante)
    @participantes << participante
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end

  def listar_ameacas
    ameacas = identificar_ameacas
    if ameacas.empty?
      puts "Nenhuma ameaça detectada"
    else
      puts "\nAlvo perigoso identificado:"
      ameacas.each { |a| puts "#{a.nome} — #{a.calcular_risco}" }
    end
  end
end

# --- MAIN ---
puts "Digite a localização atual de Sherlock Holmes:"
local_sherlock = gets.chomp

puts "Digite a localização atual de Moriarty:"
local_moriarty = gets.chomp

sherlock = Detetive.new("Sherlock Holmes")
sherlock.localizacao = local_sherlock

moriarty = MestreDoCrime.new("Moriarty")
moriarty.localizacao = local_moriarty

cenario = Cenario.new
cenario.adicionar_participante(sherlock)
cenario.adicionar_participante(moriarty)

puts "\ncenario:"
puts sherlock
puts moriarty
puts "\n#{sherlock.investigar}"
puts "#{moriarty.tramar}"

cenario.listar_ameacas

