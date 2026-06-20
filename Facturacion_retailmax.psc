Algoritmo Facturación_Retailmax
	Repetir
		Escribir "Codigo del producto (0 para finalizar):"
		Leer codigo
		Si codigo <> "0" Entonces
			Escribir "Nombre del producto: "
			leer nombre
			Escribir "Ingrese la cantidad requerida: "
			leer cantidad
			Escribir "Precio Unitario: "
			leer precioUnitario
			//Calcular el subtotal del Producto
			subtotalProducto = CalcularSubtotal(cantidad, precioUnitario)
			totalBruto = totalBruto + subtotalProducto
			numProductos = numProductos + 1
			//Mostrar el subtotal
			Escribir "Subtotal: S/ " subtotalProducto
		FinSi
	Hasta Que codigo = "0"
	montoDescuento = CalcularDescuento(totalBruto)
	montoIGV = CalcularIGV(totalBruto - montoDescuento)
	totalFinal = (totalBruto - montoDescuento) + montoIGV
	//Mostrar los resutados
	MostrarTicket(numProductos, totalBruto, montoDescuento, montoIGV, totalFinal)
FinAlgoritmo

Funcion subtotal <- CalcularSubtotal(_cantidad, _precio)
	subtotal = _cantidad * _precio
FinFuncion

Funcion descuento <- CalcularDescuento (montoTotal)
	//Reglas del negocio
	Si montoTotal > 300 Entonces
		descuento = montoTotal * 0.10
	SiNo
		Si montoTotal > 150 Entonces
			descuento = montoTotal * 0.05
		SiNo
			descuento = 0
		FinSi
	FinSi
FinFuncion

Funcion igv <- CalcularIGV(monto)
	igv = monto * 0.18	
FinFuncion

Funcion MostrarTicket(numProductos, totalBruto, montoDescuento, montoIGV, totalFinal)
	Escribir "======================================================"
	Escribir "=============TICKET DE COMPRA - RETAILMAX============="
	Escribir "======================================================"
	Escribir "Productos Comprados: " numProductos
	Escribir "Subtotal Bruto: S/ " totalBruto
	Escribir "Descuento Aplicado: S/ " montoDescuento
	Escribir "IGV (18%): S/ " montoIGV
	Escribir "------------------------------------------------------"
	Escribir "TOTAL A PAGAR: S/ " totalFinal
FinFuncion