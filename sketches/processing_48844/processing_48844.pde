
float circleX = 3;
float circleY = 1;

void setup() {
  size(400,400);
  smooth();
  background(random(255),random(255),random(255));
  colorMode(HSB);
  
}

void draw() {
  stroke(random(255),255,255);
  fill(random(150),random(255),random(255));
  ellipse(circleX,circleY, 25,25);
  circleX = circleX + 1;
  circleY = circleY + 1;
 
  if(circleX > 400) {
   circleX = 0;
 }
 
 if(circleY > 400) {
   circleY = 0 + 25;
 }

  
}
