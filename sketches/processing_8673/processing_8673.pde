
//ejercicio: cuadro Mondrian
size(330, 500);
background(234, 230, 227);

//rectangulo rojo
stroke(220, 15, 32); //color de linia
fill(220, 15, 32); //color de relleno
rect(0, 0, 65, 105); //coordenada x, coordenada y, ancho, alto

//rectangulo amarillo
stroke(255, 216, 61); 
fill(255, 216, 61);
rect(0, 355, 65, 105); //el centro del rectangulo es su vertice superior izquierdo

//rectangulo azul
stroke(5, 40, 80); 
fill(5, 40, 80);
rect(285, 455, 45, 45);

//linia negra vertical langa
stroke(0);
fill(0);
rect(65, 0, 5, height);

//linia negra horizontal larga 1a
stroke(0);
fill(0);
rect(0, 105, width, 5);

//linia negra horizontal corta
stroke(0);
fill(0);
rect(0, 355, 65, 5);

//linia negra horizontal larga 2a
stroke(0);
fill(0);
rect(0, 455, width, 5);

//linia negra vertical corta
stroke(0);
fill(0);
rect(285, 455, 5, 45);


