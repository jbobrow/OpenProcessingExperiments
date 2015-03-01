
// Markús S.
boolean button = false;

int x = 50;
int y = 50;
int w = 100;
int h = 75;
float R;
float G;
float B;

void setup() {
  size(200,200); 
}

void draw() {
  if (button) {
    background(255);
    stroke(0);
  } else {
    background(0);
    stroke(255);
      R = random(255);
  G = random(255);
  B = random(255);
    fill(R,G,B);
  }

  rect(x,y,w,h);
}

void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
    x=x+10;
    w=w+10;
    y=y+10;
  }  else {
    x=x-10;
    w=w-10;
    y=y-10;
  }
}
