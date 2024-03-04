Algoritmo sistema_de_costos
	
	//Definir variables
	Definir nombre_prod como cadena
	Definir precio_original Como Real
	
	//Crear arreglo para el nombre de los productos y sus precios respectivos
	Dimension nombre_prod[4]
	nombre_prod[1] = "Zapatillas deportivas"
	nombre_prod[2] = "Zapatillas casuales"
	nombre_prod[3] = "Zapatos de seguridad"
	nombre_prod[4] = "Zapatos formales"
	
	Dimension precios_prod[4]
	precios_prod[1] = 100
	precios_prod[2] = 80
	precios_prod[3] = 120
	precios_prod[4] = 200
	
	Escribir "Productos disponibles:"
	Definir cont Como Entero
	cont=1
	
	Mientras cont <= 4
		Escribir  cont,"- " ,nombre_prod[cont]," $",precios_prod[cont]
		cont = cont + 1
	FinMientras
	
	
	Definir indice Como Entero
	escribir "Indique en índice del producto que desea."
	leer indice
	
	si indice = 1
		Escribir "Producto seleccionado: ",nombre_prod[1]
		Escribir "Precio orignal por unidad: $",precios_prod[1]
		precio_original = 100
	FinSi
	si indice = 2
		Escribir "Producto seleccionado: ",nombre_prod[2]
		Escribir "Precio orignal por unidad: $",precios_prod[2]
		precio_original = 80
	FinSi
	si indice = 3
		Escribir "Producto seleccionado: ",nombre_prod[3]
		Escribir "Precio orignal por unidad: $",precios_prod[3]
		precio_original = 120
	FinSi
	si indice = 4
		Escribir "Producto seleccionado: ",nombre_prod[4]
		Escribir "Precio orignal por unidad: $",precios_prod[4]
		precio_original = 200
	FinSi
		
	
	//cupon de descuento
	
	definir precio_con_descuento como real

	definir tiene_cupon Como caracter
	Escribir "¿Posee cupon de descuento?(si/no)"
	Leer tiene_cupon 
	
	si tiene_cupon = "si" 
		Escribir "Descuento del 10%!"
		precio_con_descuento = precio_original - (precio_original * 0.1)
	FinSi 
	
	si tiene_cupon = "no" 
		Escribir "No tiene descuento :( "
		precio_con_descuento = precio_original
	FinSi
	
	

	//impuestos(IVA) ,supone que este impuesto es siempre %12
	
	definir precio_con_iva Como Real
	precio_con_iva = precio_con_descuento * 1.12 
	
	
	
	//descuento por cantidad
	
	Definir precio_x_cantidad Como Real
	Definir cantidad Como Entero
	Escribir "Indique la cantidad del producto a llevar"
	leer cantidad
	
	si cantidad = 1 
		descuento_cantidad = precio_con_iva
		escribir "No tiene descuento"
	FinSi
	si cantidad = 2
		Escribir "Descuento 5%!"
		precio_x_cantidad = precio_con_iva - (precio_con_iva * 0.05)
	FinSi
	si cantidad > 2
		Escribir "Descuento 10%!"
		precio_x_cantidad = precio_con_iva - (precio_con_iva * 0.1)
	FinSi
	
	
	
	//calculo costo de envio
	
	//costo fijo
	Definir costo_fijo como real
	costo_fijo = 10
	
	//peso del paquete
	//defino que todos los paquetes de los productos pesan 1.5 kg por si solos,si se pide una cantidad mayor que 1, se le suma el mismo peso
	
	definir peso_paquete Como Real
	peso_paquete = 1.5
	definir i Como Entero
	i = 1
	Mientras i < cantidad
		peso_paquete = peso_paquete + 1.5
		i = i + 1
	FinMientras
	Escribir "El peso del paquete es, ",peso_paquete,"kg,ya que lleva, ",cantidad," productos."
	
	//destino de envio
	Definir lugar_de_envio Como Caracter
	escribir "Destino de envio nacional o internacional"
	leer lugar_de_envio
	
	//costo total del envio
	si lugar_de_envio = "nacional"
		costo_envio = peso_paquete + costo_fijo
		Escribir "El costo de envio del paquete es:$",costo_envio," envio nacional"
	FinSi
	si lugar_de_envio = "internacional"
		costo_envio = (peso_paquete * 2) + costo_fijo
		Escribir "El costo de envio del paquete es:$",costo_envio," envio internacional"
	FinSi
	
	
	//calcular costo final
	
	definir precio_final Como Real
	precio_final = (precio_x_cantidad * cantidad) + costo_envio
	
	//todos los calculos requeridos
	Escribir "Precio original del producto: $",precio_original
	Escribir "Precio con descuento: $",precio_con_descuento
	Escribir "Precio con impuestos(IVA 12%): $",precio_con_iva
	Escribir "Precio descuento por cantidad: $",precio_x_cantidad
	Escribir "Costo del envio: $",costo_envio
	Escribir "Costo final del pedido: $",precio_final


FinAlgoritmo
