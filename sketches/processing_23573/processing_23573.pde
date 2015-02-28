
float s = 6;//default moving speed of snake
float r = 14;//the size
ArrayList snake = new ArrayList();
PVector vel = new PVector(s,0);
///----
float e = 6;//default moving speed of snake
float d = 14;//the size
ArrayList crow = new ArrayList();
PVector cel = new PVector(e,0);
///----
float t = 6;//default moving speed of snake
float g = 14;//the size
ArrayList worm = new ArrayList();
PVector wel = new PVector(t,0);
///----
float y = 6;//default moving speed of snake
float h = 14;//the size
ArrayList wiki = new ArrayList();
PVector wik = new PVector(y,0);
//----------------------------------------------------------
float dx, dy, theta, nx, ny;
//------------------------------
 Segment[] segments;
float[] ax = new float[10];
float[] ay = new float[10];
float segLength = 9;
//---------------------------------------------------
//ArrayList history = new ArrayList();
  int historySize = 300;
 // PVector[] poshistory = new PVector[historySize];
float distthresh = 100;
ArrayList people = new ArrayList();

void setup()
{
  //some boring setup
  size(800, 600);
  background(0);
  smooth();
  frameRate(30);
  rectMode(CENTER);
 
  snake.add(new PVector(width/2, height/2));//the first one is the HEADn

  crow.add(new PVector(width/2, height/2));
  
   worm.add(new PVector(width/2, height/2));

   wiki.add(new PVector(width/2, height/2));
}
 
void draw()
{  //keyboard w/s/a/d
  if (keyPressed)
  {
    if (vel.x == 0)
    {
      if (key == 'q')
        vel = new PVector(-s,0);
      else if (key == 'd')
        vel = new PVector(s,0);
    }
    if (vel.y == 0)
    {
      if (key == 'z')
        vel = new PVector(0,-s);
      else if (key == 's')
        vel = new PVector(0,s);
    }
  }
 
  //[update & draw snake's head]
  PVector head = (PVector)snake.get(0);
  head.add(vel);
  if (head.x > width) head.x -= width;
  else if (head.x < 0) head.x += width;
  if (head.y > height) head.y -= height;
  else if (head.y < 0) head.y += height;
  
//-------------------------
if (keyPressed)
  {
    if (cel.x == 0)
    {
      if (key == 'f')
        cel = new PVector(-e,0);
      else if (key == 'h')
        cel = new PVector(e,0);
    }
    if (cel.y == 0)
    {
      if (key == 't')
        cel = new PVector(0,-e);
      else if (key == 'g')
        cel = new PVector(0,e);
    }
  }
 
  //[update & draw snake's head]
 
//-------------------------
if (keyPressed)
  {
    if (wel.x == 0)
    {
      if (key == 'j')
        wel = new PVector(-t,0);
      else if (key == 'l')
        wel = new PVector(t,0);
    }
    if (wel.y == 0)
    {
      if (key == 'i')
        wel = new PVector(0,-t);
      else if (key == 'k')
        wel = new PVector(0,t);
    }
  }
 
  //[update & draw snake's head]
  PVector bird = (PVector)worm.get(0);
  bird.add(wel);
  if (bird.x > width) bird.x -= width;
  else if (bird.x < 0) bird.x += width;
  if (bird.y > height) bird.y -= height;
  else if (bird.y < 0) bird.y += height;
    ellipse(bird.x, bird.y, g*1.5,g*1.5);
 


//-------------------------
if (keyPressed)
  {
    if (wik.x == 0)
    {
      if (key == 'w')
        wik = new PVector(-y,0);
      else if (key == 'c')
        wik = new PVector(y,0);
    }
    if (wik.y == 0)
    {
      if (key == 'x')
        wik = new PVector(0,-y);
      else if (key == 'v')
        wik = new PVector(0,y);
    }
  }
 
  //[update & draw snake's head]
  PVector loutch = (PVector)wiki.get(0);
  loutch.add(wik);
  if (loutch.x > width) loutch.x -= width;
  else if (loutch.x < 0) loutch.x += width;
  if (loutch.y > height) loutch.y -= height;
  else if (loutch.y < 0) loutch.y += height;

 
  fill(0);

//--------------------------------

    
  
 //---------------------------------------------------------------
  dragSegment(0, head.x, head.y);
  for(int i=0; i<ax.length-1; i++) {
    dragSegment(i+1, ax[i], ay[i]);
  }
  //-----------------------------------------------------
 for (int p=0; p<people.size(); p++){
      person per=(person) people.get(p);
      per.update();
  }
  println(people.size());
  for (int i=0; i<people.size(); i++){    //主體
       person per=(person) people.get(i);
       PVector p = new PVector(
       per.posHistory[historySize-1].x,
       per.posHistory[historySize-1].y,
       per.posHistory[historySize-1].z);
        
        
     for (int j=0; j<people.size(); j++){  //對象
          person per2=(person) people.get(j);
       for (int k=0; k<historySize; k++){
          
         PVector v2=new PVector( per2.posHistory[k].x, per2.posHistory[k].y, per2.posHistory[k].z);
         float dis = PVector.dist(p,v2);
         float joint =   dis/distthresh;
         if(joint<random(0.3)){     stroke(per.r,per.g,per.b,per.a);  line(p.x,p.y,v2.x,v2.y);   }
         }
      }
  }
   if (people.size() < 1 ){
  person one=new person(mouseX,mouseY);
  people.add(one);   
}
}


