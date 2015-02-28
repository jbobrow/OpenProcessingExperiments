

int seconds = 0;
int minutes = 0;
int hours = 0;

int nextSecond;

PImage tree;
PImage ground;
PImage leaf;

ArrayList trees;
ArrayList leaves;
ArrayList fireflies;

int activeFireflies = 0;

int treeIndex;

void setup()
{
  size(800,600);
  tree = loadImage("tree.png");
  ground = loadImage("ground.png");
  leaf = loadImage("leaf.png");
  trees = new ArrayList();
  leaves = new ArrayList();
  fireflies = new ArrayList();
  
  for(float i=0; i<12;i++)
  {
    Tree tTree = new Tree(30+i*800/11.5, 500, pow((i-5.5),2)/30+0.3);
    trees.add(tTree);
    
    for(int j=0; j<5; j++)
    {
      Firefly tFirefly = new Firefly(tTree.xPos + random(-200,200)*tTree.treeScale, tTree.yPos + random(-400,-200)*tTree.treeScale);
      fireflies.add(tFirefly);
    }
  }
  
  nextSecond = second() + 1;
}

void draw()
{ 
  hours = hour();
  minutes = minute();
  seconds = second();
  
  /*
  hours+=1/3600;
  minutes+=1/60;
  seconds++;
  */

  background(50);
  
  image(ground,0,0);
  
  //-----------------------------------trees
  for(int i=6; i<trees.size();i++)
  {
    float d = abs(i-hours%12);
    if(d==0){
      tint(255);
      treeIndex = i;
    }
    else{
      tint((1/(2*d))*255);
    }
    Tree tTree = (Tree) trees.get(i);
    tTree.update();
    noTint();
  }
  for(int i=5; i>-1; i--)
  {
        float d = abs(i-hours%12);
    if(d==0){
      tint(255);
      treeIndex = i;
    }
    else{
      tint((1/(2*d))*255);
    }
    Tree tTree = (Tree) trees.get(i);
    tTree.update();
    noTint();
  }
  
  //--------------------------------------------------leaves
  if(minutes == 0){
    for(int i=0; i<leaves.size(); i++){
      leaves.remove(i);
      i--;
    }
  }
  
  while(leaves.size() < minutes)
  {
    Tree tTree = (Tree) trees.get(treeIndex);
    int offsetY = -400;
    float offsetX = random(-150,150);
    
    Leaf tLeaf = new Leaf(tTree.xPos + offsetX * tTree.treeScale, tTree.yPos + offsetY * tTree.treeScale, tTree.treeScale);
    leaves.add(tLeaf);
  }
  
  for(int i=0; i<leaves.size(); i++)
  {
    Leaf tLeaf = (Leaf) leaves.get(i);
    tLeaf.update();
  }
  
  //-----------------------------------------------------fireflies
  if(seconds == 0)
  {
    for(int i=0; i<fireflies.size(); i++)
    { 
      Firefly tFirefly = (Firefly) fireflies.get(i);
      tFirefly.visible = false;
      activeFireflies = 0;
    }
  }
  
  while(activeFireflies < seconds)
  {
     Firefly tFirefly = (Firefly) fireflies.get(activeFireflies);
     tFirefly.visible = true;
     activeFireflies++;
  }
  
  for(int i=0; i<fireflies.size(); i++)
  { 
    Firefly tFirefly = (Firefly) fireflies.get(i);
    tFirefly.update();
  }
}

//----------------------------------------------------
class Tree
{
  float xPos;
  float yPos;
  float treeScale;
  
  Tree(float x, float y, float s)
  {
    xPos = x;
    yPos = y;
    treeScale = s;
  }
  
  void update()
  {
    pushMatrix();
    translate(xPos,yPos);
    scale(treeScale);
    image(tree, -400, -500);
    popMatrix();
  }
}

class Leaf
{
  float xPos;
  float yPos;
  float leafScale = 1;
  float startY;
  float xVel = random(-3,3);
  float endY = random(350,430);
  
  Leaf(float x, float y, float s)
  {
    xPos = x;
    yPos = y;
    startY = y;
    leafScale = s;
  }
  
  void update()
  {
    if(yPos < (startY + endY*leafScale)){
      yPos+=10*leafScale;
      xPos+=xVel*leafScale;
    }
    pushMatrix();
    tint(255,200);
    translate(xPos,yPos);
    scale(leafScale);
    
    
    image(leaf, 0, 0);
    noTint();
    popMatrix();
  }
}

class Firefly
{
  float xPos;
  float yPos;
  float flyScale = random(3,5);
  float alphaMax = 255;
  float alphaValue = 0;
  
  boolean visible = false;
  
  Firefly(float x, float y)
  {
    xPos = x;
    yPos = y;
  }
  
  void update()
  {
    if(!visible && alphaValue > 0)
    {
      alphaValue-=10;
    }
    else if(visible)
    {
      if(alphaValue < alphaMax){
        alphaValue+=5;
      }
    }
    noStroke();
    fill(255,253,175,alphaValue);
    ellipse(xPos,yPos,flyScale,flyScale);
  }
}
  

