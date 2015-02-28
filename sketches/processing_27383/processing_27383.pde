
void setup() {
  size(200, 200);
  noLoop();
}

float x = 0;
float y = 0;

void draw() {
  background(214, 193, 2);
  x = x + .1;
  if (x > width) {
    x = 0;
    
 
  }
  strokeWeight(5);
  stroke(4, 106, 3);
  line(x, 0, x, height); 

}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

