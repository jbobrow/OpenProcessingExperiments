
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {
  strokeWeight(2);
  fill(255);
  for (int i = 0; i <= width; i += 10) {
    for (int j = 0; j <= height; j += 10) {
      if (i>400){
        fill(150);
      }
      else if (i<400 && i>200){
        fill(200);
      }
      
      ellipse(i,j,10,10);
      
    }
  }
}


