
int w = 400;
int h = 400;
float t;
int r = 150;

int se = 30;
int le = 50;



void setup() {
  size(400,400);
  background(0);

  smooth();
}

void draw() {
  noStroke();
  fill(255);
  rect(w/2, 0, w/2, h);
  fill(0);
  rect(0, 0, w/2, h);

  fill(180, 0, 0);
  ellipse(w/2+r*sin(t-200), h/2+r*cos(t-200), se, se);
  ellipse(w/2+r*sin(t), h/2+r*cos(t), le, le);
  ellipse(w/2+r*sin(t+200), h/2+r*cos(t+200), se, se);

  if (mousePressed == true) {
  }
  else {
    ellipse(w/2+r*sin(-t-200), h/2+r*cos(-t-200), se, se);
    ellipse(w/2+r*sin(-t), h/2+r*cos(-t), le, le);
    ellipse(w/2+r*sin(-t+200), h/2+r*cos(-t+200), se, se);
  }

  t += 0.018;
}

