
float X = 250;
float Y = 150;
int x = (int) random(1, 100); 
float zoogX;
float zoogY;

float eyeR;
float eyeG;
float eyeB;


void setup() {
  size(900, 900);
  
}

void draw() {
  
  eyeR = random(0,256);
  eyeG = random(0,256);
  eyeB = random(0,256);
  fill(eyeR + 255,eyeB + 40,eyeG + 255);
  background(21, 12, 12);
  ellipse(zoogX+310, zoogY + 130, 150, 180);
  ellipse(zoogX + 350, zoogY + 100, 50, 60);
  ellipse(zoogX + 270, zoogY + 100, 50, 60);

  rect(zoogX+290, zoogY+220, 50, 250);
  
   zoogX = random(0,255);
   zoogY = random(233,0);
  
  
}







