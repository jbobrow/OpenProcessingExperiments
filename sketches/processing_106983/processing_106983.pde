
// initial angle of tree
float a = -HALF_PI;
// constant to determine future branch lenghts
float c = 1.4;

// values for perlin noise
float noiseTerm1 = 0.001;
float noiseTerm2 = 0.015;
float noiseTerm3 = 0.02;
float t1 = 0;
float t2 = 100;
float t3 = 1000;


void setup() {
  size(720, 720);
  //noLoop();
}

void draw() {
  background(0);
  stroke(255);
  // draw the tree
  drawTree(0.25*width, 0.75*height, 150, a);
  
  // update the perlin values
  t1 += noiseTerm1;
  t2 += noiseTerm2;
  t3 += noiseTerm3;
}

void drawTree(float x, float y, float branchLength, float theta) {
  theta += noise(t1);
  line(x, y, x + branchLength*cos(theta), y + branchLength*sin(theta));
  if (branchLength > 3) {
    branchLength /= c;
    drawTree(x + c*branchLength*cos(theta), y + c*branchLength*sin(theta), branchLength, theta - 0.9 + noise(t2));
    drawTree(x + c*branchLength*cos(theta), y + c*branchLength*sin(theta), branchLength, theta + 0.9 + noise(t3));
  }
  
}




