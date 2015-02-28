
float rectSizeX = 20, rectSizeY = 20;
float rotation = 20;

int r = 10;
int b = 10;

void setup() {
  size(500, 500);
  smooth();
  colorMode(RGB,255,255,255,100);
  rectMode(CENTER);
  noStroke();
  
  background(255);
}

void draw() {  
    if (rectSizeX >= width +250) {
    rectSizeX = 20;
    r = 10;
    background(255);
  } else {
    rectSizeX *= 1.05;
  }
  
  if (rectSizeY >= height +250) {
    rectSizeY = 20;
    b = 10;
    background(255);
  } else {
    rectSizeY *= 1.05;
  }
  
  
  r *= 1.14;
  fill(r,0,0, 10);
  rect(width/2 -100, height/2-100, rectSizeX, rectSizeY);
  
  b *= 1.14;
  fill(0,0,b, 10);
  rect(width/2 +100, height/2+100, rectSizeX, rectSizeY);
}

void mousePressed() {  
}


void keyPressed() {
 
 if (key == 'r' || key == 'R') { 
   rectSizeY = 20;
   rectSizeX = 20;
 }
  
  if (key == 's' || key == 'S') saveFrame("roboterLiebe.png");
 
}



