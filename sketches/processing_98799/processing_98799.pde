
float angle = 20;
float treeSize = 100;//tamaño del árbol
float divisor = 0.82;
float maxRandomBranchSize = 0.02;
float maxRandomAngle = 35;
float maxLevel = 16;//nivel
color trunk = #8b4513;//color_tronco
color leaves = #009C22 & 0x70FFFFFF;
 
void setup()
{
  size(640, 480);
  smooth();
  stroke(0,0,0,64);
  arbol(320, 480);
}
 
void draw()
{
}
 
void arbol(float x, float y)
{
  background(255);
  translate(x, y);
  fibonacci(1);
}
 
void fibonacci(int level)
{
  if (level > maxLevel) 
      return;//caso base
  
  float branchSize = -treeSize * pow(divisor + random(maxRandomBranchSize * 2.) - maxRandomBranchSize, level);
  strokeWeight(0.1 * -(branchSize));
  stroke(lerpColor(trunk,leaves,level/maxLevel));
  line(0,0,0,branchSize);
  translate(0,branchSize);
  float thisAngle = angle + random(maxRandomAngle * 2) - maxRandomAngle;
  rotate(radians(-thisAngle));
  fibonacci(level + 1);/************PARTE RECURSIVA********/
  rotate(radians(thisAngle));
  thisAngle = angle + random(maxRandomAngle * 2.) - maxRandomAngle;
  rotate(radians(thisAngle));
  fibonacci(level + 1);/********PARTE RECURSIVA**********/
  rotate(radians(-thisAngle));
  translate(0,-branchSize);
}
