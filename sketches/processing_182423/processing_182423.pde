
//variables posicion and size

float posicionX = 100;
float posicionY = 80;
float sizeW = 50;
float sizeH = 50;

//varialbes velocidad

float velocidadX = 3;
float velocidadY = 3;

void setup() {

  size(600, 400);
  smooth();
  ellipseMode(CENTER);
}

void draw() {

  background(0);
  fill(255);
  ellipse(posicionX, posicionY, sizeW, sizeH);

  posicionX = posicionX + velocidadX;
  posicionY = posicionY + velocidadY;

  // cambio de sentido horizontal
  if ((posicionX > width - (sizeW/2)) || (posicionX <= 0 + (sizeW/2))) {
    velocidadX = -velocidadX;
  }

  // cambio de sentido vertical
  if ((posicionY > height - (sizeH/2)) || (posicionY <= 0 +(sizeH/2))) {
    velocidadY = -velocidadY;
  }
}

