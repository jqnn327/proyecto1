
# PROYECTO 1 ALGORITMO SISTEMA DE COSTOS

### Autor: Joaquín Anch
En este proyecto se construyó un algoritmo en pseudocódigo donde se crea una calculadora de precio de ciertos productos, donde se lee el precio original, precio con cupón de descuento, costos de envio, entre otros.

### Planteamiento del proyecto
Se tiene una tienda de calzado que vende 4 articulos. Se necesita calcular el precio final del pedido en base a los siguientes criterios:

1.Precio original del producto
2.Precio con cupón de descuento(si es que existe)
3.Precio con impuesto(IVA)
4.Precio segun la cantidad de articulos del pedido
5.Costo del envio
6.Precio final del pedido

### Solución del proyecto

Primero defino variables y los arreglos para saber cuales son los productos y sus precios


	Definir nombre_prod como cadena
	Definir precio_original Como Real
	
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

Luego muestro los productos en pantalla para que el cliente pueda observar las opciones disponibles. Esto lo hago ayudandome de los arreglos creados y un bucle, con un contador que inicializa en 1 y termina cuando llegue a 4 (criterio de comparación), que son la cantidad de productos totales.

    Escribir "Productos disponibles:"
	Definir cont Como Entero
	cont=1
	
	Mientras cont <= 4
		Escribir  cont,"- " ,nombre_prod[cont]," $",precios_prod[cont]
		cont = cont + 1
	FinMientras

1.Leer precio original

Aqui el cliente elige su producto señalando el indice de lo que se le mostró anteriormente, y segun lo que indique, se leera el nombre del producto y su precio original.

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


2.Precio con cupón de descuento(si es que existe).

Se pregunta si tiene cupon(uso de condiciones), si su respuesta es "si" se le descuenta un 10% del precio (operación aritmentica), y si es "no", el precio se mantiene.   
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

3.Precio con cupón de descuento(si es que existe).

Suponga que el impuesto es siempre un IVA de 12%

    definir precio_con_iva Como Real
	precio_con_iva = precio_con_descuento * 1.12 


4.Precio segun la cantidad de articulos del pedido.
Propuse 3 distintos casos; si solo se lleva un articulo(no hay descuento), si se lleva 2 articulos(descuento 5%), y si se lleva mas de 2(descuento 10%). Se le pregunta al cliente cuantos articulos llevara y segun su respuesta se modificará el precio.

    Definir precio_x_cantidad Como Real
	Definir cantidad Como Entero
	Escribir "Indique la cantidad del producto a llevar"
	leer cantidad
	
	si cantidad = 1 
		precio_x_cantidad = precio_con_iva
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


5.Costo del envio.
Se define el costo fijo como $10
Se supone que todos los articulos pesan 1.5 kg, por lo que si se tiene más de uno, se le va sumando el peso.
El costo por el peso lo resolvi usando un ciclo que va desde 1 hasta la cantidad de articulos que señaló el cliente.
definir peso_paquete Como Real

	peso_paquete = 1.5
	definir i Como Entero
	i = 1
	Mientras i < cantidad
		peso_paquete = peso_paquete + 1.5
		i = i + 1
	FinMientras
	Escribir "El peso del paquete es, ",peso_paquete,"kg,ya que lleva, ",cantidad," productos."

Luego se pregunta si el envio es nacional o internacional, si es internacional, hay un valor extra, que es el peso del paquete x 2, y si el envio es nacional, solo es el peso del paquete. Finalmente se le suma el costo fijo.

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


6.Precio final del pedido.
En el calculo final, se usa el ultimo precio calculado(precio por cantidad), el cual se multiplica segun la cantidad de productos que se llevan, y finalmente se le suma el costo de envio.

    definir precio_final Como Real
	precio_final = (precio_x_cantidad * cantidad) + costo_envio

### Muestra de precios
Al final del programa se muestran los valores para cada seccion trabajada

    Escribir "Precio original del producto: $",precio_original
	Escribir "Precio con descuento: $",precio_con_descuento
	Escribir "Precio con impuestos(IVA 12%): $",precio_con_iva
	Escribir "Precio descuento por cantidad: $",precio_x_cantidad
	Escribir "Costo del envio: $",costo_envio
	Escribir "Costo final del pedido: $",precio_final