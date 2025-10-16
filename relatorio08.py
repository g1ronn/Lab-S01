Exercicio 1:
class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    def vida(self):
        return self._vida

    def __str__(self):
        return f"Personagem com {self._vida} pontos de vida e {self._resistencia} pontos de resistência"


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        tipo_armadura = "sim" if self.armadura_pesada else "não"
        return (f"Cavaleiro com {self._vida} pontos de vida, "
                f"{self._resistencia} pontos de resistência "
                )

if __name__ == "__main__":
    p1 = Personagem(100, 50)
    print(p1)

    c1 = Cavaleiro(120, 80, True)
    print(c1)


Exercicio 2:
from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao
        print(f"Herói {self.nome} ({self.funcao}) criado.")

    @abstractmethod
    def usar_ultimate(self):
        pass

class Tanque(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} está usando a Ultimate: Particle Cannon")

class Dano(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} está usando a Ultimate: Dragonblade")

class Suporte(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Suporte")

    def usar_ultimate(self):
        print(f"{self.nome} está usando a Ultimate: Sound Barrier")

if __name__ == "__main__":
    zarya = Tanque("Zarya")
    genji = Dano("Genji")
    lucio = Suporte("Lúcio") 

    elenco_overwatch = [zarya, genji, lucio]

    for heroi in elenco_overwatch:
        heroi.usar_ultimate()
        print("-" * 15)

  Exercicio 3:
# Classe de composição (arma criada e destruída junto com o Joker)
class ArmaCorpoACorpo:
    def __init__(self, nome: str):
        self.nome = nome

    def __str__(self):
        return f"Arma corpo a corpo: {self.nome}"


# Classe agregada (pode existir independente do Joker)
class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} usa {self.arma}"


# Classe principal
class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo("Stab")
        self.equipe = equipe

    def mostrar_equipe(self):
        for membro in self.equipe:
            print(membro)
        print(f"\nJoker usa {self.arma.nome}")


if __name__ == "__main__":
    morgana = PhantomThieves("Morgana", "Shackles of the Soul")
    veigar = PhantomThieves("Veigar", "Primordial Explosion")
    annie = PhantomThieves("Annie", "Summon: Tibbers")

    equipe_joker = [morgana, veigar, annie]

    joker = Joker(equipe_joker)
    joker.mostrar_equipe()

Exercicio 4:
from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, nome, custo, funcao):
        self.nome = nome
        self.custo = custo
        self.funcao = funcao

    def iniciar(self):
        return f"Implante '{self.nome}' (Função: {self.funcao}) ATIVO."

class NetRunner(Cibernetico):
    def __init__(self, codinome, nome_implante, custo_implante, funcao_implante):
        self.codinome = codinome
        self.implante_cibernetico = Implante(nome_implante, custo_implante, funcao_implante)
        print(f"[{self.codinome}] criado. {self.implante_cibernetico.iniciar()}")
    def realizar_hack(self):
        print(f"[{self.codinome}] está usando o {self.implante_cibernetico.nome} para hackear o sistema!")

class Facao:
    def __init__(self, nome, membros_ciberneticos):
        self.nome = nome
        self.membros = membros_ciberneticos
        print(f"\nFaçcão '{self.nome}' formada com {len(self.membros)} membros.")

    def comandar_hack(self):
        print("\n" + "="*50)
        print(f"FAÇÇÃO {self.nome} INICIA ATAQUE CIBERNÉTICO GERAL!")
        print("="*50)

        for membro in self.membros:
            membro.realizar_hack()

        print("="*50)
        print("ATAQUE CONCLUÍDO.")
        
if __name__ == "__main__":
    V = NetRunner("V", "Deck Sandevistan", 50000, "Velocidade")
    Panam = NetRunner("Panam", "Chip NetWatch", 25000, "Rastreamento")
    Silverhand = NetRunner("Silverhand", "Neural Link V3", 80000, "Infiltração")
    
    netrunners_agregados = [V, Panam, Silverhand]
    faixapreta = Facao("FAIXA PRETA", netrunners_agregados)
    faixapreta.comandar_hack()
