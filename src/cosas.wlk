object knightRider {
	method peso() { return 500 }
	
	method nivelPeligrosidad() { return 10 }
	
	method cantBultos() { return 1 }
	
	method cambiar() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	method cantBultos() { return 2 }

	method cambiar() { if(transformadoEnAuto) { self.transformar() } }
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 0
	
	method agregarLadrillos(cant) {
		cantidadDeLadrillos += cant
	}
	
	method sacarLadrillos(cant) {
		if (cant > cantidadDeLadrillos) {
			cantidadDeLadrillos = 0
		}
		else { cantidadDeLadrillos -= cant }
	}
	
	method peso() { return cantidadDeLadrillos*2 }
	
	method nivelPeligrosidad() { return 2 }
	
	method cantBultos() { return cantidadDeLadrillos.div(100).roundUp() }
	
	method cambiar() { self.agregarLadrillos(12) }
}

object bateriaAntiaeria {
	var conMisiles = false
	
	method ponerOQuitarMisiles() {
		conMisiles = not conMisiles
	}
	
	method peso() { return if (conMisiles) { 300 } else { 200 } }
	
	method nivelPeligrosidad() { return if (conMisiles) { 100 } else { 0 } }
	
	method cantBultos() { return if (conMisiles) { 2 } else { 1 } }

	method cambiar() { if(not conMisiles) { self.ponerOQuitarMisiles() } }
}

object contenedorPortuario {
	var cosas = []

	method agregar(cosa) {
		cosas.add(cosa)
	}
	
	method sacar(cosa) {
		cosas.remove(cosa)
	}
	
	method peso() {
		return (100 + self.pesoDeLasCosas())
	}
	
	method pesoDeLasCosas() {
		return (cosas.sum { cosa => cosa.peso() } )
	}
	
	method nivelPeligrosidad() {
		if (cosas.isEmpty()) { 0 }
		else { cosas.max { cosa => cosa.nivelPeligrosidad() } }
	}
	
	method cantBultos() { return 1 + self.bultosDeLasCosas() }
	
	method bultosDeLasCosas() {
		return (cosas.sum { cosa => cosa.cantBultos() } )
	}
	
	method cambiar() { cosas.map { cosa => cosa.cambiar() } }	
}

object embalajeDeSeguridad {
	var envuelveA = null
	
	method envolver(cosa) {
		envuelveA = cosa
	}
	
	method peso() {
		return envuelveA.peso()
	}
	
	method nivelPeligrosidad() {
		return envuelveA.nivelPeligrosidad().div(2)
	}
	
	method cantBultos() { return 2 }

	method cambiar() {}
}

object arenaAGranel {
	var property peso = 0
	
	method agregarArena(cant) { peso += cant }
	
	method nivelPeligrosidad() { return 2 }
	
	method cantBultos() { return 1 }

	method cambiar() { self.agregarArena(20) }
}

object residuosRadiactivos {
	var property peso = 0

	method agregarResiduos(cant) { peso += cant }
	
	method nivelPeligrosidad() { return 200 }
	
	method cantBultos() { return 1 }

	method cambiar() { self.agregarResiduos(15) }
}	