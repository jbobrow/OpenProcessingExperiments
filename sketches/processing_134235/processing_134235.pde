
float branches = 12;
int levelCount = 6;

float startLength = 120;
float branchAngle = PI/2;

int design = 0;

float t;

void setup() {
  size (700,700);
  smooth();
  colorMode(HSB, 100, 100, 100);
}

void draw() {
  designBG();
  translate(width/2,height/2);
  for (float i = 0; i <TWO_PI; i+=PI/(branches/2)) {
    if (i < TWO_PI-0.1) {
      pushMatrix();
      rotate(i);
      drawBranch(startLength, 0, levelCount);
      popMatrix();
    }
  }
}
void drawBranch(float tin, float j, int level) {
  pushMatrix();
  
  branchAngle = map(mouseX, 0, width, 0, HALF_PI);
  levelCount = round(map(mouseY, 50, height, 6, 6)); 
  
  
  beginShape(LINES);
  vertex(0,0);
  rotate(j+sin(t)/(level*10));
  vertex(0, tin);
  endShape();
  
 translate(0, tin);
  
  t += 0.00001;
  
  if (level > 0) {
    drawBranch(2*tin/3, branchAngle/level, level-1);
    drawBranch(2*tin/3, -branchAngle/level, level-1);
  }
  
  popMatrix();
  
}

void designBG() { // Defines appearance of background
  if (design == 1) {
    fill(100,100,40,10);
    rect(0,0,width,height);
  } else {
    background(100);
  }
}
void keyPressed() {
  if (key == 'n') branches += 1; // add branches
  else if (key == 'm') branches -= 1; // substract branches
}

    
  
  
