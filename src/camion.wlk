import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.cambiar()
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method pesoTotal() {
		return (1000 + self.pesoDeLasCosas())
	}
	
	method pesoDeLasCosas() {
		return (cosas.sum( { cosa => cosa.peso() } ))
	}
	
	method exedidoDePeso() {
		return self.pesoTotal() >= 2500
	}
	
	method objetosPeligrosos(nivel) {
		return (cosas.filter( { cosa => cosa.nivelPeligrosidad() > nivel } ))
	}
	
	method objetosMasPeligrososQue(cosa) {
		return (cosas.filter( { cosa2 => cosa2.nivelPeligrosidad() > cosa.nivelPeligrosidad() } ))
	}
	
	method puedeCircularEnRuta(nivel) {
		return (self.objetosPeligrosos(nivel).isEmpty())
	}
	
	method tineAlgoQuePesaEntre(min, max) {
		return (cosas.any { cosa => cosa.peso().between(min, max) } )
	}
	
	method cosaMasPesada() {
		return (cosas.max { cosa => cosa.peso() } )
	}
	
	method totalBultos() {
		return (cosas.sum { cosa => cosa.cantBultos() } )
	}
	
	method pesos() {
		return (cosas.map { cosa => cosa.peso() } )
	}
}
