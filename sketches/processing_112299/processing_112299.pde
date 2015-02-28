


void setup() {
  size(600, 600);
}


void draw() {
  for (int i = 0; i < width; i++) {  
    for (int j = 0; j < height; j++) {
      //noStroke();
      //stroke(i* #54E8CE * mouseX * mouseY);  
      ellipse(i * 10 , j * 10, 20, 20);
    }
  }
}



