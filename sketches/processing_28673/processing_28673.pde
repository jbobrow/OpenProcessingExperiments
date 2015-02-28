
PImage Background;
PImage [] run;

int a = 1;
int b = 1;

int counter;

float rot=0;
float desiredRot=0;
float rot2=0;
float desiredRot2=0;

int x = 0;
int y = 250;
int frame=1;

float x2=50;
float y2=150;
int frame2=1;

float x3=150;
float y3=100;
int frame3=1;

float x4=300;
float y4=200;
int frame4=1;

float x5=250;
float y5=250;
int frame5=1;

float velx;
float vely;
float velx2;
float vely2;
float velx3;
float vely3;
float velx4;
float vely4;

void setup()
{
  size (500,500);

  run = new PImage[3];
  for(int i = 0; i< run.length; i ++)
  {
    run[i]= loadImage("run" + (i+1) + ".png");
  }
  Background= loadImage("Background.jpg");
}



void draw()
{



  if(frame > 2) frame = 0;
  if(frame2 > 2) frame2=0;
  if(frame3 > 2) frame3=0;
  if(frame4 > 2) frame4=0;

  image(Background,0,0,500,500);

  if (counter%60==0)
  {
    velx=int(random(0,500));
  }
  x+=(velx-x)*0.01;

  if (counter%60==0)
  {
    vely=int(random(0,500));
  }
  y+=(vely-y)*0.01;

  if (counter%60==0)
  {
    velx=int(random(0,500));
  }
  x2+=(velx2-x2)*0.02;

  if (counter%60==0)
  {
    vely2=int(random(0,500));
  }
  y2+=(vely2-y2)*0.02;

  if (counter%60==0)
  {
    velx3=int(random(0,500));
  }
  x3+=(velx3-x3)*0.03;

  if (counter%60==0)
  {
    vely3=int(random(0,500));
  }
  y3+=(vely3-y3)*0.03;

  if (counter%60==0)
  {
    velx4=int(random(0,500));
  }
  x4+=(velx4-x4)*0.04;

  if (counter%60==0)
  {
    vely4=int(random(0,500));
  }
  y4+=(vely4-y4)*0.04;

  pushMatrix();
  scale (a,b);
  translate(x,y);
  rotate(rot);
  image(run[frame],-50,-50,175,125);
  popMatrix();

  pushMatrix();
  scale (a,b);
  translate(x2,y2);
  rotate(rot);
  image(run[frame2],-50,-50,175,125);
  popMatrix();

  pushMatrix();
  scale (a,b);
  translate(x3,y3);
  rotate(rot);
  image(run[frame3],-50,-50,175,125);
  popMatrix();

  pushMatrix();
  scale (a,b);
  translate(x4,y4);
  rotate(rot);
  image(run[frame4],-50,-50,175,125);
  popMatrix();
 

  if (counter%10==0)
  {
    frame++;
  }
  if (counter%12==0)
  {
    frame2++;
  }
  if (counter%14==0)
  {
    frame3++;
  }
  if (counter%16==0)
  {
    frame4++;
  }
  else if (mousePressed)
  {
    a+=0.01;
    b+=0.01;
  }
  counter++;
  
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP) 
    {
      y5-= 5;
      desiredRot2=0;
      frame++;
    }
    else if(keyCode == DOWN) 
    {
      y5+= 5;
      desiredRot2=PI;
      frame5++;
    }
    else if(keyCode == RIGHT)
    {
      x5 += 5;
      desiredRot2=.5*PI;
      frame5++;
    }
    else if(keyCode == LEFT)
    {
      x5 -= 5;
      desiredRot2=-.5*PI;
      frame5++;
    }
    
  }
  counter++;
}


