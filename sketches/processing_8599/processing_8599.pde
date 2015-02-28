
void setup() {
  background(150);
  size(400,400);
}

void draw() {
  translate(width / 2, height / 4);
fill(0);  
for (int i = 0; i <= width; i += 20) {
    for (int j = 0; j <= height; j += 20) {
      
      int isoX, isoY;
      
      isoX = (i-j)/2;
      isoY = (i+j)/4;
      
      ellipse (isoX,isoY,2,2);
    }
  }
}

