import wollok.game.*
import personaje.*


class Maiz {
	 var property position 
	 var property image = "corn_baby.png"   

   method esRegado() {
     
   }

   method esCosechado() {
     
   }
}

class Trigo {
  var property position 
  var property image = "wheat_0.png"
  var evolucion = 0 
  
  method evolucion() {
	evolucion += 1
  }

  method esRegado() {
    
  }

  method esCosechado() {
    
  }
}

class Tomaco {
  var property position
  var property image = "tomaco_baby.png"

  method esRegado() {
    
  }

  method esCosechado() {
    
  }
}

object spawnCultivo {
  
  method plantarMaiz(positionP) {
   const maiz = new Maiz (position = positionP)
   game.addVisual(maiz)
  }

  method plantarTrigo(positionP) {
    const trigo = new Trigo (position = positionP)
    game.addVisual(trigo)
  }

  method plantarTomaco(positionP) {
    const tomaco = new Tomaco (position = positionP)
    game.addVisual(tomaco)
  }

}

