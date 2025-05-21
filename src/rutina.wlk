class Rutina {
    const caloriasBase = 100

    method descanso(tiempoEjercitado)
    method intensidad()

    method caloriasQueQuema(tiempo){
        return caloriasBase * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }
}

class Running inherits Rutina {
    const property intensidad

    const tiempoEjercicioLargo = 20
    const descansoCorto = 2
    const descansoLargo = 5
    
    method esEjercicioLargo(tiempo){
        return tiempo > tiempoEjercicioLargo
    }

    override method descanso(tiempoEjercitado){
        return if(self.esEjercicioLargo(tiempoEjercitado)) {
            descansoLargo
        }
        else {
            descansoCorto
        }
    }
}

class Maraton inherits Running {
    const multiplicadorDeCalorias = 2

    override method caloriasQueQuema(tiempo){
        return super(tiempo) * multiplicadorDeCalorias
    }
}

class Remo inherits Rutina {
    const descansoPorTiempo = 5

    override method intensidad() = 1.3
    override method descanso(tiempo) = tiempo / descansoPorTiempo
}

class RemoCompeticion inherits Remo {
    const descansoMinimo = 2
    const descansoMenos = 3

    override method intensidad() = 1.7
    override method descanso(tiempo) {
        return (super(tiempo) - descansoMenos).max(descansoMinimo)
    }
}