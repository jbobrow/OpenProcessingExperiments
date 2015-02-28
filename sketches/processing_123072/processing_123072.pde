

void setup() {
  size(320,240, P2D);  
}
  
void draw() {    
  background(255);
  stroke(0,100);
  
  if (mousePressed) {
  
    for (int i = 0; i < 650; i++) {
    float x0 = mouseX + 25;
    float y0 = random(width);
    float z0 = random(height);
    float x1 = random(width);
    float y1 = random(height);
    float z1 = random(width);    
    
    line(x0, y0, z0, x1, y1, z1);
  }
} else {
  
    for (int i = 0; i < 1000; i++) {
    float x0 = random(width);
    float y0 = random(height);
    float z0 = random(height);
    float x1 = random(width);
    float y1 = random(height);
    float z1 = random(width);    
    
    line(x0, y0, z0, x1, y1, z1);
  }
}
}


