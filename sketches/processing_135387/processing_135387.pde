
int n = 256;
int minRad = 50;
int maxRad = 600;
float nfAng = 0.01;
float nfTime = 0.005;

void setup() {
  size(800, 800);
  background(255);
  noFill();
  stroke(0, 15);
}

void draw() 
{
  translate(width/2, height/2);
  beginShape();
  for (int i=0; i<n; i++) {
    float ang = map(i, 0, n, 0, TWO_PI);
    float rad = map(noise(i*nfAng, frameCount*nfTime), 0, 1, minRad, maxRad);
    float x = rad * cos(ang);
    float y = rad * sin(ang);
    curveVertex(x, y);
  }
  endShape(CLOSE);
}

void mousePressed() {
  background(255);
}

void keyPressed() {
  if (key==' ') {
    background(255);
  }
}


