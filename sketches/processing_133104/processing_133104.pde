
void setup() {
  size(700, 700);
  background(0, 0, 255);
} 

void draw() {
  stroke( mouseX, mouseY, 0);
  line( width/4, height/4, mouseX, mouseY);
  line( 3*width/4, height/4, mouseX, mouseY);
  line( width/4, 3*height/4, mouseX, mouseY);
  line( 3*width/4, 3*height/4, mouseX, mouseY);
}

void mousePressed() {
  background(mouseX, mouseY, random(0,150));
}


