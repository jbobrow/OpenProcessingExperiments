
int lineX = 10;
int screenSize = 700;
int windowSize = 700;
int circleDiameter = 20;

void setup() {
  size(700, 700);
  
}

void draw() {
  background(100);
  stroke(random(255), random(255), random(255));
  noFill();
  strokeWeight(2);
  while(lineX < screenSize) { 
    while(circleDiameter <= windowSize) {
      ellipse(mouseX, mouseY, circleDiameter, circleDiameter);
      circleDiameter += 20;
    }
    circleDiameter = 20;
    line(lineX, 0, lineX, screenSize);
    lineX += 10;
   } 
   lineX = 10;
}
