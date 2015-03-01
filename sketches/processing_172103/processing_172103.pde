
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
  background(0);

  actualizaPosiciones();
  dibujaBola();
  cuentaRebotes();
}
void actualizaPosiciones() {
  posX = posX+velX;
  posY = posY+velY;
}

void dibujaBola() {
  background(0);

  if (totalRebots<20) {
    fill(255);
    ellipse(posX, posY, totalRebots, totalRebots);
  } else if (totalRebots<40) {
    fill(255, 0, 0);
    rect(posX, posY, totalRebots, totalRebots);
  } else if (totalRebots<60) {
    fill(0, 255, 0);
    ellipse(posX, posY, totalRebots, totalRebots);
  }
  else {
    fill(255);
 ellipse(posX, posY, totalRebots, totalRebots);}
} 




void cuentaRebotes() {
  if ((posX<0)||(posX>width)) {
    velX = -velX;
    totalRebots ++;
  } 
  //comprobem posY
  if ((posY<0)||(posY>height)) {
    velY = -velY;
    totalRebots ++;
  }
  fill(127);
  //i finalment, escribim
  text (totalRebots, 15, height-15);
}

void mousePressed() {
  
  
totalRebots = 0;}


