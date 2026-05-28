import wollok.game.*

class Mercado {
    var property position
    var property image = "market.png"
    var monedas = 0  // Arranca con un buen pozo de plata
    const property mercaderia = [] // Arranca vacío, acá vas a ir metiendo las plantas vendidas
    
    // Métodos para interactuar con el mercado
    method tienePlataSuficiente(monto) {
        return monedas >= monto
    }

    method monedas() {
      return monedas
    }

    method mercaderia() {
      return mercaderia
    }



    method validarMonedas(monto) {
      if (!self.tienePlataSuficiente(monto)) {
            self.error("El mercado no tiene fondos " + monedas.toString())
      }
    }
    
    method recibirCompra(plantas, costoTotal) {
        self.validarMonedas(costoTotal)
        monedas = monedas - costoTotal          // El mercado pierde plata
        mercaderia.addAll(plantas)              // El mercado gana los cultivos
    }

    method esMercado() {
      return true
    }
}

object fabricaMercados {
  method crearMercado(columna, fila, plataInicial) {
        return new Mercado(
            position = game.at(columna, fila), 
            monedas = plataInicial
        )
    }
}