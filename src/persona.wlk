class Persona {
    var property peso

    method kilosPorCaloria()
    method tiempoQueEjercita()
    method puedeRealizarRutina(rutina)
    method caloriasQueQuema(rutina) = rutina.caloriasQueQuema(self.tiempoQueEjercita())
    method validarRutina(rutina){
        if(!self.puedeRealizarRutina(rutina))
            self.error("No se puede realizar esta rutina")
    }
    method realizarRutina(rutina){
        self.validarRutina(rutina)
        peso -= self.kilosPerdidos(rutina.caloriasQueQuema(self.tiempoQueEjercita()))
    }
    method kilosPerdidos(calorias) = calorias / self.kilosPorCaloria()
}

class PersonaSedentaria inherits Persona {
    const tiempoQueEjercita
    const pesoMinimo = 50

    override method tiempoQueEjercita() = tiempoQueEjercita
    override method kilosPorCaloria() = 7000
    override method puedeRealizarRutina(rutina){
        return peso > pesoMinimo
    }
}

class PersonaAtleta inherits Persona {
    const perdidaExtraKilos = 1
    const tiempoQueEjercita = 90
    const caloriasMinimasQuemadas = 10000

    override method tiempoQueEjercita() = tiempoQueEjercita
    override method kilosPorCaloria() = 8000
    override method kilosPerdidos(calorias) = super(calorias) - perdidaExtraKilos
    override method puedeRealizarRutina(rutina){
        return rutina.caloriasQueQuema(self.tiempoQueEjercita()) > caloriasMinimasQuemadas
    }
}