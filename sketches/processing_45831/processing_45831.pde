
PImage damon;

void setup() {
  size(450, 608);
  noStroke();
  
  damon = loadImage("HollywoodYearbook.jpg");
  
}

void draw() {
 image(damon, 0,0, 450, 608);
 fill(mouseY, 208, mouseX);
  rect(350, 350, 25, 200);
  rect(312, 400, 100, 25);
  
  rect(50, 50, 25, 200);
  rect(12, 100, 100, 25);
}
  

