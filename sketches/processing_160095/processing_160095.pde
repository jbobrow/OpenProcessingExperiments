
void setup() {
  size(500, 500);
  background(255);
}
void draw() {
float x = random(width);
float y = random(height);
float z = random(500);
float a = random(255);
float b = random(300);
fill(z,a,b,100);
noStroke();
ellipse (x,y,50,50);
}
