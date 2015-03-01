
float posX= random(20);
float posY= random(20);
float velX= random (20);
float velY = random(20);

void setup() {
  size(400, 400);
  frameRate(80);
  noCursor();
}

void draw() {

  posX = posX + velX;
  posY = posY + velY;

  // aqui es para aclarar el cambio de color del fondo si la posx es menor que tamaño/2
  if (posX < width/2) {
    background(255, 0, 0);
  } else {
    background(22, 57, 100);
  }
  //compocision de las lineas con for
  for (int i=0; i<=width; i+=5) {
    stroke(i, 255, i);
    line(posX, posY, i, 0);
    line(posX, posY, 0, i);
    line(posX, posY, width, i);
    line(posX, posY, i, height);
  }
  if ((posX >= width)|| (posX < 0)) {
    velX = -velX;
  }
  if ((posY >= height)|| (posY < 0)) {
    velY = -velY;
  }
  
// 2 PARTE
  for (int i=0; i<=width; i+=5) {
    stroke(0, i,i,90);
    line(mouseX, mouseY, i, 0);
    line(mouseX, mouseY, 0, i);
    line(mouseX, mouseY, width, i);
    line(mouseX, mouseY, i, height);
  }
}



