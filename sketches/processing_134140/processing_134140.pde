

color c;
int x; 
int y;
float random;

void setup() { 
 size(300,300);
 background(255);
 x= width/4;
 y = height/4;
 frameRate(8);
  
}

void draw() {
  fill(255);
  noStroke();
  rect(0,0, width, height);
  triangle1((int)random(50, width-100), 
  (int)random(0, height - 50));
  triangle2((int)random(50, width-100), 
  (int)random(50, height - 50));
  triangle3((int)random(50, width-100), 
  (int)random(0, height - 50));
  triangle4((int)random(50, width-100), 
  (int)random(50, height - 50));
}

void triangle1(int x, int y) {
 c = color(255,255,0,150);
 noStroke();
 fill(c);
 triangle(x, y, x + 50, y + 80, x + 100, y);
}

void triangle2(int x, int y) {
 c = color(255,0,255,150);
 noStroke();
 fill(c);
 triangle(x, y, x + 50, y + 80, x + 100, y);
}

void triangle3(int x, int y) {
 c = color(0,255,255,150);
 noStroke();
 fill(c);
 triangle( x - 50, y + 80, x, y, x + 50, y + 80);
}

void triangle4(int x, int y) {
 c = color(0,0,0,150);
 noStroke();
 fill(c);
 triangle( x - 50, y + 80, x, y, x + 50, y + 80);
}
