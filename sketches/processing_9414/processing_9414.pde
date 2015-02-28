
int list1=0;
int i; 
int j; 
int nj; 
float d; 
float abs_speed; 
float f_corr1; 
float f_corr2; 
float f_corr3; 
int n = 300;  //number of boids
int count=0;  //counting shifts
int mouseC=0; //num of mouse clicks
int newPos=0;
int gstrength = 35;
int grange = 40;
float x1 = 0;
float x2 = 0;
float y1 = 0;
float y2 = 0;
float r=2.0;
ArrayList nodes;
ArrayList Inodes;
MyBoid[] bv = new MyBoid[n]; 
Position center = new Position(0, 0); 
Speed avgspd = new Speed(0, 0); 
float distToNode = 0; 
float distToNode2 = 0; 
 
 
void setup()
{ 
  size(1800, 800); 
  noStroke(); 
  nodes = new ArrayList();
  Inodes = new ArrayList();  // Create an empty ArrayList 
  for(i=0; i<n; i++) 
  { 
    bv[i] = new MyBoid(i); 
    bv[i].position.x = random(0, width); 
    bv[i].position.y = random(0, height);
    bv[i].speed.x = random(0, 2); 
    bv[i].speed.y = random(0, 2); 
  } 
} 

void keyPressed ()
{
    if (key == CODED) {
      if (keyCode == UP) {
          gstrength++;
          println("strength: " + gstrength);
      }    
      if (keyCode == DOWN) {
         gstrength--;
         println("strength: " + gstrength);
      }  
      if (keyCode == RIGHT) {
         grange+=10;
         println("range: " + grange);
      }  
      if (keyCode == LEFT) {
         grange-=10;
         println("range: " + grange);
      }    
    } 
}

void mousePressed() 
{
    nodes.add(new MyNode(mouseX, mouseY)); 
    //shift and replace nodes to create a line
    mouseC++; //count number of times mouse clicked
     if(nodes.size() > 1)
    {
      int len1 = nodes.size()-1; 
      MyNode node1 = (MyNode) nodes.get(mouseC-2);
      MyNode last = (MyNode) nodes.get(len1);
      //nodes.remove(last); // get/remove last value
      x1 = node1.position.x;
      x2 = last.position.x;
      y1 = node1.position.y;
      y2 = last.position.y;
      distToNode2 = dist(x1, y1, x2, y2); 
      for(float l= 1; l < 10; l++)
      {
          float newX = ((x2-x1)/10)*l;
          float newY = ((y2-y1)/10)*l;
          Inodes.add(new MyNode(newX+x1, newY+y1));
          count++; 
      }  
    }
}
 
