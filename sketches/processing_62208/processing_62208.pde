
int body=50;
float r;
float g;
float b;


void setup() {
  size(500, 500);
  smooth();
}
void draw() {
  background(255);
  noStroke();
  fill(r, g, b);
  ellipse(width/2, height/2, body, body);
}

void mousePressed() {
  body= body + 5;
  r= random(255);
  g= random(255);
  b= random(255);
}

void keyPressed() {
  body=50;
}


