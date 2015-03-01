
// N lines
int num =8;

float step, sz, offSet, theta, angle;

void setup() {
  size(600, 600);
  
  // Linewidth
  strokeWeight(5);
  noFill();
  // Line color
  stroke(235);
  
  // Spacing 
  step = 22;
}

void draw() {
  background(20);
  translate(width/2, height/2);
  angle=0;
  for (int i=0; i<num; i++) {
    sz = i*step;
    // ofset in radians
    float offSet = (PI/num)*i;
    // end point of arch in radians
    float arcEnd = map(sin(theta+offSet),-1,1, 0+0.01, PI);
    // (Centre of circle | Width and height in px | radians start and stop )
    arc(0, 0, sz, sz, PI-arcEnd, PI+arcEnd);
  }
  arc(0, 0, 1, 1, 0, TWO_PI);
   colorMode(RGB);
  // resetMatrix();
  
  //animation speed
  theta += .04;
  
}
