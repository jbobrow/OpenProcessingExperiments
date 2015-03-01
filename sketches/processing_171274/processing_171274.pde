
/* Jesús C González
 Práctica Arrays
 Multiplication
 2014 */

/* @pjs preload="multiplication1.png"; 
 @pjs preload="multiplication2.png"; 
 @pjs preload="multiplication3.png"; 
 @pjs preload="multiplication4.png"; 
 */

PImage cara, ojo1, ojo2, boca;
float anchoojo1 = 173;
float altoojo1 = 130;
float anchoojo2 = 127;
float altoojo2 = 98;
float anchoboca = 185;
float altoboca = 118;

int unidades = 10;

//posiciones ojo1
float[] posicionesX = new float[unidades];
float[] posicionesY = new float[unidades];
float[] velocidadesX = new float[unidades];
float[] velocidadesY = new float[unidades];
//posiciones ojo2
float[] posicionesX2 = new float[unidades];
float[] posicionesY2 = new float[unidades];
float[] velocidadesX2 = new float[unidades];
float[] velocidadesY2 = new float[unidades];
//posiciones boca
float[] posicionesX3 = new float[unidades];
float[] posicionesY3 = new float[unidades];
float[] velocidadesX3 = new float[unidades];
float[] velocidadesY3 = new float[unidades];

void setup () {
  size(800, 800);

  cara= loadImage("multiplication1.png");
  ojo1= loadImage("multiplication2.png");
  ojo2= loadImage("multiplication3.png");
  boca= loadImage("multiplication4.png");


  for ( int i = 0; i<unidades; i++) {
    posicionesX[i] = width/2;
    posicionesY[i] = height/2.66;
    velocidadesX[i] = random(1, 3);
    velocidadesY[i] = random(1, 3);

    posicionesX2[i] = width/1.15;
    posicionesY2[i] = height/2.9;
    velocidadesX2[i] = random(2, 5);
    velocidadesY2[i] = random(2, 5);

    posicionesX3[i] = width/1.38;
    posicionesY3[i] = height/1.47;
    velocidadesX3[i] = random(-1, 4);
    velocidadesY3[i] = random(-1, 4);
  }
}

void draw () {
  imageMode(CORNER);
  image (cara, 0, 0);
  println(mouseX, mouseY);

  for ( int i = 0; i<unidades; i++) {
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];
    posicionesX2[i] += velocidadesX2[i];
    posicionesY2[i] += velocidadesY2[i];
    posicionesX3[i] += velocidadesX3[i];
    posicionesY3[i] += velocidadesY3[i];

    if ((posicionesX[i]-anchoojo1/2<0)||(posicionesX[i]+anchoojo1/2>width)) {
      velocidadesX[i] = -velocidadesX[i];
    }

    if ((posicionesY[i]-altoojo1/2<0)||(posicionesY[i]+altoojo1/2>height)) {
      velocidadesY[i] = -velocidadesY[i];
    }

    if ((posicionesX2[i]-anchoojo2/2<0)||(posicionesX2[i]+anchoojo2/2>width)) {
      velocidadesX2[i] = -velocidadesX2[i];
    }

    if ((posicionesY2[i]-altoojo2/2<0)||(posicionesY2[i]+altoojo2/2>height)) {
      velocidadesY2[i] = -velocidadesY2[i];
    }

    if ((posicionesX3[i]-anchoboca/2<0)||(posicionesX3[i]+anchoboca/2>width)) {
      velocidadesX3[i] = -velocidadesX3[i];
    }

    if ((posicionesY3[i]-altoboca/2<0)||(posicionesY3[i]+altoboca/2>height)) {
      velocidadesY3[i] = -velocidadesY3[i];
    }
  }

  for ( int i = 0; i<unidades; i++) {
    imageMode(CENTER);
    image (ojo1, posicionesX[i], posicionesY[i]);
    image (ojo2, posicionesX2[i], posicionesY2[i]);
    image (boca, posicionesX3[i], posicionesY3[i]);
  }
}
void mousePressed() {
  for (int i = 0; i<unidades; i++) {
    posicionesX[i] = width/2;
    posicionesY[i] = height/2.66;
    velocidadesX[i] = random(1, 3);
    velocidadesY[i] = random(1, 3);

    posicionesX2[i] = width/1.15;
    posicionesY2[i] = height/2.9;
    velocidadesX2[i] = random(2, 5);
    velocidadesY2[i] = random(2, 5);

    posicionesX3[i] = width/1.38;
    posicionesY3[i] = height/1.47;
    velocidadesX3[i] = random(-1, 4);
    velocidadesY3[i] = random(-1, 4);
  }
}



