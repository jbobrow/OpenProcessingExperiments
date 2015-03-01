
//variables posicion and size

float posicionX = 100;
float posicionY = 80;
float sizeW = 50;
float sizeH = 50;

//varialbes velocidad

float velocidadX = 3;
float velocidadY = 3;

//variables color

float negro=0;
float blanco=255;

//imagen fondo
PImage foto;

void setup() {

  size(600, 400);
  smooth();
  ellipseMode(CENTER);

  foto = loadImage("mesabillar.png");
}

void draw() {

  background(0);
  image(foto, 0, 0);
  fill(blanco);
  
  ellipse(posicionX, posicionY, sizeW, sizeH);


  posicionX = posicionX + velocidadX;
  posicionY = posicionY + velocidadY;

  // cambio de sentido horizontal
  if ((posicionX > width - (sizeW/2+50)) || (posicionX <= 0 + (sizeW/2+50))) {
    velocidadX = -velocidadX;
  }

  // cambio de sentido vertical
  if ((posicionY > height - (sizeH/2+50)) || (posicionY <= 0 +(sizeH/2+50))) {
    velocidadY = -velocidadY;
  }
}

void mousePressed() {
  
ellipse(posicionX, posicionY, sizeW, sizeH);

  //nueva posicion de la bola
  posicionX=mouseX;
  posicionY=mouseY;
  
  //variacion de color entre 0,255
  blanco = random (100);
  
  //variacion de velocidad
  velocidadX = random(-10, 10);     
  velocidadY = random (-10,10);
}



