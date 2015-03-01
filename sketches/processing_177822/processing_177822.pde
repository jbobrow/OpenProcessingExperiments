
PImage tree;
PImage squirrel;
float mx;
float my;

void setup()
{
  size(600,400);
  tree = loadImage("tree.png");
  squirrel = loadImage("squirrel.png");
  noCursor();
}

void draw()
{
  image(tree,0,0);
  pushMatrix();
  imageMode(CENTER);
  
  if(mouseX > 325 && mouseX < width)
  {
  float whiteR = map(mouseX,325,510,0,150);
  tint(150+whiteR,150+whiteR,150+whiteR);
  }
  
  if(mouseX > 0 && mouseX < 326)
  {
  float whiteL = map(mouseX,0,325,300,0);
  tint(150+whiteL,150+whiteL,150+whiteL);
  }
  
  float treedistance = map(mouseX,0,600,303,510);
  
  image(squirrel,treedistance,mouseY);

  noTint();
  
  imageMode(CORNER);
  
  popMatrix();
  
  println(mouseX);
}

void mouseClicked()
{
  
}  


