
// code réorganisé de http://www.openprocessing.org/sketch/19103 
// et http://www.openprocessing.org/sketch/52046 par Thomas O Fredericks

float xOeil, yOeil;
int targetX, targetY, pupilleD, dOeil;

void setup() {
  size(400, 400);
  smooth();
  noStroke();

  xOeil=width/2;
  yOeil=height/2;
  dOeil=100;
  pupilleD=30;
// pour être identique à l'exemple (que l'oeil se rende au coin dès le début) je n'ai pas mis les 2 lignes suivantes. Mais j'aimais ça.
  //targetX = width/2; 
  //targetY = height/2;
}


void draw() {
  background(0);
  dessinOeil();  

  if ( mousePressed) {
    targetX = mouseX;
    targetY=mouseY;
  } 

  // CERCLE ROUGE
  float ratio = 0.05;
  xOeil = (targetX - xOeil)* ratio + xOeil;
  yOeil = (targetY - yOeil)* ratio + yOeil;
  dessinOeil();
}

void dessinOeil() {
  fill(255);

  ellipse(xOeil, yOeil, dOeil, dOeil);

  float radians = atan2(mouseY-yOeil, mouseX-xOeil);
  float distance = dist(mouseX, mouseY, xOeil, yOeil);

  distance = constrain(distance, 0, dOeil/2 - pupilleD/2);


  float pupilleX = cos(radians)* distance + xOeil;
  float pupilleY = sin(radians)* distance + yOeil;

  fill(0);
  ellipse(pupilleX, pupilleY, pupilleD, pupilleD);
}
