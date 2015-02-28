
//Roberta
void setup() {
  size(200, 200);
}

void draw() {

  background(HSB, 100);
  for (int i = 0; i < 200; i++) {
    for (int j = 0; j < 200; j++) {
      stroke(i, j, 200);
      point(i, j);
    }
  }



  fill(mouseX, mouseY, 175);


  ellipse(mouseX, mouseY, mouseY, mouseX);
  ellipse(mouseY, mouseX, mouseX, mouseY);
  ellipse(mouseX, mouseY, mouseX, mouseY);
  ellipse(mouseY, mouseX, mouseY, mouseX);
  ellipse(mouseX, mouseX, mouseY, mouseY);
  ellipse(mouseY, mouseY, mouseX, mouseX);
    
}
