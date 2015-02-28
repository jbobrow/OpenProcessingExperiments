
void setup() {
  size(400, 400);
  background(255);
  noLoop();  // draw() will not loop
}

float x = 0;
float y = 0;

void draw() {

  x = x + 5;
  if (x > width) {
    x = 0;
  }
  line(x, 0, x, height); 
  
   y = y + 5;
  if (y > height) {
    y = 0;
  }
  line(0 ,y, width, y); 
  stroke(random(255),random(255),random(255));
  
}

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}


