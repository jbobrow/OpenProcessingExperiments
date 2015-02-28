
float angle = 10;
float treeSize = 300;
float divisor = 0.7;
float maxRandomBranchSize = 0.03;
float maxRandomAngle = 80;
float maxLevel = 10;
int Y_AXIS = 1;

 
void setup()
{
  size(450, 650);
  smooth();
  drawTree(width / 2, height);
}
 
void draw()
{
}
 
void mousePressed()
{   
  drawTree(width / 2, height);
}
 
void drawTree(float x, float y)
{
  pushMatrix();
  pushStyle();
  color b1 = color(0, 190, 190);
  color b2 = color(20, 20, 20);
  setGradient(0, 0, width, height, b1, b2, Y_AXIS);

  translate(x, y);
  stroke(0,0,0,220);
  drawBranch(1);
  stroke(25,5,118,220);
  drawBranch(2);
  stroke(116,27,180,220);
  drawBranch(3);
  stroke(225,7,229,220);
  drawBranch(4);
  stroke(0,0,0,220);
  drawBranch(5);
  popStyle();
  popMatrix();
}
 
void drawBranch(int level)
{
  if (level > maxLevel) return;
  float branchSize = -treeSize * pow(divisor + random(maxRandomBranchSize * 2.) - maxRandomBranchSize, level);
  strokeWeight(0.4 * -(branchSize));
  line(0,0,0,branchSize);
  translate(0,branchSize);
  float thisAngle = angle + random(maxRandomAngle * 2.) - maxRandomAngle;
  rotate(radians(-thisAngle));
  drawBranch(level + 1);
  rotate(radians(thisAngle));
  thisAngle = angle + random(maxRandomAngle * 2.) - maxRandomAngle;
  rotate(radians(thisAngle));
  drawBranch(level + 1);
  rotate(radians(-thisAngle));
  translate(0,-branchSize);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){

  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  if(axis == Y_AXIS){
    for (int i=x; i<=(x+w); i++){
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }  
}


