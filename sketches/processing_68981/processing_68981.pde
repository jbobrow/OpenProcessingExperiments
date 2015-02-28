
float x = 200;
float y = 200;
float xCible = 200;
float yCible = 200;
float d = 100;
float pupilleD = 30;

void setup(){
  size(400,400);
  smooth();
  noStroke();
}

void draw(){
  background(0);
  fill(255);
  
  // Calcule la vitesse et la distance du cercle
  float radiansB = atan2(yCible-y, xCible-x);
  float distanceB = dist(xCible, yCible, x, y);
  x = cos(radiansB) * min(distanceB, 0.1) + x;
  y = sin(radiansB) * min(distanceB, 0.1) + y;
  
  // Assouplissement
  x = (xCible - x) * 0.1 + x;6,
  y = (yCible - y) * 0.1 + y;

  ellipse(x, y, d, d);
  
  // Pupille
  float radiansN = atan2(mouseY-y,mouseX-x);
  float distanceN = dist(mouseX,mouseY,x,y);
   
  distanceN = constrain(distanceN,0,d/2 - pupilleD/2);
   
  float pupilleX = cos(radiansN)* distanceN + x;
  float pupilleY = sin(radiansN)* distanceN + y;
    
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleD,pupilleD);
}

void mousePressed() {
  // Change le X et le Y selon la position où la souris à été cliquée
  xCible = mouseX;
  yCible = mouseY;
}
