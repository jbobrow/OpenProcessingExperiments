
float strength = 1;

class Magnet {
  float x=0,y=0;
  float radius = 100;
  
  
  Magnet(float xPos, float yPos)
  {
  x = xPos; y = yPos;
  }  
  
  void affect(Node n) 
  {
   float dx = x - n.x;
   float dy = y - n.y;
   float d = mag(dx,dy);
   
   if (d > 0 && d < radius)
   {
    float s = d/radius;
    float f = 1 / pow(s,0.5) - 1;
    f = strength* f/radius;
   
    n.velocity.x += dx * f;
    n.velocity.y += dy * f; 
   }
  }
}

class Node extends PVector { 
  PVector velocity = new PVector();
  float minX=5, minY = 5, maxX=width-5,maxY=height-5;
  float damping = 0.1;
  
  Node(float xPos, float yPos) {
    x =xPos;
    y =yPos;
  }
  
  int density(float r, Node[] n)
  {
    int c = 0;
    for (int i =0; i < n.length; i++) {
      float dx = x - n[i].x;
      float dy = y - n[i].y;
      float d = sqrt(dx*dx + dy*dy);
      if (d < r) {
        c++;
      }
    }
    return (int) map(c,0,n.length, 0, 360);
  }
  
  void update() {
    x += velocity.x;
    y += velocity.y;
    
    if (x < minX)
    {
      x = minX - (x - minX);
      velocity.x = -velocity.x;
    } 
   
   if (y < minX)
    {
      y = minY - (y - minY);
      velocity.y = -velocity.y;
    }

    velocity.x *= (1-damping);
    velocity.y *= (1-damping);    
  }
}

int xCount = 70, yCount=40;
Node[] nodes = new Node[xCount*yCount];
  Magnet magnet;
  
  
void setup()
{
  colorMode(HSB, 360, 100, 100, 100); 
  size(800,500);
  initGrid();
  magnet = new Magnet(0,0);
  fill(100);
  smooth();
}

int c = 10;
int cdirection = 1;

void draw() {
  magnet.x = mouseX;
  magnet.y = mouseY;
  
    //background(360);

    if (c > 360) {cdirection = -1; }
    if (c < 0) {cdirection = 1;}
    if (mousePressed) {
      c+=cdirection*2;
    }


    for (int i = 0; i < nodes.length;i++)
    {
      if (mousePressed) {
      magnet.affect(nodes[i]);
      }
      nodes[i].update();
      int n = nodes[i].density(100,nodes);
      

    }
   int j = 0;
   stroke(0);
   for (int row=1; row <= xCount; row++) {
     beginShape();
     while ((j+1)/row != yCount) {
       
       line(nodes[j].x,nodes[j].y,nodes[j+1].x,nodes[j+1].y);
       stroke(c,100,100);
       j++;
     }
     endShape();
     j++;
   }
 } 

void keyPressed()
{
 if (key=='n')
{
  strength = -strength;
} 

 if (key=='+')
 {
  strength = strength++; 
 }
 
  if (key=='-')
 {
  strength = strength--; 
 }
 
  if (key=='r') {
   background(360);
   initGrid();  
  }
}

void initGrid() {
 int i = 0;
 for (int x=0; x < xCount;x++) {
   for (int y=0; y < yCount;y++) {
     float xPos = x*(width/xCount);
     float yPos = y*(height/yCount);
     nodes[i] = new Node(xPos, yPos);
     i++;
   }
 } 
}


