
int x = 100;
int y = 150;
int w = 200;
int h = 150;
boolean button = false;
//Init
void setup() {
  size(600, 400);
}
//Elements
void draw() {
  if(button) {
    background(random(0, 255));
    stroke(0);
  } else {
    background(0);
    stroke(255);
  }
  
  fill(175);
  rect(x, y, w, h);
}

void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
  }
}



