

float r = random(-50, 50);

void setup() {
  size(700, 400);
  background(255);
}

void draw() {
  //fill(r);
  //line(mouseX, mouseY, mouseX/2, mouseY/2);
  
}


void mouseClicked() {
  //fill(r);
  //line(mouseX, mouseY, mouseX, mouseY);
}

void mouseDragged(){
  fill(r);
  line(mouseX, mouseY, mouseX, mouseY);
}

