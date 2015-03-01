
float num;
int backColor = 0;
boolean netFlo = true;
 
void setup() {
  size(640, 640);
  stroke(155, 100, 255);
  strokeWeight(6); 
}
 
void draw() {
  background(backColor);
   
  float maxX = (float)180/width*mouseX;
  float maxY = (float)180/height*mouseX;
  float len  = (float)mouseY/4;
 
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=30) {   // i+=frequency of lines. Bigger#= fewer lines, Smaller#=More lines
    float x = sin(radians(i)) * maxX;
    float y = cos(radians(i)) * maxY;
 
    float x2 = sin(radians(i+len)) * maxX;
    float y2 = cos(radians(i+len)) * maxY;
 
    pushMatrix();
    translate(x, y);
    rotate(radians(-i+num));
    line(x, y, x2, y2);
    line(-x, -y, -x2, -y2);
    line(-y, x, -y2, x2);
    line(y, -x, y2, -x2);
    popMatrix();
  }
  num += 3.0;  // Speed
}
 
void mousePressed() {
  if (netFlo && backColor == 255) {
  stroke(155, 100, 255);
    backColor = 0;
    netFlo = false;
  }
  if (netFlo && backColor == 0) {
  stroke(255, 0, 255);
    backColor = 255;
    netFlo = false;
  }
}
 
void mouseReleased() {
  netFlo = true;
}
