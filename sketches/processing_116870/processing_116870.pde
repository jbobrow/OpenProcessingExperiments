
void setup() {
  size(540, 720);
  background(#55A2E6);
}

void draw() {

  //Esto es la cara
  fill(#FFAF00);
  noStroke();
  //Cuadrado para la parte superior
  quad(135, 225, 405, 225, 405, 450, 135, 450);
  //Cuadrado para la paste inferior (en medio de los triangulos)
  quad(225, 450, 225, 540, 315, 540, 315, 450);
  //Parte inferior, triangulos, primero izquierda despues derecha
  triangle(135, 450, 225, 540, 225, 450);
  triangle(405, 450, 315, 540, 315, 450);
  
  //Esto son las lineas del contorno de la cara
  stroke(#000000);
  line(135, 225, 135, 450);
  line(405, 225, 405, 450);
  line(135, 450, 225, 540);
  line(315, 540, 405, 450);
  line(225, 540, 315, 540);
  line(270, 540, 270, 517.5);
  
  //Estos son los ojos, izquierdo primero, derecho segundo
  stroke(#000000);
  fill(#FFFFFF);
  ellipse(202.5, 315, 78.75, 35);
  ellipse(337.5, 315, 78.75, 35);

  //Esta sección es el interior de los ojos
  fill(#00FF00);
  //Esto es el iris, izquierdo primero, derecho segundo
  ellipse(202.5, 315, 30, 30);
  ellipse(337.5, 315, 30, 30);
  //Esto es la pupila, izquierda primera, derecha segunda
  fill(#000000);  
  ellipse(202.5, 315, 10, 15);
  ellipse(337.5, 315, 10, 15);

 
  //Esta sección son las cejas
  stroke(#000000);
  noFill();
  strokeWeight(7); //Cambiar tamaño grosor borde
  strokeCap(SQUARE); //Redondear las esquinas del borde
  //Ceja izquierda, primero parte izquierda, despues derecha
  arc(202.5, 295, 78.75, 35, TWO_PI-PI/2, TWO_PI);
  arc(202.5, 295, 78.75, 35, PI, TWO_PI-PI/2);
  //Ceja derecha, primero parte izquierda, despues derecha
  arc(337.5, 295, 78.75, 35, TWO_PI-PI/2, TWO_PI);
  arc(337.5, 295, 78.75, 35, PI, TWO_PI-PI/2);
  strokeWeight(1); //Cambiar tamaño grosor borde
  
  
  //Esta sección es la boca
  fill(#FF0000);
  arc(270, 450, 150, 80, PI-PI, PI);

  /*Esta sección es la nariz, primera linia la 
  nariz entera, segunda y tercera linia los agujeros*/
  fill(#FFAF00);
  arc(270, 400, 60, 60, TWO_PI-PI, TWO_PI);
  
  fill(#000000);
  arc(255, 400, 15, 15, TWO_PI-PI, TWO_PI);
  arc(285, 400, 15, 15, TWO_PI-PI, TWO_PI);
 
  //Esta sección son las orejas
  fill(#FFAF00);
  //Oreja izquierda, parte de arriba
  arc(135, 325, 60, 112.5, PI, TWO_PI-PI/2);  
  //Oreja izquierda, parte de abajo
  arc(135, 325, 60, 112.5, PI/2, PI);
  //Oreja derecha, parte de arriba
  arc(406, 325, 60, 112.5, TWO_PI-PI/2, TWO_PI);
  //Oreja derecha, parte de abajo  
  arc(406, 325, 60, 112.5, 0, PI/2);
 
  /*Esto son las lineas de las orejas, 
  primero las de la izquierda y despues las de la derecha*/
  arc(130, 325, 30, 70, PI, TWO_PI-PI/2);  
  arc(130, 325, 30, 70, PI/2, PI);
  arc(125, 348, 15, 15, TWO_PI-PI/2, TWO_PI);
  arc(125, 348, 15, 15, 0, PI/2);

  arc(411, 325, 30, 70, TWO_PI-PI/2, TWO_PI);
  arc(411, 325, 30, 70, 0, PI/2);  
  arc(416, 345, 15, 15, PI, TWO_PI-PI/2);
  arc(416, 345, 15, 15, PI/2, PI);
  
  //Esta sección es el pelo
  fill(#000000);
  triangle(150, 173, 120, 290, 190, 222);
  triangle(190, 222, 162, 188, 225, 148);
  triangle(200, 265, 275, 225, 175, 222);
  triangle(188, 225, 225, 148, 275, 225);
  triangle(220, 200, 295, 269, 295, 160);
  triangle(295, 160, 343, 237, 295, 269);
  triangle(343, 237, 309, 210, 341, 166);
  triangle(343, 237, 381, 263, 341, 166);
  triangle(150, 173, 120, 290, 190, 222);
  triangle(381, 263, 394, 177, 355, 199);
  triangle(418, 290, 394, 177, 381, 263);
}


