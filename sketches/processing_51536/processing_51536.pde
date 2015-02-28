
void setup() {
  background(255);
  size(600, 600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  
}

void draw() {
  noStroke();
  for (int i = 0;i < width;i+=20) {
    float mappedValue = map(i, 0, width, 1, 180);
    stroke(mappedValue, 10, 10, 100);
    for (int j = 0; j < height;j+=20) {
      if (mouseX > i && mouseX < i + 15 && mouseY > j && mouseY < j + 15) {
        fill(mappedValue, 60, 100, 100);
      } 
      else {
        noFill();
      }
      noStroke();
      if (i%20 == 0) {
        rect(mouseX, mouseY, i*2, j*2);
      }
     
      rect(0,0,j,i);
    }
  }

 
  }



