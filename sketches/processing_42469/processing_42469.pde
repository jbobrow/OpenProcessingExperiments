
int x=0;
int y=0;
int d=0;
boolean pressed = false;

void setup() {

  smooth();
  noStroke();
  size(500, 500);

  x=width/2;
  y=height/2;
  d=200;
}

void mousePressed() {
  if (pressed) {
    pressed=false;
  }
  else {
    pressed=true;
  }
}

void draw() {
  background(50);
  
  if (pressed) {
    d++;
  }
  else {
    //d--;
  }

  ellipse(x, y, d, d);
}


