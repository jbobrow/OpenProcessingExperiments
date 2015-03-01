
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

int unidades = 20;



float[] posicionesX = new float[unidades];
float[] posicionesY = new float[unidades];
float[] velocidadesX = new float[unidades];
float[] velocidadesY = new float[unidades];


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
  }
}

void draw () {
  imageMode(CORNER);
  image (cara, 0, 0);
  println(mouseX, mouseY);

  for ( int i = 0; i<unidades; i++) {
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];

    if ((posicionesX[i]-anchoojo1/2<0)||(posicionesX[i]+anchoojo1/2>width)) {
      velocidadesX[i] = -velocidadesX[i];
    }

    if ((posicionesY[i]-altoojo1/2<0)||(posicionesY[i]+altoojo1/2>height)) {
      velocidadesY[i] = -velocidadesY[i];
    }
  }

  for ( int i = 0; i<unidades; i++) {
    imageMode(CENTER);
    image (ojo1, posicionesX[i], posicionesY[i]);
  }
}
void mousePressed() {
  for (int i = 0; i<unidades; i++) {
    posicionesX[i] = width/2;
    posicionesY[i] = height/2.66;
    velocidadesX[i] = random(1, 3);
    velocidadesY[i] = random(1, 3);
  }
}




