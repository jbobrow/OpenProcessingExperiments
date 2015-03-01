
//TP 2 Agregar variables y control de variables con el mouse

//variable de modificacion del color
 int xcol = 0;

// void setup: lineas de codigo que no se modifican: size, background, smooth.

void setup() {
  size(600, 600);
  background(255);
  smooth();
  noStroke();
}

// Void Draw: lineas de codigo que van a ser modificadas por variables

void draw() {

  //declaracion e iniciacion de variables de color usadas en el programa
 
  color amarillo = color(249+xcol, 219+xcol, 45+xcol);
  color azulOscuro = color (37+xcol, 78+xcol, 93+xcol);
  color violeta = color (216+xcol, 69+xcol, 140+xcol);
  color azulFuerte = color (8+xcol, 62+xcol, 136+xcol);
  color crema = color (239+xcol, 221+xcol, 207+xcol);
  color celeste = color (207+xcol, 226+xcol, 234+xcol);

  //rectangulo superior derecho

  fill(amarillo);
  rect(505, 4, 95, 172);

  //rectagulo medio derecho
  fill(0);
  rect(505, 200, 95, 172);

  //rectangulo inferior derecho
  fill(azulOscuro);
  rect(505, 398, 95, 172);

  //bloque inferior violeta
  fill(violeta);
  quad(480, 398, 480, 568, 233, 555, 233, 398);

  //cuadrilatero azul fuerte inferior
  fill(azulFuerte);
  quad(219, 398, 219, 555, 150, 550, 150, 398);

  //bloque medio crema
  fill(crema);
  quad(327, 213, 327, 372, 150, 372, 150, 224);

  //bloque violeta, entre crema y negro
  fill(violeta);
  quad(419, 208, 419, 372, 353, 372, 353, 213);

  //bloque violeta, lado inferior izquierdo
  fill(violeta);
  quad(126, 224, 126, 550, 0, 575, 0, 200);

  //bloque azul superpuesto
  fill(azulFuerte);
  quad(126, 398, 126, 550, 79, 559, 79, 398);

  //parte superior

  fill(violeta);
  rect(0, 0, 327, 176);

  //bloque oscuro 
  fill(azulOscuro);
  quad(419, 14, 419, 184, 353, 189, 353, 23);

  //bloque amarillo
  fill(amarillo);
  quad(480, 4, 480, 170, 432, 153, 432, 14);

  //bloque celeste
  fill(celeste);
  quad(78, 0, 126, 0, 126, 98, 78, 103);

  //triangulo celeste
  fill(celeste);
  triangle(232, 106, 232, 138, 301, 132);

  //bloque oscuro arriba
  fill(azulOscuro);
  quad(329, 142, 329, 189, 233, 195, 233, 149);

  fill(azulOscuro);
  quad(126, 110, 126, 201, 78, 183, 78, 114);

  fill(azulOscuro);
  quad(35, 166, 35, 180, 0, 175, 0, 170);

  fill(azulOscuro);
  quad(55, 165, 55, 184, 47, 182, 47, 165);

  fill(azulOscuro);
  quad(219, 186, 219, 196, 150, 200, 150, 190);

  fill(azulOscuro);
  quad(55, 117, 55, 152, 47, 151, 47, 117);

  fill(celeste);
  quad(419, 590, 404, 596, 353, 594, 353, 585);

  fill(violeta);
  quad(329, 584, 329, 592, 234, 588, 234, 578);

  fill(azulFuerte);
  quad(219, 578, 219, 587, 150, 584, 150, 574);

  fill(azulFuerte);
  quad(219, 598, 219, 600, 150, 596, 150, 600);

  fill(violeta);
  quad(126, 591, 126, 600, 79, 600, 79, 588);

  fill(azulFuerte);
  quad(55, 590, 55, 600, 47, 600, 47, 592);

  fill(azulFuerte);
  triangle(0, 600, 33, 600, 33, 592);

  fill(violeta);
  triangle(114, 579, 126, 573, 126, 579);

  if (mousePressed) {

    if (mouseButton==LEFT) {
      xcol = 50;
    }
    else { 
      xcol = 0;
    }

    if (mouseButton==RIGHT) {
      xcol = -50;
    }
    else {
      xcol = 0;
    }
     
  }
   

  //LINEAS

  //Lineas Verticales, de derecha a izquierda

  //declaracion e iniciacion de variables de strokeWeight

  int sW1 = 13+mouseY/2;
  int sW2 = 24+mouseY/2;

  //modificacion de los espesores de las lineas verticales si el mouse se mueve sobre el eje Y

  stroke(255);

  strokeWeight(sW1);

  line(425, 0, 425, 600);

  line(225, 0, 225, 600);

  line(40, 0, 40, 600);

  strokeWeight(sW2);

  line(341, 0, 341, 600);

  line(137, 0, 137, 600);

  line(66, 0, 66, 600);

  //Linea Horizontal

  //declaracion e iniciacion de variables de strokeWeight
  int sW3 = 24+mouseX/2;

  //modificacion del espesor de la linea horizontal si el mouse se mueve sobre el eje X
  strokeWeight(sW3);
  line(0, 385, 600, 385);

  //Lineas Oblicuas

  //declaracion e iniciacion de variables de strokeWeight

  int sW4 = 13;
  int sW5 = 24;
  int sW6 = 26;


  //modificacion del espesor de las lineas oblicuas si el muose se presiona
  strokeWeight(sW4);
  if (mousePressed == true) {
    strokeWeight(sW4+10);
  }
  line(0, 45, 70, 35);
  line(0, 115, 232, 94);
  line(0, 163, 328, 135);
  line(79, 189, 428, 166);

  strokeWeight(sW5);
  if (mousePressed == true) {
    strokeWeight(sW5+10);
  }
  line(480, 184, 0, 10);
  line(145, 36, 432, 0);

  strokeWeight(sW6);
  if (mousePressed == true) {
    strokeWeight(sW6+10);
  }
  line(51, 3, 138, 38);
}



