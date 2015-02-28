
//Matthieu gagnon Lamarre

//initiation des variable 
float x = random(width);
float y = random(height);
float targetX;
float targetY;


float d = 100;

float pupilleD = 30;

void setup() {

  size(400, 400);
  background(0);
  smooth();
  frameRate(20);
}


void draw() {

  background(0);
 

  if (mousePressed) {
    targetX = mouseX;
    targetY = mouseY;
  }

  float ratio = 0.2;
  x = (targetX - x)* ratio + x;
  y = (targetY - y)* ratio + y;
  fill(255);
  ellipse(x, y, 100, 100);

  float radians = atan2(mouseY-y, mouseX-x);
  float distance = dist(mouseX, mouseY, x, y);
//calcul de la distance d'un point
  distance = constrain(distance, 0, d/2 - pupilleD/2);


  float pupilleX = cos(radians)* distance + x;
  float pupilleY = sin(radians)* distance + y;

  fill(0);
  ellipse(pupilleX, pupilleY, pupilleD, pupilleD);
}


