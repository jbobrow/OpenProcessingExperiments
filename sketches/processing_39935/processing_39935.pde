
float rectSize = 1;

void setup() {
  
  size(600, 600);
}

void draw() {
  background(0, 0, 0, mouseX);
  for (int r = 10; r < 590; r = r + 30) {
    for (int j = 10; j < 590; j = j + 30) {
      rect(r, j, rectSize, rectSize);
      fill(random(mouseX, mouseY));
      stroke(5, height, width);
      }
    // when the mouse is over a little rectangle scale up variable 'size'
    if (mouseX > 0 && mouseY < 600) {
      rectSize = rectSize + 0.001;
      
    }
      else {
        rectSize = rectSize - 0.0001;
      }
  }
}

                
                                                
