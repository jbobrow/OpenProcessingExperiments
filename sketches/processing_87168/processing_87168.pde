
float x=0;
float y=0;


void setup () {
  size(600, 600);
  colorMode(HSB);
  background(40, 150, 255);
  smooth();
}

void draw () {
  x+=0.02;
  y+=0.005;
  float n = noise(x);
  float t = noise(y);

  pushMatrix();
  stroke(100, 3, 11,40);
  translate(310, -140);
  rotate(.79);
  fill(100*n-10, 255, 255, t*400);
  rect(t*(width)-50, n*height+10, 50*n, height/2*n);
  rect( n*height+10, t*(width)-50, height/2*n, 50*n);
  popMatrix();

  pushMatrix();
  translate(300, 700);
  rotate(3.95);
  rect(t*(width)-50, n*height+10, 50*n, height/2*n);
  rect( n*height+10, t*(width)-50, height/2*n, 50*n);
  popMatrix();
}



