
float x=200;
float y=200;
float d=100;
float direction;
float xCible;
float yCible;
float vitesse;

float pupilleD = 30;

void setup() {
  size (400,400);
  smooth();
  noStroke();
}

void draw() {
  background(100, 120, 67);
  fill(255);
  
  stroke(0);
  ellipse(x,y,d,d);
  
  x = x + (xCible - x) * 0.03;
  y = y + (yCible - y) * 0.03;

  float radians = atan2 (mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
  
  distance = constrain(distance,0,d/2 - pupilleD/2);
  
  float pupilleX = cos(radians)* distance + x;
  float pupilleY = sin(radians)* distance + y;
  
  fill(35,100,24);
  ellipse(pupilleX,pupilleY, pupilleD,pupilleD);
}

void mousePressed(){
  
xCible = mouseX;
yCible = mouseY;

}


