class Predio {
    const rutinas
    const maximoCaloriasTranqui = 500

    method caloriasTotales(tiempo){
        return rutinas.sum({r => r.caloriasQueQuema(tiempo)})
    }

    method esTranqui(tiempo){
        return rutinas.any({r => r.caloriasQueQuema(tiempo) < maximoCaloriasTranqui})
    }

    method rutinaMasExigente(tiempo){
        return rutinas.sortedBy({
            r1, r2 => r1.caloriasQueQuema(tiempo) > r2.caloriasQueQuema(tiempo)
        }).first()
    }
}

class Club {
    const predios

    method mejorPredio(persona){
        const tiempo = persona.tiempoQueEjercita()
        return predios.sortedBy({
            p1, p2 => p1.caloriasTotales(tiempo) > p2.caloriasTotales(tiempo)
        }).first()
    }
    
    method prediosTranquis(persona){
        const tiempo = persona.tiempoQueEjercita()
        return predios.filter({p => p.esTranqui(tiempo)})
    }

    method rutinasMasExigentes(persona){
        const tiempo = persona.tiempoQueEjercita()
        return predios.map({p => p.rutinaMasExigente(tiempo)})
    }
}