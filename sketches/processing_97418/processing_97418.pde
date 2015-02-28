
void setup() {
  background(0);
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  stroke(255);
  fill(255);
  pushMatrix();
  translate(-90, 0);
    scale(1.5);
  for (float j = 200; j < 300; j = j + 3) {
    line(100, 200, mouseX / 3 + j, 400);
  }

    for (float j = 300; j < 400; j = j + 3) {
      line(100, 200, j - 200, 400);
    }
    popMatrix();
  
  pushMatrix();
  stroke(255, 200, 200);
    
       for (float j = 250; j < 400; j = j + 3) {
      line(0, j / 2 + 150, width, j / 2 + 150);
    }
    
           for (float j = 250; j < 400; j = j + 3) {
      line(j / 2 + 200, 0, j / 2 + 100, height);
    }
  popMatrix(); 
  
  pushMatrix();
  translate(-50, -200);
  scale(1.2);
  stroke(200, 200, 255);
      for (float j = 300; j < 500; j = j + 3) {
      line(500, 200, j, 400);
    }
          for (float j = 200; j < 500; j = j + 3) {
      line(500, 200, mouseX / 3 + j, 250);
    }

    popMatrix();
  
}
