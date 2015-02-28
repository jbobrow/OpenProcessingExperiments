
/*import processing.opengl.*;*/

int x, y, z;
int velocityX, velocityY, velocityZ;
int R, G, B, A;
 
 
void setup() {
  size(720,720);
  smooth();
  R = 2;
  G = 33;
  B = 201;
  A = 57;
  x = 75;
  y = 150;
  z = 225;
  velocityX = int(random(-1,30));
  velocityY = int(random(1,45));
  velocityZ = int(random(-2,50));
}
void draw() {
  background(255);
  stroke(255);
  fill(R, G, B);
  for (int i = 0; i < 72; i ++) {
    for (int j = 0; j < 72; j++) {
      ellipse(10*i+5, 10*j+5, 10, 10);
    }
  }
 
  if (y > 1) {
    R = 2;
    G = 33;
    B = 201;
    A = 100;
  }
    if (y > 680) {
    R = 0;
    G = 220;
    B = 160;
    A = 100;
   
  }
    if (y < 10) {
    R = 0;
    G = 220;
    B = 160;
    A = 100;
    
  }
   if (x > 700) {
    R = 0;
    G = 220;
    B = 160;
    A = 100;
  }
 
    if (x < 20) {
    R = 0;
    G = 220;
    B = 160;
    A = 100;
  }
  if (z > 700) {
    R = 0;
    G = 220;
    B = 160;
    A = 100;
  }
 
    if (z < 10) {
    R = 0;
    G = 220;
    B = 160;
    A = 100;
  }
  noStroke();
  fill(23, 123, 227);
  ellipse(x, y, 20, 20);
  x += velocityX;
  y += velocityY;
 
  if (x > width - 5 || x < 5) {
    velocityX *= -1;
  }
  if (y > width - 5 || y < 5) {
    velocityY *= -1;
  }
  fill(23, 174, 227);
  ellipse(z, y, 30, 30);
  z += velocityZ;
  y += velocityY;
  if (z > width - 5 || z < 5) {
    velocityZ *= -1;
  }
  if (y > width - 5 || y < 5) {
    velocityY *= -1;
  }
  if(mousePressed){
  fill(225);
  stroke(201, 122, 2);
  ellipse(y, x, 75, 75);
  z += velocityZ + 1;
  y += velocityY + 1;
  if (z > width - 5 || z < 5) {
    velocityZ *= -1;
  }
  if (y > width - 5 || y < 5) {
    velocityY *= -1;
  }
}
}

