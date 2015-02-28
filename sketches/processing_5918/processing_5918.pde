
int maxBranch = 5;
float maxBranchAngle = 60;
float minBranchLength = 10;
float maxBranchLength = 50;

void setup() {
  size(600, 400);
  stroke(0,255,0,128);
  fill(255,128);
  strokeWeight(0.5);
  smooth();
}

void draw() {
  background(0);
  line(width/2,height,width/2,height-20);
  Branch(width/2,height-20,-90,8);
  noLoop();
}

void Branch(float rootX, float rootY, float direction, float depth) {
  if (depth <= 0) {
    ellipse(rootX, rootY, 5, 5);
    return;
  }
  int branches = int(random(1,maxBranch));
  for (int i = 0; i < branches; i++) {
    float newBranchAngle = random(direction-maxBranchAngle/2, direction+maxBranchAngle/2);
    if (newBranchAngle >= 360) {
      newBranchAngle -= 360;
    } 
    else if (newBranchAngle < 0) {
      newBranchAngle += 360;
    }
    float branchLength = random(minBranchLength, maxBranchLength);
    float newX = rootX+cos(radians(newBranchAngle)) * branchLength;
    float newY = rootY+sin(radians(newBranchAngle)) * branchLength;
    line(rootX, rootY, newX, newY);
    Branch(newX, newY, newBranchAngle, depth-1);
  }
}

void mouseClicked() {
  loop();
}








