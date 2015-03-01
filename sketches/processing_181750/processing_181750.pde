
float posX = width/2;
float posY = height/2;

float margeX = 25;
float margeY = 25;
float llargada = 50;

float posRandomX = random(100, 400);
float posRandomY = random(100, 400);

color roig = color(255, 0, 0);
color verd = color(0, 255, 0);
color blau = color(0, 0, 255);
color groc = color(255, 255, 0);
color blanc = color(255);
color colorCercle = blanc;


void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0);

  //CercleAleatori
  fill(255);   //Falta afegir aletorietat pel color
  ellipse(posRandomX, posRandomY, 50, 50);


  //flextes
  strokeWeight(5);
  stroke(roig);
  line (margeX, margeY, margeX+llargada, margeY);
  line (margeX, margeY, margeX, margeY+llargada);
  line (margeX, margeY, margeX+llargada*1.5, margeX+llargada*1.5);
  stroke(verd);
  line (width-margeX, margeY, width-margeX-llargada, margeY);
  line (width-margeX, margeY, width-margeX, margeY+llargada);
  line (width-margeX, margeY, width-margeX-llargada*1.5, margeY+llargada*1.5);
  stroke(blau);
  line (width-margeX, height-margeY, width-margeX-llargada, height-margeY);
  line (width-margeX, height-margeY, width-margeX, height-margeY-llargada);
  line (width-margeX, height-margeY, width-margeX-llargada*1.5, height-margeY-llargada*1.5);
  stroke(groc);
  line (margeX, height-margeY, margeX+llargada, height-margeY);
  line (margeX, height-margeY, margeX, height-margeY-llargada);
  line (margeX, height-margeY, margeX+llargada*1.5, height-margeY-llargada*1.5); 

  //Cercle
  noStroke();
  fill (colorCercle);
  ellipse(posX, posY, 50, 50);

  // Para empiece en el centro, sirve de cheatcode
  if ((mouseX==0) && (mouseY==0)) {
    posX = width/2;
    posY = height/2;
  }

  //Moviment cercle
  if (posX>500) {
    posX = 0;
  } else if (mouseX>width/2) {
    posX = posX +2;
  }
  if (posX<0) {
    posX = 500;
  } else if (mouseX<width/2) {
    posX = posX -2;
  }
  if (posY>500) {
    posY = 0;
  } else if (mouseY>height/2) {
    posY = posY +2;
  }
  if (posY<0) {
    posY = 500;
  } else if (mouseY<height/2) {
    posY = posY -2;
  }

  //Colors
  if ((mouseY>height/2 && mouseX>width/2 )) {
    colorCercle=blau;
  } 
  if ((mouseX>width/2 && mouseY<height/2 )) {
    colorCercle=verd;
  }
  if ((mouseX<width/2 && mouseY<height/2 )) {
    colorCercle=roig;
  }
  if ((mouseY>height/2 && mouseX<width/2 )) {
    colorCercle=groc;
  }
  if ((mouseX==0) || (mouseY==0)) {
    colorCercle=blanc;
  }
}

