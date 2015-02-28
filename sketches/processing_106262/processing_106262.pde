
boolean value = true;

void setup(){
  rectMode(CENTER);
  size(200, 200);
}

void draw() {
  background(50);
  if(value)
    rect(mouseX, mouseY, 50, 50);
}

void mouseClicked() {
  if (value == true) {
    value = false;
  } else {
    value = true;
  }
}
