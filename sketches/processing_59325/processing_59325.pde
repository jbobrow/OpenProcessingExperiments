


void setup() {
  size(300, 300);
  background(255);
  smooth();
}

void draw() {
  background(255);
  for (int i=0; i<10; i++) {
    line(0, i*20, mouseX-i*mouseX/11, mouseY-i*mouseY/11);  
    line(i*20, 0, mouseX-i*mouseX/11, mouseY-i*mouseY/11);
  }
  rotate(PI/2);
  translate(0, -height);
  for (int i=0; i<10; i++) {
    line(0, i*20, mouseX-i*mouseX/11, mouseY-i*mouseY/11);  
    line(i*20, 0, mouseX-i*mouseX/11, mouseY-i*mouseY/11);
  }
  rotate(PI/2);
  translate(0, -height);
  for (int i=0; i<10; i++) {
    line(0, i*20, mouseX-i*mouseX/11, mouseY-i*mouseY/11);  
    line(i*20, 0, mouseX-i*mouseX/11, mouseY-i*mouseY/11);
  }
  rotate(PI/2);
  translate(0, -height);
  for (int i=0; i<10; i++) {
    line(0, i*20, mouseX-i*mouseX/11, mouseY-i*mouseY/11);  
    line(i*20, 0, mouseX-i*mouseX/11, mouseY-i*mouseY/11);
  }
}



