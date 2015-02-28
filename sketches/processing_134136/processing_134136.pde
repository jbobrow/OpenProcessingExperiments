


color c;
int x; 
int y;
float angle;

void setup() { 
 size(400,400);
 background(255);
 x= width/4;
 y = height/4;
 frameRate(8);
 angle = 60;
 //noLoop();
 
 
}

void draw() {
  fill(255,255,255);
  noStroke();
  rect(0,0, width, height);
  pushMatrix();
  translate(width/2, height/2);
   rotate(radians(angle));
  triangleY(0, 0);
  triangleB(0, 80);
  popMatrix();
  pushMatrix();
   translate(width/2, height/2);
   rotate(radians(-angle));
  triangleC(0, 0);
  triangleM(80, 0); 
  popMatrix();
  
  angle += 30;
  translate(-width/2, -height/2);
  
  
}

void triangleY(int x, int y) {
 c = color(255,255,0,150);
 noStroke();
 fill(c);
 triangle( x - 50, y + 80, x, y, x + 50, y + 80);
}

void triangleM(int x, int y) {
 c = color(255,0,255,150);
 noStroke();
 fill(c);
 triangle(x - 50, y, x, y + 80, x + 50, y);
}

void triangleC(int x, int y) {
 c = color(0,255,255,150);
 noStroke();
 fill(c);
 triangle( x - 50, y + 80, x, y, x + 50, y + 80);
}

void triangleB(int x, int y) {
 c = color(0,0,0,150);
 noStroke();
 fill(c);
 triangle(x - 50, y, x, y + 80, x + 50, y);
}

