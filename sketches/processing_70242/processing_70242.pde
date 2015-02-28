
void setup () {
  size(500,500);
  background(0);
  smooth();
  
}

void draw() {
}
  
  void keyPressed() {
  if (key == 'q') {
    fill(102, 51, 0);
    noStroke();
    rect(mouseX,mouseY,60,10);
    }
  else if (key == 'w') {
   fill(153, 102, 0);
   noStroke();
   rect(mouseX, mouseY, mouseX/5, mouseY/5);
  }
else if (key == 'a') {
   fill(80, 90, 46);
   noStroke();
   rect(mouseX, mouseY, mouseX/2, -mouseY/2);
  }
else if (key == 's') {
   fill(51, 0, 0);
   noStroke();
   rect(mouseX, mouseY, mouseX, mouseY);
  }

  }


