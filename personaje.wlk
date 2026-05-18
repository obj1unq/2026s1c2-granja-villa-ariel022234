import cultivos.*
import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	var OroAcumulado = 0



	// Getter
	method sembrarMaiz() {
		spawnCultivo.plantarMaiz(position)
		

	}

	method sembrarTrigo() {
	  spawnCultivo.plantarTrigo(position)
	}

	method sembrarTomaco() {
	  spawnCultivo.plantarTomaco(position)
	}

	method regar() {
	  game.getObjectsIn(position).forEach({cultivo => cultivo.esRegado()})
	}

	method cosechar() {
	  game.getObjectsIn(position).forEach({cultivo => cultivo.esCosechado()})
	}
}