
float a = 0.0;
float rSize;
float x;
float y;
float easing = 0.01;



void setup() {
  size(800, 800, P3D);
  rSize = width / 6;  
  noStroke();
  fill(255,20,20);
}

void draw() {  
  background(0);
  
  a += 0.005;
  if(a > TWO_PI) { 
    a = 0.0; 
  }
  
  translate(width/2, height/2);
  
  rotateX(a);
  rotateY(a * 2.0);
  fill(255,20,20);
  ellipse(-rSize, -rSize, rSize*2, rSize*2);
  
  rotateX(a * 1.001);
  rotateY(a * 2.002);
  fill(255,20,20);
  ellipse(-rSize, -rSize, rSize*2, rSize*2);
  float r1 = map(mouseX, 0, width, 0, height);
  float r2 = height-r1;
  
  fill(255,20,20);
  ellipse(width/2 + r1/2, height/2, r1, r1);
  
  fill(255,20,20);
  ellipse(width/2 - r2/2, height/2, r2, r2);
  
   float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  ellipse(x, y, 66, 66);
  fill(255,20,20);
}
