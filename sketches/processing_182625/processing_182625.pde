
//VARIABLES GLOBALES

// dios
color c1 = color(11, 255, 0); //triangle exterior
color c2 = color(206, 48, 191); //iris
color c3 = color(255, 3, 226); //iris interior

//gran dios
color c4 = color(255, 243, 3); //triangle exterior
color c5 = color(255, 3, 70); //iris
color c6 = color(255, 36, 153); //iris interior

// degradado
color fucsia = color(245, 64, 182);
color amarillo = color(255, 247, 8);
color cDegradado1 = fucsia;
color cDegradado2 = amarillo;

float dirXmouse = 0.0;
float dirYmouse = 0.0;
float dirXpelota = 0.0;
float dirYpelota = 0.0;

//variables pelota
float xPelota = 50;
float yPelota = 50;
float velocidadX = 3;
float velocidadY = 10;

// Quien mira quien?
boolean invertirMiradas = false;

//_________________________________________________________________________

//DEGRADADO FONDO// 
void dibujarDegradado() { 
  for (int i = 0; i <= height; i = i+1) {
    float factor = float(i)/height;
    color interpolatedColor = lerpColor(cDegradado1, cDegradado2, factor);
    stroke(interpolatedColor);
    line(0, i, width, i);
  }
}

//FUNCION OJOS//
void dibujarDios(color cTrianguloExt, color cIrisExt, color cIrisInt, float invertir, boolean conIris, boolean megaDios) {

  // Triangulo exterior
  fill(cTrianguloExt);
  triangle(0, -90, -75, 50, 75, 50);

  // Triangulo interior
  fill(3, 255, 190);
  triangle(0, -83, -70, 47, 70, 47);

  // Ojo
  fill(255);
  ellipse(0, 0, 85, 50);

  if (conIris) {
    pushMatrix();

    if (invertirMiradas) {
      megaDios = !megaDios;
    }
    
    //tope de movimientos miradas
    if (megaDios) {
      translate(18.0*dirXmouse, invertir*(5.0*dirYmouse));
    } else {
      translate(18.0*dirXpelota, invertir*(5.0*dirYpelota));
    }

    // Iris exterior
    fill(cIrisExt);
    ellipse(0, 0, 39, 39);
    // Iris interior
    fill(cIrisInt);
    ellipse(0, 0, 23, 23);
    // Pupila
    fill(0);
    ellipse(0, 0, 15, 15);
    // Brillo pupila
    fill(255, 255, 255);
    ellipse(3, -2, 5, 5);

    popMatrix();
  }
}

void pelota () {
  color naranja = color(255, 135, 36);
  float medida = 60;

  xPelota = xPelota + velocidadX;
  yPelota = yPelota + velocidadY;

  noStroke();

  pushMatrix();
  translate(xPelota, yPelota);
  // Iris exterior
  fill(c2);
  ellipse(0, 0, 39, 39);
  // Iris interior
  fill(c3);
  ellipse(0, 0, 23, 23);
  // Pupila
  fill(0);
  ellipse(0, 0, 15, 15);
  // Brillo pupila
  fill(255, 255, 255);
  ellipse(3, -2, 5, 5);
  popMatrix();

  if (yPelota >=height-medida/2 || yPelota <=medida/2) {
    velocidadY = -velocidadY;
  }
  if (xPelota >=width-medida/2 || xPelota <=medida/2) {
    velocidadX = -velocidadX;
  }
}

//------------------------------------------------------------//

void mousePressed() {
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  c3 = color(random(255), random(255), random(255));
  c4 = color(random(255), random(255), random(255));
  c5 = color(random(255), random(255), random(255));
  c6 = color(random(255), random(255), random(255));
  cDegradado1 = color(random(255), random(255), random(255));
  cDegradado2 = color(random(255), random(255), random(255));
  invertirMiradas = !invertirMiradas;
}

//------------------------------------------------------------//

void setup() {
  // Canvas size
  size(640, 603);
}

//------------------------------------------------------------//


void draw() {

  //OJOS SIGUEN MOUSE
  dirXmouse = -1.0 + 2.0*mouseX/width;
  dirYmouse = -1.0 + 2.0*mouseY/height;
  
    //OJOS SIGUEN PELOTA
  dirXpelota = -1.0 + 2.0*xPelota/width;
  dirYpelota = -1.0 + 2.0*yPelota/height;

  dibujarDegradado();


  //COLOCACION OJOS EN LINEAS//
  noStroke();

  // Fila 1: 1
  pushMatrix();
  translate(80, 100);
  dibujarDios(c1, c2, c3, 1.0,true, false);
  popMatrix();

  // Fila 1: 1b
  pushMatrix();
  translate(160, 59);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,true, false);
  popMatrix();

  // Fila 1: 2
  pushMatrix();
  translate(240, 100);
  dibujarDios(c1, c2, c3, 1.0,true, false);
  popMatrix();

  // Fila 1: 2b
  pushMatrix();
  translate(320, 59);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,false, false);
  popMatrix();

  // Fila 1: 3
  pushMatrix();
  translate(400, 100);
  dibujarDios(c1, c2, c3, 1.0,true, false);
  popMatrix();

  // Fila 1: 3b
  pushMatrix();
  translate(480, 59);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,true, false);
  popMatrix();

  // Fila 1: 4
  pushMatrix();
  translate(560, 100);
  dibujarDios(c1, c2, c3, 1.0,true, false);
  popMatrix();

  // Fila 2: 1
  pushMatrix();
  translate(80, 210-5);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,true, false);
  popMatrix();

  // Fila 2: 1b
  pushMatrix();
  translate(160, 250-5);
  dibujarDios(c1, c2, c3, 1.0,true, false);
  popMatrix();

  // Fila 2: 2
  pushMatrix();
  translate(240, 210-5);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,true, false);
  popMatrix();

  // Fila 2: 3
  pushMatrix();
  translate(400, 210-5);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,true, false);
  popMatrix();

  // Fila 2: 3b
  pushMatrix();
  translate(480, 250-5);
  dibujarDios(c1, c2, c3, 1.0,true, false);
  popMatrix();

  // Fila 2: 4
  pushMatrix();
  translate(560, 210-5);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,true, false);
  popMatrix();

  // Fila 3: 1
  pushMatrix();
  translate(160, 360-10);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,true, false);
  popMatrix();

  // Fila 3: 2
  pushMatrix();
  translate(480, 360-10);
  scale(1, -1);
  dibujarDios(c1, c2, c3, -1.0,true, false);
  popMatrix();

  //EL PURO DIOS QUE TE JUZGA
  pushMatrix();
  translate(320, 440);
  scale(3.07);
  dibujarDios(c4, c5, c6, 1.0, true, true);
  popMatrix();

  pelota();
}

