
 
void setup() {
  size(500, 500, P3D); 
colorMode(HSB);
background(random(300), 150, 150);
  }

void draw() {
  fill(mouseX/2,255,mouseY/2);
  line(mouseX,mouseY,pmouseX,pmouseX);
  
}
