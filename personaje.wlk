import materiales.*
import cultivos.*
import wollok.game.*
import direcciones.*


object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const property mochila = []
	var oroAcumulado = 0
	//Getter

	method mochila() {
	  return mochila
	}

	method oroAcumulado() {
	  return oroAcumulado
	}

	method setOro(nuevoValor) {
	  oroAcumulado = nuevoValor
	}

	method hayPlanta() {
	  return game.colliders(self).any({cultivo => cultivo.esPlanta()}) 
	}

	method validarCosecha() {
	  if (!self.hayPlanta()) {
		self.error("No hay nada que cosechar")
	  }
	}
	
	method validarSiembra() {
	  if (self.hayPlanta()) {
		self.error("No se puede sembrar, ya hay planta")
	  }
	}

	method cantidadOroYPlanta() {
	   game.say(self, "Tengo " +  oroAcumulado.toString() +  " de oro acumulado y " +  mochila.size().toString() +  " plantas para vender")
	}
	
	// Setter
	method sembrarMaiz() {
		self.validarSiembra()
		spawnCultivo.plantarMaiz(position)
		game.removeVisual(self)
		game.addVisual(self)
		

	}

	

	method sembrarTrigo() {
	  self.validarSiembra()
	  spawnCultivo.plantarTrigo(position)
	  game.removeVisual(self)
	  game.addVisual(self)
	}

	method sembrarTomaco() {
	  self.validarSiembra()
	  spawnCultivo.plantarTomaco(position)
	  game.removeVisual(self)
	  game.addVisual(self)
	}

	method regar() {
	  game.colliders(self).forEach({ cultivo => cultivo.esRegado() })
	}

	method cosechar() {
	  self.validarCosecha()
	  game.colliders(self).forEach({cultivo => cultivo.esCosechado()
	  										   mochila.add(cultivo)})
	}

	method sumarOro(cantidad) {
	  oroAcumulado += cantidad
	}

	method vender() {
	  const mercadoAbajo = game.colliders(self).filter({ obj => obj.esMercado()})
	  const totalParaVender = mochila.sum({cultivo => cultivo.valorVenta()})
	  if (!mercadoAbajo.isEmpty()) {
		mercadoAbajo.first().recibirCompra(mochila,totalParaVender)
		oroAcumulado += totalParaVender
		mochila.clear()
								  
	  }
	  else {
		self.error("No hay mercado para vender")
	  }
	  
	}

	method infoMercado() {
	  const mercadoAbajo = game.colliders(self).filter({ obj => obj.esMercado()})
	  const mercado = mercadoAbajo.first()
	  if (!mercadoAbajo.isEmpty()) {
		game.say(mercado, "Tengo " + mercado.monedas().toString() + " monedas y tambien " + mercado.mercaderia().toString() + " de mercaderia" )
								  
	  }
	}

	method mover(direccion) {
		const nuevaPosition = direccion.siguiente(position) 
		position = nuevaPosition 
	}

	method colocar(objeto) {
	  objeto.colocar(position)
	}

	method esPlanta() {
	  return false
	}

	
}