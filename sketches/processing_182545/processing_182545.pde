
//variables
float sz = 30;
float posicioX = 200;
float posicioY = 200;
float velocitatX = 3;
float velocitatY = 4;


PImage foto;


void setup() {

  size(640, 480); 

  foto = loadImage("pinball.jpg");
}

void draw() {

  image(foto, 0, 0);
  
  //MOVIMIENTO BOLA
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;

  //BOLA
  noStroke();
  ellipse(posicioX, posicioY, sz, sz);

  //REBOTES BOLA
  if ((posicioX+sz/2 >= width-58)||(posicioX-sz/2 <= 180)) {
    velocitatX = -velocitatX;
  }

  if ((posicioY+sz/2 >= height)||(posicioY-sz/2 <= 0)) {
    velocitatY = -velocitatY;
  }
}


void mousePressed() {

  velocitatX = random(-10, 10);
  velocitatY = random(-10, 10);
  posicioX = mouseX;
  posicioY = mouseY;
  fill(random(255), random(255), random(255));
}


