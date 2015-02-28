
size(200,200);           			 // tamano ventana
background(100,100,450);   		 // color fondo
stroke(255);              			// color borde (stroke)
fill(229,241,32);        			// RGB - color relleno
ellipseMode(CENTER);        		 // ubicacion elipse en ventana, probar con rectangulo rect
//cambiar cada termino ellipse
ellipse(100,100,100,50);     		// dibujar rectangulo  (x loc, y loc, ancho, alto)

					// Dibujar 6 lineas
stroke(255);
line( 75, 80, 75, 60);
line(100, 80,100, 60);
line(125, 80,125, 60);
line( 75,120, 75,140);
line(100,120,100,140);
line(125,120,125,140);

					// Dibujar 2 rectangulos, ojos
fill(255);
rectMode(CENTER);
rect(150,90,4,8);
rect(150,110,4,8);


