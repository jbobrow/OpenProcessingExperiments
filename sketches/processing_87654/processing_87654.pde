
void setup() {
  size(640, 480);
  smooth();
}

void draw() {
  background(0);
  
  strokeWeight(random(1,5));

  for (int i=0; i<width; i+=20) {
    for (int j=0; j<height; j+=20) {
      stroke(0xFF4BB8FF);
      line(0, j, width, 0);
      
      stroke(0xFFB94BFF);
      line(width, j, 0, height/2);
      
      stroke(0xFF86FF4B);
      line(i, height, width/2, 0);
    }
  }
}


