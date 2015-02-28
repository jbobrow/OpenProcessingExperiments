
float x = 0;
float y = 0;
 
void setup() {
 size(700,400);
 stroke(255,255,255,0);
 smooth();
 background(255);
}
 
void draw() {
    line(x,y, mouseX, mouseY);
}
 
void mousePressed() {
  stroke(0, random(10,15));
  if (mouseButton == RIGHT) {
    x = random(width);
    y = random(height);
  }
  else {
    x = mouseX;
    y = mouseY;
  }
}


