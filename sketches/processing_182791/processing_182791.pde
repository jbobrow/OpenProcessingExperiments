
float dif = 100;
float mida = 25;
float posicioX = 200; 
float posicioY = 100;
float velocitatX = 5;
float velocitatY = 5;

void setup() {
  size(600, 400);
  ellipseMode(CORNER);
  }

void draw() {
  background(0);
  stroke(255);
  noFill();
  rect(dif, dif, width-200, height-200);
  fill(255);
  ellipse(posicioX, posicioY, mida, mida);
  //MOVIMENT
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;
  if (posicioX >= width-125 || posicioX <= 0+dif) {
    velocitatX = -velocitatX;
  }
  if (posicioY >= height-125 || posicioY <= 0+dif) {
    velocitatY = -velocitatY;
  }
  //COLOR
  noFill();
  quad(0, 0, dif, dif, dif, height-dif, 0, height);
  quad(0, 0, width, 0, width-dif, dif, dif, dif);
  quad(width, 0, width, height, width-dif, height-dif, width-dif, dif);
  quad(width, height, 0, height, dif, height-dif, width-dif, height-dif);
  if (posicioX <= width*1/6+(mida-10)) {
    fill(255, 243, 3); //Groc
    quad(0, 0, dif, dif, dif, height-dif, 0, height);
  } else if (posicioY <= height*2/6-mida) {
    fill(51, 222, 18); //Verd
    quad(0, 0, width, 0, width-dif, dif, dif, dif);
  } else if (posicioY >= height-dif-mida-10) { 
    fill(17, 163, 240); //Blau
    quad(width, height, 0, height, dif, height-dif, width-dif, height-dif);
  } else if (posicioX >= width*5/6-(mida+10)) { 
    fill(240, 19, 38); //Vermell
    quad(width, 0, width, height, width-dif, height-dif, width-dif, dif);
  }
}

void mousePressed() {
  posicioX = mouseX;
  posicioY = mouseY;
  velocitatX = random (-10, 10);
  velocitatY = random (-10, 10);
}
