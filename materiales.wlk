import wollok.game.*
import cultivos.*
import personaje.*




class Aspersor {
  var property position 
  const property image = "aspersor.png"  

  method initialize() {
    game.onTick(1000, "aspersor_tick_" + self.identity().toString(), {self.regarAlRededor()})
  }

  method regarArriba() {
    const hayPlantaArriba = game.getObjectsIn(position.up(1)).any({cosa => cosa.esPlanta()})
    const soloPlantas = game.getObjectsIn(position.up(1)).filter({cosa => cosa.esPlanta()})
    if (hayPlantaArriba) {
      soloPlantas.forEach({planta => planta.esRegado()})
    }
    }
  
  method regarABajo() {
    const hayPlantaABajo = game.getObjectsIn(position.down(1)).any({cosa => cosa.esPlanta()})
    const soloPlantas = game.getObjectsIn(position.down(1)).filter({cosa => cosa.esPlanta()})
    if (hayPlantaABajo) {
      soloPlantas.forEach({planta => planta.esRegado()})
    }
    }
  
  method regarLeft() {
    const hayPlantaLeft = game.getObjectsIn(position.left(1)).any({cosa => cosa.esPlanta()})
    const soloPlantas = game.getObjectsIn(position.left(1)).filter({cosa => cosa.esPlanta()})
    if (hayPlantaLeft) {
      soloPlantas.forEach({planta => planta.esRegado()})
    }
    }

  method regarRight() {
    const hayPlantaRight = game.getObjectsIn(position.right(1)).any({cosa => cosa.esPlanta()})
    const soloPlantas = game.getObjectsIn(position.right(1)).filter({cosa => cosa.esPlanta()})
    if (hayPlantaRight) {
      soloPlantas.forEach({planta => planta.esRegado()})
    }
    }
   

   method regarAlRededor() {
     self.regarArriba()
     self.regarABajo()
     self.regarLeft()
     self.regarRight()
   }


}

object newAspersor {
  method colocar(positionP) {
    const nuevoAspersor = new Aspersor (position = positionP)
    game.addVisual(nuevoAspersor)
  }
}