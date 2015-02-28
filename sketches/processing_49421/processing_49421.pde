
int x = 200;
int y = 200;
int w = 200;
int h = 200;

void setup() {
  size (400, 400);
  smooth();
  background (255);
  line (x, 0, w, h*2);
  line (0, y, w*2, h);
}

void draw() {
  background(255);
  line (x, 0, w, h*2);
  line (0, y, w*2, h);

  if ( (mouseX < x) && (mouseY < y) ) {

    fill (0);
    rect(x/4, y/4, w/2, h/2);
  } 
  else if ( (mouseX > x) && (mouseY < y) ) {

    fill(0);
    rect(x + x/4, y/4, w/2, h/2);
  } 
  else if ( (mouseX < x) && (mouseY > y) ) {

    fill(0);
    rect(x/4, y + y/4, w/2, h/2);
  } 
  else if ( (mouseX > x) && (mouseY > y) ) {

    fill(0);
    rect(x + x/4, y + y/4, w/2, h/2);
  } 
  else {
    background (255);
    line (x, 0, w, h*2);
    line (0, y, w*2, h);
  }
}

