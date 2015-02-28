
float count = 12; // Number of the branches
int levelCount = 6; // Number of subbranches

float startLength = 180; // length of the first branch
float globA = PI/2; // Angle of the branches

int design = 0; // Overall appearance

int clickCount;
float t;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB, 100, 100, 100);
  clickCount = 0;
}

void draw() {
  designBG();
  translate(width/2, height/2);
  for (float i = 0; i<TWO_PI; i+=PI/(count/2)) { // Draw branches around the center
    if (i < TWO_PI-0.1) { // Fix for no doubled last branch
      pushMatrix();
      rotate(i);
      drawBranch(startLength, 0, levelCount);
      popMatrix();
    }
  }
}

void drawBranch(float len, float a, int level) { // Recursive branch function
  pushMatrix();

  globA = map(mouseX, 0, width, 0, HALF_PI); // Angle dependent of mouse movement along x-axis
  levelCount = round(map(mouseY, 50, height-50, 1, 6)); // Level number dependent of mouse movement along y-axis

  designBranch(level); // Branch appearance

  beginShape(LINES); // Branch shape (a line)
  vertex(0, 0);
  rotate(a+sin(t)/(level*10)); // sin()-function brings it to life
  vertex(0, len);
  endShape();

  translate(0, len); // move coordinate axis for next branch
  
  t += 0.00001; // t += 0.00001;

  if (level > 0) { // Recursion stuff
    drawBranch(len/2, globA/level, level-1);
    drawBranch(len/2, -globA/level, level-1);
  }

  popMatrix();
}

void designBG() { // Defines appearance of background
  if (design == 1) {
    fill(100,100,40,10);
    rect(0,0,width,height);
  }

  else if (design == 2) {
    noStroke();
    background(20,40,20);
    fill(20,40,30);
    ellipse(width/2,height/2,width-20,height-20);
  }

  else {
    background(100);
  }
}
void designBranch(int level) { // Defines appearance of the branches
  noFill();
  strokeCap(ROUND);
  if (design == 1) {
    strokeCap(SQUARE);
    strokeWeight(level*2);
    float cVar = level+1;
    stroke(100, map(level, 0, levelCount, 0, 100), 100, 10);
  }

  else if (design == 2) {
    strokeWeight(level*4);
    float cVar = level+1;
    stroke(map(level, 0, levelCount, 10, 30), 70, 90);
  }

  else {
    strokeWeight(1);
    stroke(100, 0, 0);
  }
}

void keyPressed() {
  if (key == 'n') count += 1; // add branches
  else if (key == 'm') count -= 1; // substract branches
}

void mouseClicked() {
  clickCount += 1;
    // choose flavour
  if(clickCount == 1) design = 1;
  else if(clickCount == 2) design = 2;
  else if(clickCount == 3) { design = 3; clickCount = 0; }
  else design = 0;
  
}


