
 import processing.opengl.*;

int len = 15;
int pop = 800;
float prox = 10;
int co = len-1;   //this just makes things easier

Wander p[] = new Wander[pop];

void setup()
{
  size(300,300,OPENGL);
  for (int i = 0; i < pop; i++)
  {
    p[i] = new Wander(random(width),random(height),i);
  }
  //smooth();
}

void draw()
{
  background(20);
  for (int i = 0; i < pop; i++)
  {
    p[i].display();
  }
  if(mousePressed && (mouseButton == RIGHT))
  {
    saveFrame("amoeba-##.tif");  //for saving a beautiful image.
  }
}

float Range(int index, boolean isxin)
{
  int no;
  boolean isx = isxin;
  float r = 0;
  
  no = index;

  for (int i = 0; i < pop; i++)
  {
   float d = dist(p[no].x[co],p[no].y[co],p[i].x[co],p[i].y[co]);
   if(d < 10 && d > 3)
   {
     if(isx == true) 
     {
       if(p[no].x[co]-p[i].x[co] < 0) r+=1;
       if(p[no].x[co]-p[i].x[co] > 0) r-=1;
     }
     if(isx == false)
     {
       if(p[no].y[co]-p[i].y[co] < 0) r+=1;
       if(p[no].y[co]-p[i].y[co] > 0) r-=1;
     }
   }
   if(d <= 3)
   {
     if(isx == true) 
     {
       if(p[no].x[co]-p[i].x[co] > 0) r+=1;
       if(p[no].x[co]-p[i].x[co] < 0) r-=1;
     }
     if(isx == false)
     {
       if(p[no].y[co]-p[i].y[co] > 0) r+=1;
       if(p[no].y[co]-p[i].y[co] < 0) r-=1;
     }
   if(mousePressed && (mouseButton == LEFT) == true)
   {
     if(isx == true) 
     {
       if(p[no].x[co]-p[i].x[co] > 0) r+=10;
       if(p[no].x[co]-p[i].x[co] < 0) r-=10;
     }
     if(isx == false)
     {
       if(p[no].y[co]-p[i].y[co] > 0) r+=10;
       if(p[no].y[co]-p[i].y[co] < 0) r-=10;
     }
   }
   }
  } 
  return r;
}


class Wander 
{
  float[] x = new float[len];
  float[] y = new float[len];
  int no;
  Wander (float xin, float yin, int index)
  {
    for (int i = 0; i < len; i++)
    {
      x[i] = xin;
      y[i] = yin;
    }
    no = index;
  }
  void display()
  {
    float rx;
    float ry;
    
    for (int i = 1; i < len; i++)
    {
      x[i-1] = x[i];
      y[i-1] = y[i];
    }
    
    rx = Range(no,true);
    ry = Range(no,false);
    

    
    x[co] += random(rx-1,rx+1);
    y[co] += random(ry-1,ry+1);
    
    x[co] = x[co]%width;
    y[co] = y[co]%height;
    
    for (int i = 1; i < len; i++)
    {
      float val = map(i,0,len,0,255);
      float val2 = map(no,0,pop,0,255);
      stroke((val2+185)%255,(val2+15)%255,(val2+90)%255,val/2);
      strokeWeight(val/20);
      if(abs(x[i-1]-x[i]) < width/2 && abs(y[i-1]-y[i]) < height/2) line(x[i-1],y[i-1],x[i],y[i]); 
    }
   
  }  
}

