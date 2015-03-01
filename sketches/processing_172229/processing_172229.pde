

/* Jesús C González
 Práctica Funciones
 2014 */

float posX, posY, velX, velY;
int sz = 20;

int totalRebots = 0;

void setup() {
  size(300, 200);
  posX = width/2;
  posY = height/2;
  velX = random(8, 15);
  velY = random(8, 15);
}

void draw() {
  actualizaPosiciones();
  cuentaRebotes();
  dibuijaBola();
}

void actualizaPosiciones() {
  background(0);
  posX = posX+velX;
  posY = posY+velY;

  if ((posX<0)||(posX>width)) {
    velX = -velX;
    totalRebots ++;
  } 

  if ((posY<0)||(posY>height)) {
    velY = -velY;
    totalRebots ++;
  }
}

void cuentaRebotes() {
  fill(127);

  text (totalRebots, 15, height-15);
};

void dibuijaBola() {
  fill(255);
  ellipse(posX, posY, totalRebots, totalRebots);
}






