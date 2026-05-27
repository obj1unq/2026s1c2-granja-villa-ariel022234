import wollok.game.*
import personaje.*


class Maiz {
	 var property position 
	 var property image = "corn_baby.png"   
   var property esBebe = true 

   method esRegado() {
     if (esBebe) {
      image = "corn_adult.png"
      esBebe = false
     }
   }

   method esPlanta() {
     return true
   }

   method esCosechado() {
     if (!esBebe) {
      game.removeVisual(self)
     }
   }

   method esVendido(personaje) {
     personaje.sumarOro(150)
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
    if (evolucion == 0) {
      image = "wheat_1.png"
      self.evolucion()
    }
    else if (evolucion == 1) {
      image = "wheat_2.png"
      self.evolucion()
    }
    else if (evolucion == 2) {
      image = "wheat_3.png"
      self.evolucion()
    }
    else {
      image = "wheat_0.png"
      evolucion = 0
    }
  }

  method esPlanta() {
     return true
   }

  method esCosechado() {
    if (evolucion >= 2) {
        game.removeVisual(self)
    }
  }

  method esVendido(personaje) {
    if (evolucion == 2) {
      personaje.sumarOro(200)
    }
    else if (evolucion == 3) {
      personaje.sumarOro(300)
    }
    else {
      personaje.sumarOro(0)
    }
  }
}

class Tomaco {
  var property position
  var property image = "tomaco_baby.png"

  method esRegado() {
    if (position.y() == game.height() - 1) {
        position = position.down(9)
        
    } else {
        
        position = position.up(1)
        
    }

  }

  method esPlanta() {
     return true
   }

  method esCosechado() {
    game.removeVisual(self)
  }

  method esVendido(personaje) {
    personaje.sumarOro(80)
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

