
void setup() {
  size(640, 480);
  background(000);  
  img = loadImage("http://i.imgur.com/VN5xRb9.png");
}

void draw() {

  image(img, 0, 300);
  
  if(mousePressed) {
   pushMatrix();
   translate(mouseX, mouseY);
   star(0, 0, 3, 10, 7); 
   popMatrix();
   
  }   
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
