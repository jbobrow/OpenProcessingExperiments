
boolean button = false;

int x = 100;
int y = 100;
int w = 100;
int h = 100;

void setup() {
  size(300,300); 
}

void draw() {
  if (button) {
    background(255);
    noStroke();
  } else {
    background(0);
    noStroke();
  }
  
  fill(175);
  rect(x,y,w,h);
}

void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
  }  
}

