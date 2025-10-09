Exercicio 1:
using System;
public class MembroDaSociedade{

    public string Nome { get; private set; }
    public string Raca { get; private set; }
    public string Funcao { get; private set; }

    public MembroDaSociedade(string nome, string raca, string funcao){
        this.Nome = nome;
        this.Raca = raca;
        this.Funcao = funcao;
    }
    public void Descrever(){
        Console.WriteLine($"Nome: {Nome}");
        Console.WriteLine($"Raca: {Raca}");
        Console.WriteLine($"Funcao: {Funcao}");
    }
}

public class Program{
    public static void Main(string[] args){
        MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardiao");
        MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");
        aragorn.Descrever();
        legolas.Descrever();
    }  
}

Exercicio 2:
using System;
using System.Collections.Generic;

public class Pokemon{
    public string Nome { get; set; }
  
    public Pokemon(string nome){
        this.Nome = nome;
    }

    public virtual void Atacar(){
        Console.WriteLine($"{Nome} usou um ataque!");
    }
}

public class PokemonDeFogo : Pokemon{
    public PokemonDeFogo(string nome) : base(nome){
    }
    public override void Atacar(){
        Console.WriteLine($"{Nome} usou: Flare Blitz");
    }
}

public class PokemonDeAgua : Pokemon{
    public PokemonDeAgua(string nome) : base(nome){
    }

    public override void Atacar(){
        Console.WriteLine($"{Nome} usou: Aqua Jet");
    }
}

public class Program{
    public static void Main(string[] args){
        List<Pokemon> timePokemon = new List<Pokemon>();

        Pokemon charizard = new PokemonDeFogo("Charizard");
        Pokemon blastoise = new PokemonDeAgua("Blastoise");
        timePokemon.Add(charizard);
        timePokemon.Add(blastoise);

        foreach (var pokemon in timePokemon){
            pokemon.Atacar();
        }
    }
}

Exercicio 3:
using System;
using System.Collections.Generic;

class Feitico{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        Nome = nome;
    }
}

class Grimorio{
    private List<Feitico> feiticos = new List<Feitico>();

    public void AdicionarFeitico(Feitico f){
        feiticos.Add(f);
    }

    public void ListarFeiticos(){
        Console.WriteLine("Feiticos:");
        foreach (var f in feiticos)
        {
            Console.WriteLine($"- {f.Nome}");
        }
    }
}

class Ferramenta{
    public string Nome { get; set; }

    public Ferramenta(string nome){
        Nome = nome;
    }
}

class Maga{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; private set; }   
    public List<Ferramenta> Ferramentas { get; set; } 

    public Maga(string nome, List<Ferramenta> ferramentas){
        Nome = nome;
        Grimorio = new Grimorio();     
        Ferramentas = ferramentas;      
    }

    public void MostrarEquipamento(){
        Grimorio.ListarFeiticos();
        Console.WriteLine("\nFerramentas:");
        foreach (var f in Ferramentas){
            Console.WriteLine($"- {f.Nome}");
        }
    }
}

class Program{
    static void Main(string[] args){
        List<Ferramenta> ferramentas = new List<Ferramenta>{
            new Ferramenta("Flashlight"),
            new Ferramenta("Map"),
            new Ferramenta("String")
        };
        
        Maga frieren = new Maga("Frieren", ferramentas);

        frieren.Grimorio.AdicionarFeitico(new Feitico("Patronum"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Avada Kedavra"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Lumos"));
        
        frieren.MostrarEquipamento();
        Console.ReadLine();
    }
}

Exercicio 4:
using System;
using System.Collections.Generic;

public abstract class MonstroSombrio{
    public string Nome { get; set; }

    public MonstroSombrio(string nome){
        this.Nome = nome;
    }
    public virtual void Mover()
    {
        Console.WriteLine($"{Nome} tenta se mover de forma desconhecida.");
    }
}

public class Zumbi : MonstroSombrio{
    public Zumbi(string nome) : base(nome){
    }

    public override void Mover(){
        Console.WriteLine($"{Nome} (Zumbi): Se arrastando");
    }
}

public class Espectro : MonstroSombrio{
    public Espectro(string nome) : base(nome){
    }
    public override void Mover(){
        Console.WriteLine($"{Nome} (Espectro): Correndo");
    }
}

public class Program{
    public static void Main(string[] args){
        MonstroSombrio[] horda = new MonstroSombrio[2];
        horda[0] = new Zumbi("");
        horda[1] = new Espectro("");

        foreach (var monstro in horda){
            monstro.Mover();
        }
    }
}
