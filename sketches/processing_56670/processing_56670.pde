
float x;
float dx;
float y;
float dy;
float c;
//float t;

void setup() {
  size(900, 450);
  smooth();
  noStroke();
  x = 0;
  dx = 1;
  y = 0;
  dy = 1;
  c = 1;
  //t = 99;
}

void draw() {
  fill(255,x-10,y-c);
  ellipse(x, y, 50, 50);
  x += 5*dx;
  y += 9*dy;
  c += 20;
  if (x >=width-25) {
    dx = -1;
  }
  if (x <= 25) {
    dx = +1;
  }
  if (y >= height-25) {
    dy = -1;
  }
  if (y <= 25) {
    dy = +1;
  }
  if (mousePressed == true){
  stroke (random(255),random(255),random(255));
  line (mouseX, mouseY, width, height);
  line (mouseX, mouseY, 0,0);
  line (mouseX, mouseY, 0, height);
  line (mouseX, mouseY, width, 0);
  noStroke ();
  }
}

