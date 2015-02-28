
float y = 100;
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

void setup() {
  size(400, 400);


  b1 = color(126, 207, 255);
  b2 = color(17, 61, 144);
  c1 = color(222, 143, 40);
  c2 = color(173, 104, 14);
  noLoop();
  
  y = height * 0.5;
}

void draw() {
  

  setGradient(0, 0, height, width, b1, b2, X_AXIS);

 
  setGradient(140, 120, 120, 300, c2, c1, Y_AXIS);
  stroke (0);
  strokeWeight (1);

  fill (120, 80, 80);
  strokeWeight (2);
  rect (180, 350, 20, 50);

  fill (204, 120, 0);
  strokeWeight (6);
  line (80, 400, 80, 330);

  fill (0, 255, 0);
  strokeWeight (4);
  ellipse (80, 330, 80, 30);

  fill (120, 80, 80);
  strokeWeight (3);
  for ( int j=0; j<3; j++)
    for ( int i=0; i<6; i++) {
      fill (random (255));
      rect (160+j*30, 300-i*30, 20, 20);
    }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) { 
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) { 
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
y = y -1;
if (y < 0) {
  y = height;
}}
}
void mousePressed() {
  loop();
}
