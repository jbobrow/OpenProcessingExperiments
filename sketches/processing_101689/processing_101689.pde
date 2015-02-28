
float n;
float rate, trate;
float minrad, maxrad;

void setup() {
  size (displayWidth, displayHeight);
  //rate= 0.1;
  trate = 0.01;
  minrad =  0;
  //maxrad = 500;  
  background(0);
}

void draw() {
  rate = map(mouseX, 0, width, 0, 0.15);
  n = map(mouseY, 0, height, 0, 500);
  maxrad = map(mouseX, 0, width, 0, 2000); 
  //refreshScreen(10);
  //background(0);
  stroke(255, 60);
  fill(0, 5);

  beginShape();
  for (int i=0; i<n; i++) {
    float ang = map(i, 0, n, 0, TWO_PI);
    float rad = map(noise(rate*i, trate*frameCount), 0, 1, minrad, maxrad);
    float x = width/2 + rad*cos(ang);
    float y = height/2 + rad*sin(ang);
    curveVertex(x, y);
  }
  endShape(CLOSE);
}

void refreshScreen(float alph) {
  fill(0, alph);
  rect(0, 0, width, height);
}