void dragSegment(int i, float xin, float yin) {
  float dx = xin - ax[i];
  float dy = yin - ay[i];
  float angle = atan2(dy, dx);  
  ax[i] = xin - cos(angle) * segLength;
  ay[i] = yin - sin(angle) * segLength;
  segment(ax[i], ay[i], angle);
}

void segment(float x, float y, float a) {
  strokeWeight(2);
  stroke(255, 20);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
class person
{
  //int historySize = 256;
  PVector[] posHistory = new PVector[historySize];
  float disX=1;
  float disY=1;
  float posX,posY;
  float desX,desY;
  float r,g,b,a;
   
   
  public person(float _posX,float _posY)
  {
     for(int i=0; i<historySize ;i++){
     posHistory[i] = new PVector(0,0,0);
    }
   disX=random(-1,1);
   if(disX==0)disX=1;
   disY=random(-1,1);
   if(disY==0)disY=1;
    posX=_posX;
    posY=_posY;
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
    a=random(127,230);
     
     
  }
  void update()//(int x, int y)
  { //get Pos from DataBase =>Destination
    // nowPosition ~ Destination
     
     
    if(posX<0 || posX>width){
    disX = -disX+random(-1,1);;
    }
    if(posY<0 || posY>height){
    disY = -disY+random(-1,1);;
    }
    posX=posX+disX;
    posY=posY+disY;
    //------------------------------------
      PVector bec = (PVector)crow.get(0);
  bec.add(cel);
  if (bec.x > width) bec.x -= width;
  else if (bec.x < 0) bec.x += width;
  if (bec.y > height) bec.y -= height;
  else if (bec.y < 0) bec.y += height;
      stroke(r,g,b,a);
    PVector c = new PVector(bec.x,bec.y,0);
    for(int i=0; i<historySize-1 ;i++){
     posHistory[i].x = posHistory[i+1].x;
     posHistory[i].y = posHistory[i+1].y;
     posHistory[i].z = posHistory[i+1].z;
    }
     posHistory[historySize-1].x=c.x;
     posHistory[historySize-1].y=c.y;
     posHistory[historySize-1].z=c.z;
 /*
     for (int p=0; p<historySize; p++){
     PVector v1=new PVector( posHistory[p].x, posHistory[p].y, posHistory[p].z );
     PVector v2=new PVector( posHistory[historySize-1].x, posHistory[historySize-1].y, posHistory[historySize-1].z);
     float dis = PVector.dist(v1,v2);
     float j =  p/historySize+ dis/distthresh;
     if(j<random(0.3)){   line(c.x,c.y,v1.x,v1.y);   }
     }*/
  }
      
      
  }
class Segment
{
  float x,y;
  float rot;
  float len;
  color col;
  Segment(float tempx,float tempy,float temprot)
  {
    x = tempx;
    y = tempy;
    rot = temprot;
 
    len = 5;
    col = color(0,0,0,50);
  }}
