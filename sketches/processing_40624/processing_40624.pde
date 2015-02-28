
void setup(){
  size(400, 400);
  noStroke();
  background(255);
}

// initialize variables
int i;
int n;

void draw(){
  // draw horizontal gradient
  for (i=0; i<=100; i++) {
    colorMode(HSB, 50);
    fill(i, 100, 100, 0.5);
    rect(i*10, 0, 10, height);
  }
  // draw vertical gradient
  for (n=0; n<=100; n++) {
    colorMode(HSB, 50);
    fill(n, 100, 100, 0.5);
    rect(0, n*10, width, 10);
  }
}               
