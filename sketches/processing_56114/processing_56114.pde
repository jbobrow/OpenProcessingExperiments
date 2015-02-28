
//----------------------
// by lali barriere 2012
//----------------------

// pinta una rodona que es mou
// utilitzem nombres amb decimals per tenir mes precisio
float posX, posY; // centre de la rodona
float velX, velY; // velocitat de la rodona
float radi; // radi de la rodona

void setup() {
  size(300, 300);
  background(0);
  smooth();
  
  noStroke();
  fill(255, 0, 0);

  posX = width/2;
  posY = height/2;
  velX = random(-2,2);
  velY = random(-2,2);
  ellipseMode(RADIUS);
  radi = 25;
}

void draw() {

  background(0);
  ellipse(posX, posY, radi, radi);

  // canvia la posicio
  // i controla que no surti de la finestra
  posX = posX+velX;
  posY = posY+velY;
  
  if (posX <= radi) {
    posX = radi;
    velX = -velX;
  }
  if (posX >= width-radi) {
    posX = width - radi;
    velX = -velX;
  }
  if (posY <= radi) {
    posY = radi;
    velY = -velY;
  }
  if (posY >= height-radi) {
    posY = height - radi;
    velY = -velY;
  }

}

