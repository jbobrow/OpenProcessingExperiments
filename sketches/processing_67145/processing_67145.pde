
float yoffset = 0;
int seed = 5;        // Random seed to control randomness while drawing the tree
int maxLevel = 8;
float rx = width/2;
color trunk = color(255, 150, 80);
color leaves = color(255, 180, 200);
color leaves2 = color(255, 255, 255);
 
void setup() {
  size(640, 360);
  smooth();
  strokeCap(ROUND);
}
 
void draw() {
  background(0);
   
  // Start the tree form bottom of the screen
  translate(rx, height);
  // Move along througn noise
  yoffset += 0.005;
  randomSeed(seed);
  // Start the recursive branching!
  branch(100, 0, 1);
}
 
void branch(float heigh, float xoffset, int level) {
  // thickness of the branch is mapped to its length
  float tob = map(heigh, 2, 100, 1, 6);
  strokeWeight(tob);
   
  // draw the branch
  stroke(lerpColor(trunk, leaves, level/maxLevel));
  line(0, 0, 0, -heigh);
  translate(0, -heigh);
  heigh *= 0.7f;      // 0.66
  // Move along through noise space
  xoffset += 0.1;
   
  if (heigh > 2) {
    // random number of branches
    int n = int (random (1, 4));
    for( int i = 0; i < n; i++) {
      float theta = map( noise( xoffset + i, yoffset), 0, 1, -PI/2, PI/2);
      if (n % 2 == 0) theta += -1;
       
      pushMatrix();
      rotate(theta);
      branch(heigh, xoffset, level + 1);
      popMatrix();
    }
  }
   subbranch(heigh, xoffset ,level);
}
 
void subbranch(float h, float xoffset,int l) {
  if ( l > maxLevel) return;
  scale(0.8);
  float tob = map(h, 2, 120, 1, 5);
  stroke(lerpColor(trunk,leaves2,l/maxLevel));
  strokeWeight(tob);
   
  line(0, 0, 0, -h);
  translate(0, -h);
  h *= 0.7f;
   
  if(h == 0) {
    fill(leaves2);
    ellipse(0,0,10,10);
  }
  if(h > 2) {
    int n = int(random(1, 4));
    for( int i = 0; i < n; i++) {
      float theta = map(noise(xoffset + i, yoffset), 0, 1, -PI/2, PI/2);
      if (n % 2 == 0) theta += -1;
       
      pushMatrix();
      rotate(theta);
      subbranch(h , xoffset,l + 1);
      popMatrix();
    }
  }
}
 
void mouseClicked() {
  // New tree starts with new noise offset and new random seed
  yoffset = random(1000);
  seed = millis();
  rx = mouseX;
}

