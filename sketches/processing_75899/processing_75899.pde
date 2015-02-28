
int t = 0;
int n = 0;
int nn = 0;
int s = 40; // stretching factor

void setup() {
  size(800,500);// size of the canvas
  background(255);// set background white
  frameRate(1); // limit the number of frames per second
}

void draw() {
  float r = random(0,1); // draw random number between 0 and 1
  if (r < 0.5) { // happens with probability 0.5
    // go up
    nn = n+1;
  } else {
    nn = n;
  }
  line(s*t,height-1-s*n,s*(t+1),height-1-s*nn);
  ellipse(s*(t+1),height-1-s*nn,5,5);
  t = t+1;
  n = nn;
  if (t>width/s) {
    t = 0;
    n = 0;
  }
}
