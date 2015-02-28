
int n=74;
int border=2;
float t = -30;

float[] rads = new float[n];
void setup() {
  size(800, 400);
  background(240);
  frameRate(5);
  noStroke();
  smooth();
}

void draw() {
  fill(240, 30);
  rect(0, 0, width, height);
  t = t + 30;
  if (t > 500) {
    t = -30;
  }

  n=0;
  for (int i=30; i<width-30; i=i+10) { 

    float rad=random(4, 20);
    rads[n] = rad;
    fill(0, 100, t/2);
    ellipse(i, t, rad+border, rad+border);
    n++;
  }
  
  n=0;
  for (int i=30; i<width-30; i=i+10) { 

    float rad = rads[n];
    rads[n] = rad;
    fill(255);
    ellipse(i, t, rad, rad);
    n++;
  }
  if (mousePressed) {
  } 
  else {
    filter(ERODE);
  }
}

