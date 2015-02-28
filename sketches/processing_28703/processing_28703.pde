
	

void setup() {
  size(500, 500);
  noLoop();
    background(255);
}

float x = 0;

void draw() {

  x = x + 10;
  if (x >= width) {
    x = 0;
  }
  strokeWeight(2);
 
  ellipse(250, 250, x, x); 

}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

