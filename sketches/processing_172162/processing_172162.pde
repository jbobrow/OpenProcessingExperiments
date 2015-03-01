

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
  fill (0, 25);
  rect (0, 0, width, height);

  actualizaPosiciones();
  cuentaRebotes();
  dibuijaBola();
}

void actualizaPosiciones() {
  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
}

void  dibuijaBola() {
  //dibuix
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(posX, posY, totalRebots, totalRebots);
}

void cuentaRebotes() {
  //comprobem posX
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

void mousePressed () {
  velX = 2;
  velY = 2;
}

void mouseReleased () {
  velX = random(8, 15);
  velY = random(8, 15);
}



