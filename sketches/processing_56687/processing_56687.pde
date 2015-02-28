
float speed = 2;

void setup() {
  size(500, 500);
  smooth();
   background(211, 142, 227);
}


void draw() {
  noStroke();
  float fill = dist(mouseX, mouseY, pmouseX, pmouseY);
       fill(0, 255, mouseX, mouseY);
  ellipse(mouseX, mouseY, fill, -fill);
  stroke(100, mouseX, mouseY);
  line(mouseY, mouseX, mouseX, mouseY);
  float x = random(1, 500);
  float y = random(1, 500);
  noStroke();
  ellipse(x, y, 10, 10);
 
     if (mousePressed == true) 
   background(211, 142, 227);
  }