void draw()
{ 
  
  background(#CCCCCC); 
  for(i=0; i<n; i++)
  { 
    center.x = 0.0; 
    center.y = 0.0; 
    avgspd.x = 0.0; 
    avgspd.y = 0.0; 
    nj = 0; 
    for(j=0; j<n; j++)
    { 
      if(j != i) 
      { 
        d = dist(bv[i].position.x, bv[i].position.y, bv[j].position.x, bv[j].position.y); 
        if(d < 50) { 
          center.x += bv[j].position.x; 
          center.y += bv[j].position.y; 
          avgspd.x += bv[j].speed.x; 
          avgspd.y += bv[j].speed.y; 
          if(d < 20) 
          { 
            bv[i].speed.x -= ruleTwo(bv[i].position.x, bv[j].position.x, d); 
            bv[i].speed.y -= ruleTwo(bv[i].position.y, bv[j].position.y, d); 
          } 
          nj += 1; 
        } 
      }
    } 
    if(nj > 0) 
    { 
      bv[i].speed.x += ruleOne(bv[i].position.x, center.x/nj); 
      bv[i].speed.y += ruleOne(bv[i].position.y, center.y/nj); 
      bv[i].speed.x += ruleThree(bv[i].speed.x, avgspd.x/nj); 
      bv[i].speed.y += ruleThree(bv[i].speed.y, avgspd.y/nj); 
    } 
    bv[i].speed.x -= 0.005*bv[i].speed.x; 
    bv[i].speed.y -= 0.005*bv[i].speed.y; 
    for(int h=0; h< nodes.size(); h++) //repelling
    {
      MyNode node = (MyNode) nodes.get(h);
      distToNode = dist(bv[i].position.x, bv[i].position.y, node.position.x, node.position.y); 
      bv[i].speed.x -= ruleFour(bv[i].position.x, node.position.x, distToNode, grange, gstrength); 
      bv[i].speed.y -= ruleFour(bv[i].position.y, node.position.y, distToNode, grange, gstrength); 
    } 
      for(int h=0; h< Inodes.size(); h++) //repelling
    {
      MyNode node = (MyNode) Inodes.get(h);
      distToNode = dist(bv[i].position.x, bv[i].position.y, node.position.x, node.position.y); 
      bv[i].speed.x -= ruleFour(bv[i].position.x, node.position.x, distToNode, grange, gstrength); 
      bv[i].speed.y -= ruleFour(bv[i].position.y, node.position.y, distToNode, grange, gstrength); 
    } 
    bv[i].move();
      
    //wraparound
    if (bv[i].position.x < -r) bv[i].position.x = width+r;
    if (bv[i].position.y < -r) bv[i].position.y = height+r;
    if (bv[i].position.x > width+r) bv[i].position.x = -r;
    if (bv[i].position.y> height+r) bv[i].position.y = -r;
    
    fill(#000099); 
     
    abs_speed = sqrt(bv[i].speed.x*bv[i].speed.x + bv[i].speed.y*bv[i].speed.y); 
    if(abs_speed != 0) { 
      f_corr1 = 10/abs_speed; 
      f_corr2 = bv[i].speed.x/abs_speed; 
      f_corr3 = -bv[i].speed.y/abs_speed; 
      triangle(bv[i].position.x+bv[i].speed.x*f_corr1, bv[i].position.y+bv[i].speed.y*f_corr1, bv[i].position.x+2*f_corr3, bv[i].position.y+2*f_corr2, bv[i].position.x-2*f_corr3, bv[i].position.y-2*f_corr2); 
    } 
    else triangle(bv[i].position.x, bv[i].position.y+10, bv[i].position.x-2, bv[i].position.y, bv[i].position.x+2, bv[i].position.y); 
  } 
  //node
  nj = 0; 
  center.x = 0; 
  center.y = 0; 

  /*for(int h=0; h<nn; h++)
  {
    for(j=0; j<n; j++) 
    { 
  
      d = dist(node[h].position.x, node[h].position.y, bv[j].position.x, bv[j].position.y); 
      if(d < 100)
      { 
        center.x += bv[j].position.x; 
        center.y += bv[j].position.y; 
        nj += 1;
      } 
    } 
  }*/

  fill(#FF0000); 
  for(int h=0; h<nodes.size(); h++)
  {
    /*if(nodes.size() > 1)
    {
      int len1 = nodes.size()-1;
      MyNode node = (MyNode) nodes.get(mouseC-2);
      MyNode last = (MyNode) nodes.get(len1);
    triangle(node.position.x, node.position.y+15, node.position.x-3, node.position.y, node.position.x+3, node.position.y);
    stroke(1);
    line(node.position.x,node.position.y,last.position.x,last.position.y);
    }
    else
    {  */
       MyNode node = (MyNode) nodes.get(h);
       triangle(node.position.x, node.position.y+15, node.position.x-3, node.position.y, node.position.x+3, node.position.y);   
   // }    
  }
  for(int h=0; h<Inodes.size(); h++)
  {
    
       MyNode node = (MyNode) Inodes.get(h);
       ellipse(node.position.x, node.position.y, 3, 3);
       //triangle(node.position.x, node.position.y+15, node.position.x-3, node.position.y, node.position.x+3, node.position.y);
  }     
}
 
float ruleOne(float p, float c) { 
  return (c - p)/1500; 
} 
float ruleTwo(float p, float p2, float d) { 
  return ((20/(d+1)-1)*((p2 - p)/d)); 
} 
float ruleThree(float s, float avgs) { 
  return (avgs - s)/15; 
} 
float ruleFour(float p, float p_pred, float d, float range, int strength) 
{ 
  if (d < range) 
    return ((strength/(d+1)-1)*((p_pred - p)/d)); 
  else 
    return 0.0; 
} 

public class MyNode 
{
  //public int index; 
  public Position position; 
  public Speed speed; 
   
  MyNode(float x,float y) { 
    //this.index = idx; 
    this.position = new Position(x, y); 
    this.speed = new Speed(0, 0); 
  } 
   
  /*public void move() { 
    this.position.x += this.speed.x; 
    this.position.y += this.speed.y; */
} 
 
public class MyBoid 
{
  public int index; 
  public Position position; 
  public Speed speed; 
   
  MyBoid(int idx) { 
    this.index = idx; 
    this.position = new Position(0, 0); 
    this.speed = new Speed(0, 0); 
  } 
   
  public void move() { 
    this.position.x += this.speed.x; 
    this.position.y += this.speed.y; 
  } 
} 
 
public class Position { 
  public float x; 
  public float y; 
   
  Position(float ax, float ay) { 
    this.x = ax; 
    this.y = ay; 
  } 
} 
 
public class Speed { 
  public float x; 
  public float y; 
   
  Speed(float sx, float sy) { 
    this.x = sx; 
    this.y = sy; 
  } 
} 





