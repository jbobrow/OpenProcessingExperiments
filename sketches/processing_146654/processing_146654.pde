


void setup() {
  size(640, 360);
  noSmooth();
  noStroke();
  background(0);
}



void draw() {
  background (#000000);
 stroke (30);
 fill (250);


 if (mousePressed) {
    stroke(240,41,41);
  } else {
    stroke(0);
  }
  ellipse(mouseX,mouseY,60,60);
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66); 
}




