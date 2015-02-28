
float[] xpos;
float[] ypos;
float[] xspeed; 
float[] yspeed;
float gravity = 1000;
float dragfactor= 0.999;
boolean[] visible;
int numsats=500;

void setup()
{
  size(800,800);
  background(0);
  noStroke();
  smooth();
  rectMode(CENTER);
  xpos= new float[numsats];
  ypos= new float[numsats];
  xspeed= new float[numsats];
  yspeed= new float[numsats];
  visible = new boolean[numsats];
  
  for(int i=0; i<numsats; i++)
  {
    xpos[i]= random(width/5, 4*height/5);
    ypos[i]= random(width/5, 4*height/5);
    xspeed[i]= random(-2,2);
    yspeed[i]= random(-2,2);
    visible[i]=true;
  }
}

void draw()
{
   background(0);
   fill(147, 228, 234);
   ellipse(width/2, height/2, 120,120);
   fill(56, 142, 76);
   ellipse(width/2, height/2, 60,60);
   fill(255);
   for(int i=0; i<numsats; i++)
   {
     if (visible[i]) ellipse(xpos[i], ypos[i], 5, 5);
     xpos[i]+=xspeed[i];
     ypos[i]+=yspeed[i];
     float theta = atan2(ypos[i]-height/2, xpos[i]-width/2);
     xspeed[i]+= -1*(gravity/(centredist(xpos[i], ypos[i])*centredist(xpos[i], ypos[i])))*cos(theta);
     yspeed[i]+= -1*(gravity/(centredist(xpos[i], ypos[i])*centredist(xpos[i], ypos[i])))*sin(theta);
     if(inatmos(xpos[i], ypos[i]))
     {
       xspeed[i]*=dragfactor;
       yspeed[i]*=dragfactor;
     }
    if(inplanet(xpos[i], ypos[i]))
     {
       xspeed[i]=0;
       yspeed[i]=0;
       visible[i]=false;
     }
   }  
}

float centredist(float xpos, float ypos)
{
  return dist(xpos, ypos, width/2, height/2);
}

boolean inatmos(float xpos, float ypos)
{
  return (dist(xpos, ypos, width/2, height/2)<60);
}

boolean inplanet(float xpos, float ypos)
{
 return (dist(xpos, ypos, width/2, height/2)<30);
}

