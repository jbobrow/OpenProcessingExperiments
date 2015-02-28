
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65570*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// original coded by Raven Kwok (Guo Ruiwen)

Node [] testNodes = new Node[10];

void setup() 
{
  size(512, 512);
  frameRate(30);
  smooth();
  for (int i=0;i<testNodes.length;i++) 
    testNodes[i] = new Node(i,random(100), random(100),width,height);
}

void draw() 
{
  background(0);
  for (int i=0;i<testNodes.length;i++) 
    testNodes[i].update();
  
  generateCircumcircle(testNodes);
}

void keyPressed()
{
  if (key == 's') save("CircumCircleDance.png");
}

void generateCircumcircle(Node[] nodes) 
{
  for (int i=0;i<nodes.length;i++) 
    for (int j=i+1;j<nodes.length;j++) 
      for (int k=j+1;k<nodes.length;k++) 
      {
        float circumcircleX = circumCircle(nodes[i].x,nodes[i].y,nodes[j].x,nodes[j].y,nodes[k].x,nodes[k].y).x;
        float circumcircleY = circumCircle(nodes[i].x,nodes[i].y,nodes[j].x,nodes[j].y,nodes[k].x,nodes[k].y).y;
        float diam = dist(nodes[i].x, nodes[i].y, circumcircleX, circumcircleY)*2;
        float alfa = (255-map(diam,0,255,100,200))/4;
        strokeWeight(11+i+j+k);
        noFill();
        stroke((circumcircleX*5) % 255, (circumcircleY-66*sin(0.01*frameCount))% 255 , 18*(i+j+k), alfa);
        ellipse(circumcircleX, circumcircleY, 2*diam, 2*diam);
      }
}

// get circle given by 3 points
PVector circumCircle(float x1,float y1,float x2,float y2,float x3,float y3)
{
  float slopeA = (y2-y1)/(x2-x1);
  float slopeB = (y3-y2)/(x3-x2);
  float circumcircleX = (slopeA*slopeB*(y1-y3)+slopeB*(x1+x2)-slopeA*(x2+x3))/(2*(slopeB-slopeA));
  float circumcircleY = (-1/slopeA)*(circumcircleX-(x1+x2)/2)+(y1+y2)/2;
  PVector circleCoords = new PVector(circumcircleX,circumcircleY);
  return circleCoords;
}

class Node
{
  int index;
  float x,y;
  float xSeedInitial,ySeedInitial;
  float xSeedOffset,ySeedOffset;
  float xSeed,ySeed;
  float xRange,yRange;
  Node(int index,float xSeedInitial,float ySeedInitial,float xRange,float yRange)
  {
    this.index = index;
    this.xSeedInitial = xSeedInitial;
    this.ySeedInitial = ySeedInitial;
    this.xRange = xRange;
    this.yRange = yRange;
  }
  void update()
  {
    xSeedOffset = lerp(xSeedOffset,float(mouseX)/500,0.1);
    ySeedOffset = lerp(ySeedOffset,float(mouseY)/500,0.1);
    xSeed = xSeedInitial+xSeedOffset;
    ySeed = ySeedInitial+ySeedOffset;
    x = noise(xSeed)*xRange;
    y = noise(ySeed)*yRange;
  }
}


