
// Arrays for the starfield X, Y and radius.
float[] StarfieldX, StarfieldY, StarfieldR;


int numStars;
float maxRadius;
int k;

void setup() {
  size(500,500);
  numStars = 100;
  maxRadius = 2;
  k=0;
  // allocate Starfield arrays
  StarfieldX = new float[numStars];
  StarfieldY = new float[numStars];
  StarfieldR = new float[numStars];
  // fill Starfield arrays with random information
  for(int i=0; i<numStars; i++) {
    StarfieldX[i] = random(width);
    StarfieldY[i] = random(height);
    StarfieldR[i] = random(maxRadius);
  }
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  for(int i=0; i< numStars; i++) {
    ellipse(StarfieldX[i],StarfieldY[i],2*StarfieldR[i],2*StarfieldR[i]);
  }
  fill(#ffcc66);
  ellipse(k/2, 600-k/2,40,40);
  k++;
  fill(#009933);
  rect(0,450,500,50);
}


