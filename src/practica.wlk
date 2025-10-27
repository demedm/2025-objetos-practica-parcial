class Ataque
{
    var potencia

    method potencia() = potencia

    method lanzarAtaque(enemigo)

}

class AtaqueFisico inherits Ataque
{
    override method lanzarAtaque(enemigo)
    {
        enemigo.recibirAtaqueFisico(self)
    }
}

class Hechizo inherits Ataque
{
    const elemento

    override method lanzarAtaque(enemigo)
    {
        enemigo.recibirAtaqueMagico(self)
    }
}

class Elemento 
{
    const elemento

    method calcularDaño(ataque)
    {
        if(ataque.elemento() == elemento.debilidad())
            return [ataque.potencia()*2, 0].max()
        if(ataque.elemento() == elemento)
            return 0
        return [ataque.potencia(), 0].max()
    }
}

object fuego
{
    method debilidad() = hielo
}

object hielo
{
    method debilidad() = fuego
}

object oscuridad
{
    method debilidad() = luz
}

object luz 
{
    method debilidad() = oscuridad
}

class Enemigo
{
    const raza
    var puntos_vida
    const elemento

    method recibirAtaqueMagico(ataque)
    {
        puntos_vida = puntos_vida - elemento.calcularDaño(ataque)
    }
    method recibirAtaque(ataque)
    {
        puntos_vida = puntos_vida - raza.calcularDaño(ataque)
    }    
}

class SinCorazon inherits Enemigo
{
    method calcularDaño(ataque) = [0.9*ataque.potencia(), 1].max() 

}

class Incorporeo inherits Enemigo
{
    const valor_defensa

    method calcularDaño(ataque) = [ataque.potencia() - valor_defensa, 1].max()
    
}

// EQUIPAMIENTO
object llaveDelReino {
    const poder_fisico = 3
    const poder_magico = 5
}

object exploradorEstelar {
    const poder_fisico = 2
    const poder_magico = 10 
}

object caminoAlAlba {
    const poder_fisico = 5
    const poder_magico = 3
}

object brisaDescarada {
    const poder_fisico = 5
    const poder_magico = 2
}

//HECHIZOS
object piro
{
    const elemento = fuego
    var poderBase = 5

    method poderBase() = poderBase
    method elemento() = elemento 
}

object chispa
{
    const elemento = luz
    var poderBase = 1
}

object ragnarok
{
    const elemento = luz
    var poderBase = 30
}

//HEROES
object sora {
    
}

class Heroe
{
    var fuerza
    var ptos_mana
    var equipamiento 

    method atacarEnemigoFisicamente(enemigo)
    {
        const ataque = new AtaqueFisico(potencia = fuerza+equipamiento.poderFisico())
        ataque.lanzarAtaque(enemigo)
    }
    method atacarEnemigoMagicamente(enemigo, hechizo)
    {
        const ataque = new Hechizo(potencia = hechizo.poderBase() * equipamiento.poderMagico(), 
                                elemento = hechizo.elemento())
        ataque.lanzarAtaque(enemigo)
    }

    method descanzar()
    {
        ptos_mana = 30
    }

    method equipar(llaveEspada)
    {
        equipamiento = llaveEspada
    }
}
