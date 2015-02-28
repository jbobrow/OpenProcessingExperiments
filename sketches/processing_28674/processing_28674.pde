
PImage Background;
PImage [] run;
float x;
float y;
Running [] runs;

void setup()
{
  size (500,500);
  run= new PImage [3];
  runs= new Running[125];
  for (int i=0;i< runs.length;i++)
  {
    runs[i]= new Running(random(0,500), random(0,500));
  }
  for (int i=0;i< run.length;i++)
  {
    run[i]=loadImage("run"+(i+1)+".png");
  }
  Background=loadImage("Background.jpg");
}

void draw()
{
  image (Background,0,0,500,500);
  for (int i=0;i< runs.length;i++)
  {
    runs[i].update();
  }
}

class Running
{
  float x;
  float y;
  float velx;
  float vely;
  float driftx;
  float drifty;
  int counter;
  int frame;
  int speedrate;
  boolean runfar;
  
  Running (float xloc, float yloc)
  {
    x=xloc;
    y=yloc;
    speedrate=int(random(1,20));
    driftx=x;
    drifty=y;
    runfar=boolean(int(random(2)));
  }
  
  void update()
  {
    
    if(frame >1) frame=0;
    pushMatrix();
    translate(x,y);
    
    if (counter%100==0)
    {
      driftx=int(random(0,500));
      drifty=int(random(0,500));
    }
    
    x+= (driftx-x)*0.01;
    y+= (drifty-y)*0.01;
    if (counter% speedrate==0)
    {
      frame++;
    }
    if (frame< 2) frame=0;
    if (runfar)
    {
      image(run[frame],-50,-50,100,100);
    }
    popMatrix();
    counter++;
  }
}
  

