
float X = 150;
float Y = 80;
float eyeR, eyeG, eyeB;

void setup() {
  size (500, 500);
  
}
void draw() {
  background (197, 214, 93);
  fill (255, 0, 250, 500); //full blue

eyeR = random(0,256);
eyeG = random(0,256);
eyeB = random(0256);
  fill(eyeR,eyeG,eyeB);
  ellipse(X-35, Y, 120, 120);
  ellipse(X-70, Y, 40, 40);
  ellipse(X, Y, 40, 40);
  rect(X-55, Y+60, 40, 150);
  stroke(55, 55, 70, 70);
 
  // move circle only after click
  X = X + 1;
  Y = Y+ 1;
} 




