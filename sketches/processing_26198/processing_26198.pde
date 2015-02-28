
int x = 1; 
int y = 1;
int speedX = 2;
int speedY = 1;
int i = 0;

void setup() {
  size (500,500);
  smooth();
}

void draw() { 
  //noStroke();
  fill (255, 10);
  rect (0, 0, width, height);
  y = mouseY;
  x = mouseX;
  background(255);
  pushMatrix();
  for(int j = 0; j < 10; j++) {
  for(int i = 0; i < 13; i++ ) {
   fill (80, 90, 11);
   triangle(x+i*50+j*50, y+j*50, x+50, y+50, x+100, y+100);
  }
  }
  popMatrix() ;
}



