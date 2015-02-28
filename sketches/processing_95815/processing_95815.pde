
int numpoints = 400;
float[] x = new float[numpoints];
float[] y = new float[numpoints];

int drawpoints = 0;

void setup() {
  size(500, 500);
}


void lineStar() {

  rotate(PI/3);
  line(0, -20, 0, 20);
  line(20*cos(7*PI/4), 20*sin(7*PI/4), 20*cos(3*PI/4), 20*sin(3*PI/4));
  line(-20, 0, 20, 0);
  line(20*cos(PI/4), 20*sin(PI/4), 20*cos(5*PI/4), 20*sin(5*PI/4));

}


void mouseDragged() {
  if (drawpoints < numpoints) {
    x[drawpoints] = mouseX;
    y[drawpoints]=mouseY;
    drawpoints += 1;
  }
}
int frame = 0;
void draw() {
  frame++;
  background(0);

  for (int i = 3; i<drawpoints; ++i) {
    if (!mousePressed) {
      float phase = (i)*0.2;
      x[i] = x[i] + random(-1, 1);
      y[i] = y[i] + random(-1, 1);
    } 

    pushMatrix();
    translate(x[i], y[i]);
    stroke(50+(frame)/2, 50+(frame/3+i), 150);
    scale(((frame+i)/20 )*0.1);
    lineStar();
    popMatrix();
  }
}
void mousePressed() {
  drawpoints=0;
  frame=0;
}

