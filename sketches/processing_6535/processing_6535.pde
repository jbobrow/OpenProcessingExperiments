
//Squares v0.4 by deathclaw 09
import processing.opengl.*;

int numSquares=10;

Square[] s=new Square[numSquares];

void setup()
{
  background(0);
  size(600,400);
  smooth();
  colorMode(HSB,360,100,100,255);
  xVel=random(-5,5);
  
  for(int i=0;i<numSquares;i++)
  {
      s[i]=new Square(width/2,height/2,20);
      s[i].movement(random(-3,3),random(-10),0,0.3);
  }
  
  
  frameRate(60);
}

float xVel;
float mx=0;
float angle=0;
float angle2=0;
float x=0;
float y=0;
float k=0;
float sine;
float purple;
float sat;
float sineC=0;
float randomizer=0;
float v=0;
float colors=0;
int chooser=0;
float xOff=0;
float yOff=0;
  

void draw()
{
  background(255,0,100,0);
  rectMode(CENTER);
  int rows=12;
  int cols=12; 
  
  k+=TWO_PI/360;
  if(k>TWO_PI){k=0;}
  sine=sin(k);
  sineC=map(sine,-1,1,0,360);
  

   
 for(int i=0;i<numSquares;i++)
  {
   if(mousePressed==true)
   {mousePressed();}
   colors=map(i,0,numSquares-1,0,360);
   s[i].colors(0,3,colors,100,90,230);
   s[i].regenerate(width/2,height/2,0);
   s[i].spin(0,0,s[i].xVel*s[i].yVel/3);
   s[i].update();
   s[i].s=20;
   s[i].num=i;

   if(i<numSquares-1)
   {
     stroke(0);
     noFill();
     bezier(s[i].x,s[i].y,s[i].x+s[i].xVel*5,s[i].y+s[i].yVel*5,s[i+1].x+s[i+1].xVel*5,s[i+1].y+s[i+1].yVel*5,s[i+1].x,s[i+1].y);
   }   
   if(i==numSquares-1)
   {
     stroke(0);
     noFill();
     bezier(s[i].x,s[i].y,s[i].x+s[i].xVel*5,s[i].y+s[i].yVel*5,s[0].x+s[0].xVel*5,s[0].y+s[0].yVel*5,s[0].x,s[0].y);
   }
  
   s[i].display();
  }
  
  
   for(int f=int(0);f<height;f++)  //reflective floor
   {
     stroke(255,f*1.5+60);
     line(0,(s[0].yFloor+f),width,int(s[0].yFloor+f));
   }

  
  /*Rotating Grid settings
  for(int i=0;i<rows;i++)
  {
    for(int j=0;j<cols;j++)
    { 
      s[i*j].colors(0,3,100,100,100,250);
      s[i*j].spin(i*30+20,j*30+20,0);
      s[i*j].update(0,0,20);
      s[i*j].display();
    }
  }
  */
  
  
  
  
  if(frameCount%2==0 && frameCount<=180)
  {
//    saveFrame("x-####.gif");
  }
  println(frameRate);
}


void mousePressed()
{
  for(int k=0;k<numSquares;k++)
  {
    xOff=mouseX-s[k].x;
    yOff=mouseY-s[k].y;
    if((xOff<=(s[k].hs))&&(xOff>=-(s[k].hs))&&(yOff<=(s[k].hs))&&(yOff>=-(s[k].hs)))
    {chooser=k;break;}
    else{chooser=numSquares;}
  }
  if(chooser!=numSquares)
  {
   s[chooser].x=mouseX;
   s[chooser].y=mouseY;
       
   s[chooser].xVel=mouseX-pmouseX;
   s[chooser].yVel=mouseY-pmouseY;
   s[chooser].age=0;
  }
}

void mouseReleased()
{
 chooser=numSquares;
}

