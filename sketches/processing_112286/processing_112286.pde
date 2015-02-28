


void setup() {
  size(600, 600);
  
  background(255);
}


void draw() {
  

  
  noStroke();
  ellipse(width/2, height/2, 300, 300);
  
  float fillVal = map(mouseX, 0, width,   0, 255);
  stroke(fillVal, 20, 165, 139);
  
  for (int i = 0; i < 570; i+=10) {  
    for (int j = 0; j < 570; j+=5) {
      stroke(i* #54E8CE * mouseX * mouseY);
  
      line(i + 10, j + 10, i + 30, j + 30);
      
    }
  }
}



