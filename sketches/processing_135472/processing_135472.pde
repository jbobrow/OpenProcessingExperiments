
float s = 0;
float v = dist(mouseX,mouseY,pmouseX,pmouseY);
void setup() {
  background (250,250,250);
  size(1000,800);
 frameRate(10);
}
  
void draw() {
 
 float x = 100*sin(s);
 ellipse(mouseY,mouseX,x*5,x*10);
  fill(random(250),random(200),random(200),40);
  noStroke();
}
  void mouseMoved() {
  s = s+2+(v/50);
  if (s > 255) {
    s = 0;
  }
  }
