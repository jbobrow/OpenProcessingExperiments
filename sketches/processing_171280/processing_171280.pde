
/* JesÃºs C GonzÃ¡lez
 PrÃ¡ctica Arrays
 Maruo
 2014 */

/* @pjs preload="maruo1.png";
 @pjs preload="maruo2.png";
 */

PImage cara, ojo1;

int unidades = 70;



float[] posicionesX = new float[unidades];
float[] posicionesY = new float[unidades];
float[] velocidadesX = new float[unidades];
float[] velocidadesY = new float[unidades];


void setup () {
  size(800, 550);

  cara= loadImage("maruo1.png");
  ojo1= loadImage("maruo2.png");



  for ( int i = 0; i<unidades; i++) {
    posicionesX[i] = width/1.93;
    posicionesY[i] = height/5;
    velocidadesX[i] = random(-3, 5);
    velocidadesY[i] = random(1, 5);
  }
}

void draw () {
  imageMode(CORNER);
  tint(255, 20); 
  image (cara, 0, 0);


  println(mouseX, mouseY);

  for ( int i = 0; i<unidades; i++) {
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];

        if (posicionesX[i]<0) {
      posicionesX[i] = width;
    }
    if (posicionesX[i]>width) {
      posicionesX[i] = 0;
    }
    if (posicionesY[i]<0) {
      posicionesY[i] = height;
    }
    if (posicionesY[i]>height) {
      posicionesY[i] = 0;
    }

    /*
   if ((posicionesX[i]<0)||(posicionesX[i]>width)) {
     velocidadesX[i] = -velocidadesX[i];
     }
     
     if ((posicionesY[i]<0)||(posicionesY[i]>height)) {
     velocidadesY[i] = -velocidadesY[i];
     }
     }
     
     */
  }

  for ( int i = 0; i<unidades; i++) {
    imageMode(CENTER);
    tint(255, 255); 

    image (ojo1, posicionesX[i], posicionesY[i]);
  }
}
void mousePressed() {
  for (int i = 0; i<unidades; i++) {
    posicionesX[i] = width/1.93;
    posicionesY[i] = height/5;
    velocidadesX[i] = random(-3, 5);
    velocidadesY[i] = random(1, 5);
  }
}


