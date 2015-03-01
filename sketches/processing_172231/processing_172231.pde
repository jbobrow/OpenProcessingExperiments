
float posX, posY, velX, velY;
int sz = 20;
int totalRebots = 0;

void setup() {
  size(300, 200);
  posX = width/2;
  posY = height/2;
  smooth();
  velX = random(8, 15);
  velY = random(8, 15);
}


void draw() {
  background(0,255,0);
  actualizaPosiciones();
  dibuijaBola();
  cuentaRebotes();
}

void actualizaPosiciones() {
  posX = posX+velX;
  posY = posY+velY;
}

void  dibuijaBola() {
  fill(255);
  ellipse(posX, posY, totalRebots, totalRebots);

  if ((posX<0)||(posX>width)) {
    velX = -velX;
    totalRebots ++;
  } 

  if ((posY<0)||(posY>height)) {
    velY = -velY;
    totalRebots ++;
  }
}

void   cuentaRebotes() {
  fill(0);
  text (totalRebots, 10, 15);
}


void mousePressed() {
  velX = random(0,10);
  velY = random(0,10);

}


