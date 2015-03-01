
float posX, posY, velX;
int velY = 5;
int numeroBolas = 20;
float posicionesX[] = new float[numeroBolas];
float posicionesY[] = new float[numeroBolas];
float velocidadesX[] = new float[numeroBolas];
float velocidadesY[] = new float[numeroBolas];
int sz = 20;
boolean condicion = false;
int totalRebots = 0;
int sz2=3;

void setup() {
  size(300, 550);
  posX = width/2;
  posY = height/2;
}

void draw() {  

  actualizaPosiciones();
  dibuijaBola();
  cuentaRebotes();
  if (condicion==true) {
    explosion();
  }
}


void actualizaPosiciones() {
  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
}

void cuentaRebotes() {
  //comprobem posX
  if ((posX<0)||(posX>width)) {
    velX = -velX;

    totalRebots ++;
    //i finalment, escribim
  } 
  //comprobem posY
  if ((posY<0)||(posY>height)) {
    velY = -velY;
    totalRebots ++;
  }
}

void dibuijaBola() {
  fill (0, 25);
  rect (0, 0, width, height);
  noStroke();
  fill(random(200, 255), random(100, 255));
  ellipse(posX, posY, 3, 3);
  fill(127);
  text ("Presiona el mouse", 15, height-15);
}

void explosion() {

  float sz;
  for (int i = 0; i<numeroBolas; i++) {
    posicionesX[i] += velocidadesX[i];
    posicionesY[i] += velocidadesY[i];
  }
  for (int i = 0; i<numeroBolas; i++) {
    ellipse(posicionesX[i], posicionesY[i], sz2, sz2);
    fill (random(100, 255), 0, random(100));
    sz = random(60);
  }
}

void mouseReleased() {
  condicion=true;
  for (int i = 0; i<numeroBolas; i++) {
    posicionesX[i] = posX;
    posicionesY[i] = posY;
    velocidadesX[i] = random(-8, 8);
    velocidadesY[i] = random(-9, 9);
  }
}



