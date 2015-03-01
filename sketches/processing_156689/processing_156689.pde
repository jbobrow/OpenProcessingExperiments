
void setup() {
  size(640, 640);
  noFill();
}

void draw() {
  background(255);
  
  float maxX = (float)180/width*mouseX;
  float maxY = (float)180/height*mouseX;

  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=5) {
    float x = sin(radians(i)) * maxX;
    float y = cos(radians(i)) * maxY;
    pushMatrix();
    translate(x, y);
    rotate(radians(i-frameCount));
    rect(0, 0, 100, 100);
    popMatrix();
    
    pushMatrix();
    translate(-x, -y);
    rotate(radians(i-frameCount));
    rect(0, 0, 100, 100);
    popMatrix();
  }
}



