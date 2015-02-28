

float z = 0;
void setup() {
  size(500, 500);
  noStroke();
  smooth();
}

void draw() {
  float x = 0;
  
  while (x < width) {
    
    float y = 0;
    while (y < height) {
      
      float co = 255 * noise(x/500, 0, z/100);
      fill(co, 25, 150);
      rect(x, y, 5, 5);
      y = y + 2;
    }
    x = x + 2;
  }
  z = z + 5;
}

