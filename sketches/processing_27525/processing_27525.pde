
boolean button = false;

int x = 200;
int y = 250;
int w = 500;
int h = 200;


void setup() {
  size(400,400); 
  background(255,199,174);
  colorMode(HSB);
    counter = 0;
}

void draw() {
  if (button) {
  counter++;
  strokeWeight(2);
  stroke(44);
    background(225);
    strokeWeight(2)
    stroke(random(192),random(15),random(247))
  }
  
  fill(random(225));
  ellipse(0),random(0),30,50);
}
 
void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
  }  
}
