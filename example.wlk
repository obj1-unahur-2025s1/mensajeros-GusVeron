object empresa {
  var empleados = #{}

  method contratar(empleado) {
    empleados.add(empleado)
  }
  method despedir(empleado) {
    empleados.remove(empleado)
  }
  method despedirATodos() {
    empleados.clear()
  }
  method esGrande() = empleados.size() > 2
  method entregadoPorElPrimero(envio) = envio.puedeSerEntregadoPor(empleados.asList().first())
  method pesoDelUltimo() = empleados.asList().last().peso()
}

object roberto {
  var vehiculo = null
  var peso = 70

  method aumentarPeso(incremento) {
    peso += incremento
  }
  method adelgazarPeso(decremento) {
    peso -= decremento
  }
  method peso() = peso + vehiculo.peso()
  method vehiculo(nuevoVehiculo) {
    vehiculo = nuevoVehiculo
  }
  method puedeLlamar() = false
}

object chuck {
  method peso() = 60
  method puedeLlamar() = true
}

object neo {
  var tieneCredito = false

  method peso() = 0
  method puedeLlamar() = tieneCredito

  method cargarCredito() {
    tieneCredito = true
  }
  method gastarCredito() {
    tieneCredito = false
  }
}

// Vehiculos
object bicicleta {
  method peso() = 5
}

object camion {
  var cantAcoplados = 1

  method peso() = 500 + cantAcoplados
  method agregarAcoplado() {
    cantAcoplados += 1
  }
   method quitarAcoplado() {
    cantAcoplados = 1.max(cantAcoplados - 1)
  }
}

// Paquetes
object paquete {
  var destino = null
  var estaPago = false

  method destino() = destino
  method precio() = 50

  method destino(nueviDestino) {
    destino = nueviDestino
  }
  method estaPago() = estaPago
  method pagarPaquete() {
    estaPago = true
  }

  method puedeSerEntregadoPor(mensajero) = destino.puedeLlegar(mensajero) &&
                                           self.estaPago()
}

object paquetito {
  var destino = null

  method destino() = destino

  method destino(nueviDestino) {
    destino = nueviDestino
  }
  method estaPago() = true
  method precio() = 0

  method puedeSerEntregadoPor(mensajero) = true
}

object paqueton {
  var destinos = #{}
  var montoPago = 0

   method precio() = 100 * destinos.size()

   method pagar(monto) {
     montoPago = (montoPago + monto).min(self.precio())
   } 
   method estaPago() {
    return montoPago == self.precio()
    }
   method puedeSerEntregadoPor(mensajero) = self.estaPago() && destinos.all({d => d.puedeLlegar(mensajero)}
   )
}

// Destinos
object blooklyn {
  method puedeLlegar(mensajero) = mensajero.peso() <= 1000
}

object matrix {
  method puedeLlegar(mensajero) = mensajero.puedeLlamar()
}