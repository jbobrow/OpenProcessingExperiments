
int sz = 20;
int x,y;
int numKirby = 4;
int colornuevo;
float v = random(2,2);
float vy= random(2,2);
//Creamos la matriz de posiciones con el número de elementos que queremos mostrar:
float[] posicionesX = new float[numKirby];
float[] posicionesY = new float[numKirby];
//Y lo mismo para las velocidades en X e Y:
float[] velocidadesX = new float[numKirby];
float[] velocidadesY = new float[numKirby];
//También la introduciremos para el color de los ojos:


//inicio variables


void setup() {
  size (800, 600);

  //noCursor
  for (int i=0; i<numKirby; i++) {
    posicionesX[i]=random (width/2, width/2-250);
    posicionesY[i]=random (height/2, height/2-250);
    velocidadesX[i]=random(1, 4);
    velocidadesY[i]=random(1, 4);

  }
}
void draw() {
  background(0, 0, 0);

  //Inicio del bucle
  for (int i = 0; i<numKirby; i++) {
    //Restablecer las posiciones
    posicionesX[i] += random(-5, 5);
    posicionesY[i] += random (-5, 5);

    //Establecemos los límites de la ventana
    //posX:
    if (posicionesX[i]<2*10)
    {
      posicionesX[i] = 10*2;
    }
    if (posicionesX[i]>width-9*10/2)
    {
      posicionesX[i] = width-9*10/2;
    }
    //posY
    if (posicionesY[i]<2*10)
    {
      posicionesY[i] = 10*2;
    }
    if (posicionesY[i]>height-2*10)
    {
      posicionesY[i] = height-2*10;
    }



    //Establecemos el dibujo

    dibuixatot (posicionesX[i], posicionesY[i]);
  }
}
void dibuixatot(float _x, float _y) {

  //ma esquerra
  pushMatrix();
  fill(random(_x),random(_y),random(173));
  rotate(-0.3);
  ellipse(_x-190, _y, 90, 150);
  popMatrix();

  //ma dreta
  pushMatrix();
  fill(random(_x),random(100),random(173));
  rotate(0.2);
  ellipse(_x+170, _y-90, 150, 90);
  popMatrix();

  //peu esquerra
  fill(206, 0, 3);
  pushMatrix();
  translate(_x, _y);
  rotate(radians(-15));
  ellipse(-115, 110, 130, 80);
  popMatrix();

  //cos
  fill(random(_x),random(_y),random(173));
  strokeWeight(3);
  stroke(255, 0, 200, 30);
  ellipse(_x, _y, 280, 280);

  //boca
  noStroke();
  fill(219, 0, 33);
  ellipse(_x, _y+15, 30, 30);

  //peu dret
  fill(206, 0, 3);
  pushMatrix();
  translate(_x, _y);
  rotate(radians(-60));
  ellipse(-80, 120, 130, 80);
  popMatrix();

  //ull negre
  fill(0, 0, 0);
  ellipse(_x-30, _y-50, 30, 80);
  ellipse(_x+30, _y-50, 30, 80);
  //ullblau
  fill(0, 107, 252);
  ellipse(_x-30, _y-50, 25, 75);
  ellipse(_x+30, _y-50, 25, 75);
  //ull negre petit
  fill(0, 0, 0);
  ellipse(_x-30, _y-60, 27, 60);
  ellipse(_x+30, _y-60, 27, 60);
  //ull blanc
  fill(255);
  stroke(0, 104, 252);
  strokeWeight(2);
  ellipse(_x-30, _y-70, 20, 30);
  ellipse(_x+30, _y-70, 20, 30);

  //galtes
  fill(277, 2, 160, 80);
  noStroke();
  ellipse(_x-70, _y, 40, 25);
  pushMatrix();
  ellipse(_x+70, _y, 40, 25);
  popMatrix();
}
void mousePressed() {
  for(int i = 0; i<numKirby; i++){
   velocidadesX[i] = random(3,3);
    velocidadesY[i] = random(3,3);
  posicionesX[i] = mouseX;
  posicionesY[i] = mouseY;
}
}
void limits() {
  if (x+170 > width || x-170 < 0) {
    v = -v;
  }

  if (y+180> height || y-180 < 0) {
    vy = -vy;
  }
}



