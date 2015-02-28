
float xpos = 350;
float ypos = 250;

void setup() {
  size(700,500);
  smooth();
}

void draw() {

  line(mouseX,mouseY,xpos,ypos);
  rotate(PI/random(10));
  xpos = xpos + (mouseX - xpos)/25.0;
  ypos = ypos + (mouseY - ypos)/25.0;
}


