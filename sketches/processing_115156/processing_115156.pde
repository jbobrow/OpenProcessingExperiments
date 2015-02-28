
///Eunsil Choi 10/10/2013

void setup() {
  size(700, 400);
}

void draw() {
  background(40, mouseY/3, 120);
  smooth();
  for (int yPos = 0; yPos <= height; yPos += height/7) {    
    for (int xPos =0; xPos <= width ; xPos = xPos +70) {
      float distance = dist(mouseX, mouseY, xPos, yPos);  
      noStroke();      
      if (mousePressed && (mouseButton == LEFT)) {
        fill(#dc143c,30);       
        ellipse(xPos, yPos, .3*distance, 0.3*distance);
      }
      if (mousePressed && (mouseButton == RIGHT)) {
        for (int i=1; i<=width; i+=width/40) {
          stroke(200,200,mouseY);
          strokeWeight(5);
          strokeCap(PROJECT);
          line(i, 0, i, mouseY);
        }
      }
    }
  }
}
