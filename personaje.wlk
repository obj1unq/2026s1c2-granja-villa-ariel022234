import cultivos.*
import wollok.game.*
import direcciones.*


object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	var OroAcumulado = 0

	
	// Getter
	method sembrarMaiz() {
		spawnCultivo.plantarMaiz(position)
		game.removeVisual(self)
		game.addVisual(self)
		

	}

	method mover(direccion) {
		const nuevaPosition = direccion.siguiente(position) 
		position = nuevaPosition 
	}

	method sembrarTrigo() {
	  spawnCultivo.plantarTrigo(position)
	  game.removeVisual(self)
	  game.addVisual(self)
	}

	method sembrarTomaco() {
	  spawnCultivo.plantarTomaco(position)
	  game.removeVisual(self)
	  game.addVisual(self)
	}

	method regar() {
	  game.colliders(self).forEach({ cultivo => cultivo.esRegado() })
	}

	method cosechar() {
	  game.colliders(self).forEach({cultivo => cultivo.esCosechado()})
	}

	
}