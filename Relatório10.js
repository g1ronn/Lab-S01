Exercicio 1:
class Pokemon {
  #vida; 
  
  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }
  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
    console.log(`${this.nome} recebeu ${dano} de dano. Vida atual: ${this.#vida}`);
  }

  atacar(alvo) {
    console.log(`${this.nome} ataca ${alvo.nome}, mas o ataque é genérico.`);
    alvo.receberDano(5);
  }
}

class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 10 + this.bonusAtaque;
    console.log(`${this.nome} usou Ember em ${alvo.nome}!`);
    alvo.receberDano(dano);
  }
}

class PokemonAgua extends Pokemon {
  #curaBase;

  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    const dano = 8;
    console.log(`${this.nome} usou Water Gun em ${alvo.nome}!`);
    alvo.receberDano(dano);

    console.log(`${this.nome} se cura em ${this.#curaBase} pontos!`);
    this.#curar();
  }

  #curar() {
    const novaVida = this.getVida() + this.#curaBase;
    Object.defineProperty(this, '#vida', { value: novaVida }); 
    console.log(`${this.nome} agora tem ${novaVida} de vida.`);
  }
}

const charmander = new PokemonFogo("Charmander", 50, 5);
const squirtle = new PokemonAgua("Squirtle", 60, 4);

charmander.atacar(squirtle);
squirtle.atacar(charmander);

Exercicio 2:
class IExplorador {
  explorarTerritorio() {
    throw new Error("Método 'explorarTerritorio()' deve ser implementado!");
  }
}
class ODM_Gear {
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100;
  }
  usarGas(quantidade) {
    if (quantidade > this.#gasRestante) {
      console.log(`Sem gás suficiente! Restante: ${this.#gasRestante}`);
      this.#gasRestante = 0;
    } else {
      this.#gasRestante -= quantidade;
      console.log(`Usando ${quantidade} de gás. Restante: ${this.#gasRestante}`);
    }
  }
  getGas() {
    return this.#gasRestante;
  }
}
class Soldado extends IExplorador {
  #gear;

  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.#gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    console.log(`${this.nome} está explorando o território`);
    this.#gear.usarGas(20);
    return `${this.nome} explorou com o equipamento ${this.#gear.modelo}. Gás restante: ${this.#gear.getGas()}`;
  }

  verificarEquipamento() {
    return `${this.nome} está usando o ODM_Gear modelo ${this.#gear.modelo}. Gás restante: ${this.#gear.getGas()}`;
  }
}
class Esquadrao extends IExplorador {
  constructor(lider, membrosIniciais = []) {
    super();
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    if (!(soldado instanceof IExplorador)) {
      throw new Error("Somente soldados exploradores podem ser adicionados ao esquadrão!");
    }
    this.membros.push(soldado);
    console.log(`${soldado.nome} foi adicionado ao esquadrão de ${this.lider}.`);
  }

  explorarTerritorio() {
    return this.membros.map(s => s.explorarTerritorio());
  }
  relatarStatus() {
    return this.membros.map(s => s.verificarEquipamento());
  }
}

const levi = new Esquadrao("Capitão Levi");

const eren = new Soldado("Eren", "Modelo A");
const mikasa = new Soldado("Mikasa", "Modelo B");

levi.adicionarMembro(eren);
levi.adicionarMembro(mikasa);

console.log(levi.explorarTerritorio());

console.log(levi.relatarStatus());

Exercicio 3:
class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

class Diario {
  #autorSecreto;

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
  }

  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "Acesso negado! Apenas o autor secreto pode decodificar.";
    }

    if (!this.enigmas.has(num)) {
      return "Enigma não encontrado.";
    }

    const texto = this.enigmas.get(num);
    const decodificado = `${texto.split('').reverse().join('')} [Código #${num}]`;
    return `Enigma decodificado: ${decodificado}`;
  }
}

class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

class Protagonista extends Personagem {
  constructor(nome, idade) {
    super(nome, idade);
    this.diario = new Diario(nome);
  }
}

class CabanaMisterio {
  constructor(diario) {
    this.diario = diario;
    this.visitantes = [];
  }

  adicionarFuncionario(personagem) {
    this.visitantes.push(personagem);
  }

  listarFuncionarios() {
    console.log("=== Funcionários da Cabana do Mistério ===");
    return this.visitantes.map(p => `${p.nome} (${p.idade} anos)`);
  }
}

const dipper = new Protagonista("Dipper", 12);
dipper.diario.adicionarEnigma(1, "mysteryshack");
dipper.diario.adicionarEnigma(2, "gravityfalls");

console.log(dipper.diario.decodificar("Dipper", 1));
console.log(dipper.diario.decodificar("errada", 1));

const cabana = new CabanaMisterio(dipper.diario);
const soose = new Personagem("Soos", 22);
const wendy = new Personagem("Wendy", 17);

cabana.adicionarFuncionario(soose);
cabana.adicionarFuncionario(wendy);

console.log(cabana.listarFuncionarios());

Exercicio 4:
class Hunter {
  constructor(nome, localizacao, idade) {
    this.nome = nome;
    this.localizacao = localizacao;
    this.idade = idade;
  }

  rastrearLocal(latitude, longitude) {
    throw new Error("Método deve ser implementado pela subclasse");
  }
}

class Especialista extends Hunter {
  constructor(nome, localizacao, idade, habilidade) {
    super(nome, localizacao, idade);
    this.habilidade = habilidade;
  }

  rastrearLocal(latitude, longitude) {
    return `${this.nome} rastreou a área (${latitude}, ${longitude}) usando ${this.habilidade}`;
  }
}

class Manipulador extends Hunter {
  constructor(nome, localizacao, idade, alvoAtual) {
    super(nome, localizacao, idade);
    this.alvoAtual = alvoAtual;
  }

  rastrearLocal(latitude, longitude) {
    const alvo = this.alvoAtual ? this.alvoAtual.nome : "nenhum alvo";
    return `${this.nome} manipulou ${alvo} e rastreou a posição (${latitude}, ${longitude})`;
  }
}

class Batalhao {
  constructor() {
    this.hunters = new Map();
  }

  adicionarHunter(hunter) {
    if (!this.hunters.has(hunter.nome)) {
      this.hunters.set(hunter.nome, hunter);
    }
  }

  getNumHunters() {
    return this.hunters.size;
  }

  iniciarRastreamento(latitude, longitude) {
    return Array.from(this.hunters.values()).map(h => h.rastrearLocal(latitude, longitude));
  }
}

const b = new Batalhao();
const e1 = new Especialista("Kurapika", "Yorknew", 19, "Correntes");
const m1 = new Manipulador("Illumi", "Monte Kukuroo", 22, e1);
b.adicionarHunter(e1);
b.adicionarHunter(m1);
console.log("Número de Hunters:", b.getNumHunters());
for (const s of b.iniciarRastreamento(-23.5, -46.6)) {
  console.log(s);
}


