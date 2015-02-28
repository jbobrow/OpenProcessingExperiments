
import processing.opengl.*;
PGraphics pg;

//Branch b = new Branch(500,500);
ArrayList branches;
int generation;
int genlimit;
PImage img;
void setup()
{
  size (screen.width/4,screen.height/4,OPENGL);
  background(108,96,73);
  branches = new ArrayList();
  branches.add(new Branch(random(0,width),random(0,height),1 ));
  generation = 0;
  genlimit = 800;
smooth();

 // frameRate(35);
}

void draw()
{
//  background(108,96,73);
 fill(108,96,73,12);
 rect(0,0,width,height);
 for(int i = 0; i < branches.size(); i++)
 {
   Branch b = (Branch) branches.get(i);
   if(b.alf<=0)
   {
     branches.remove(i);
   }
   b.update();
   b.display();
 }
  if(generation == genlimit)
  {
    reset();
  }

  
  
}
void reset()
{
//img = pixels;

  branches = new ArrayList();
  generation = 0;
  branches.add(new Branch(random(0,width),random(0,height),1));
}
  
  
  

class Branch
{

  float x,y,vx,vy;
  int steps;
  int blimit;
  boolean branched;
  float[] xs;
  float[] ys;
  int mygeneration;
  float alf;
  
  Branch(float xpos, float ypos, int gen)
  {
    mygeneration = gen;
    alf = 255;
  xs = new float[1];
  ys = new float[1];  
  branched = false;
  x = xpos;
  y = ypos;
  xs[0] = x;
  ys[0] = y;
  vx = random(-1,1);
  vy = random(-1,1);
  blimit = int(random(50,100));

  
  


}
 
 void update()
 {
   
  if(!branched)
 { 
   x+=vx;
   y+=vy;
   xs = append(xs,x);
   ys = append(ys,y);
 steps++;
 }
 
 if(steps > blimit && !branched)
 {
   make_branch(x,y);
   branched = true;
 }
 
 }
 
 void display()
 {
   
   stroke(242,234,220);
   if(generation > mygeneration*1.6)
   {
     alf-=4;
   }
   stroke(242,234,220,alf);
   strokeWeight(.1);
   for(int i = 1; i < xs.length-1;i++)
   {
     line(xs[i-1],ys[i-1],xs[i],ys[i]);
   }
 }
}



void make_branch(float sx,float sy)
{
  println("sx is "+sx+" and sy is "+sy);
  if(generation < genlimit)
  {
  for(int i = 0; i < 4; i++)
  {
   generation++; 
  branches.add(new Branch(sx,sy,generation));
  }
  }
}

