
// blah

float x, y, deg=0, r, col;
int trailN = 511;
float trailL = 0.04;
int dots[ ] = new int[trailN];


void setup(){
  size(600, 600, P2D);
  smooth();
  fill(255);
  noStroke();
}

void draw() {
  background(128, 0, 128); 

  deg += trailL; r = radians(deg);
  
  for(int i = 0; i < trailN; i++ ) {
    
    x =  (width / 2) + (250 * sin(31 * (r + radians(i * trailL)))); y = (height / 2) + (250 * cos(26 * (r + radians(i * trailL))));

    fill(128, i / 2, 128);

    ellipse(x, y, (i * 50) / trailN, (i * 50) / trailN);
  }
}

void graph() {
}


