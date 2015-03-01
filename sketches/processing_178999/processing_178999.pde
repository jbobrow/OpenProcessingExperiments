
class treeitm
{
  float x, hgt;
  float rad;
  
  public treeitm(float xp, float ihgt, float irad)
  {
    rad=irad;
    x = xp;
    hgt = ihgt;
  }
  
  void draw()
  {
     stroke(30,60,10);
     noFill();
     strokeWeight(8);
     line(x, height, x, hgt);
     ellipseMode(CENTER);
     ellipse(x, hgt, rad, rad);
     
  }
}


ArrayList<treeitm> trees;
int numtrees = 6;

void setup()
{
  size(640,480);
  pushMatrix();
  background(255);
  
  setupTrees();
  drawTrees();
}

void setupTrees()
{
  trees = new ArrayList<treeitm>();
  float lastCanopysize = 0;
  
  for(int i =0; i < numtrees; i++)
  {
    
    float canopySize = 40+random(100);
    trees.add(new treeitm(((width/3)/numtrees)*i, canopySize + random(height-(canopySize*2)), canopySize));
  }
}


void keyPressed()
{
    background(255);
    setupTrees();
    drawTrees();
}


void drawTrees()
{
  pushMatrix();
  translate(width/3, 0);
  
  for(int i=0; i < trees.size();i++)
  {
    treeitm tr = (treeitm)trees.get(i);
    tr.draw(); 
  }
  popMatrix();
  paper();
}

void paper() {
  strokeWeight(1);
  noStroke();
  for (int i = 0; i<width-1; i+=2)
  {
    for (int j = 0; j<height-1; j+=2)
    {
      fill(random(195, 250), 25);
      rect(i, j, 2, 2);
    }
  }
}
