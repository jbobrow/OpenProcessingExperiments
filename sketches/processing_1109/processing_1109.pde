
void setup() {
  size(500, 300);
  stroke(2);
  smooth();
  fill(mouseX + 50, mouseY + 50, 10, 100); 
  
}






void draw() {
  frameRate(30);
  background(255);
  float offset = 250;
  float scaleVal = mouseX;
  float angleInc = PI/mouseY;
  float angle = 0.0;
  

    for (int x = 0; x <= width; x += 5) {
    float y = offset + (sin(angle) * scaleVal);
        
        ellipse(x, y, mouseX, mouseX);
        angle += angleInc;
     
  }
}


