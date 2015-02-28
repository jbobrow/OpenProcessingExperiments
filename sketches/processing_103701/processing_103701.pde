
//Copyright 2013
//D. John Kirby

int simNum = 1;
Ball[] ballList;

void setup()
{
  size(1278,760);
  if (simNum ==0)
  {
    //Just a bunch of dumb balls
    ballList = new Ball[5];
    for( int i = 0; i < ballList.length; i ++)
    {
     if (simNum == 0)
     {
       float mass = random(100,1000);
       ballList[i] = new Ball( random(width), random(height), random(5), random(5),
        color(random(255),random(255),random(255)), (int)mass/10,mass); 
     }
    }
  }
  else if(simNum == 1)
  {
    //Basic solar system
   ballList = new Ball[3];
   ballList[0] = new Ball(width/2, height/2, 0, 0, color(255,255,0), 50, 3*10^1000);
   ballList[1] = new Ball(width/2,0.6*height, 3.5, 0, color(0,0,255), 30, 10); 
   ballList[2] = new Ball(width/2,0.75*height, 2,0, color(255,0,0), 25, 10);
  }
  else if(simNum ==2)
  {
   //That's no Moon!
   ballList = new Ball[3]; 
   ballList[0] = new Ball(width/2, height/2, 0, 0, color(255,255,0), 75, 3*10^1000);
   ballList[1] = new Ball(0.7*width, height/2,0,-2, color(205,183,158),50,10^10);
   ballList[2] = new Ball(0.7*width+40, height/2,0,-2.4, color(255,255,255),10,1);
  }
  else if(simNum == 3)
  {
    //Binary Star System
   ballList = new Ball[2];
   ballList[0] = new Ball(width/2-100, height/2, 0, 1.5, color(255,255,0), 75, 10^1000);
   ballList[1] = new Ball(width/2+100, height/2, 0, -1.5, color(255,255,0), 75, 10^1000);
  }
  else if(simNum ==4)
  {
    //It's a space station!
    ballList = new Ball[3];
   ballList[0] = new Ball(width/2-100, height/2, 0, 1.5, color(255,255,0), 30, 10^1000);
   ballList[1] = new Ball(width/2+100, height/2, 0, -1.5, color(255,255,0), 30, 10^1000);
   ballList[2] = new Ball(width/2-150, height/2, 0, 4.75, color(0,0,255),15, 1);
  }
  else if (simNum == 5)
  {
    
    //Orbit they Barry Center
     ballList = new Ball[3];
     ballList[0] = new Ball(width/2-100, height/2, 0, 1.5, color(255,255,0), 75, 10^1000);
     ballList[1] = new Ball(width/2+100, height/2, 0, -1.5, color(255,255,0), 75, 10^1000);
     ballList[2] = new Ball(width/2-350, height/2, 0, 2.5, color(0,0,255),15, 1);

  }
  else if (simNum == 6)
  {
    
    //This one is borken
     ballList = new Ball[3];
     ballList[0] = new Ball(width/2-100, height/2, 0, 1.5, color(255,255,0), 75, 10^1000);
     ballList[1] = new Ball(width/2+100, height/2, 0, -1.5, color(255,255,0), 75, 10^1000);
     ballList[2] = new Ball(width/2-250, height/2, 0, 3, color(0,0,255),15, 1);

  }
}

void draw()
{
 background(0);
  for( int j =0; j < ballList.length; j= j + 1)
 {
//   print("handling ball $"+i+"\n");
    if( ballList[j] != null)
    {
     // print("handlingy ball # "+ i);
      (ballList[j]).display();
      (ballList[j]).move(ballList); 
    }
  }
}

class Ball
{
 float xpos;
 float ypos;
 float xvel;
 float yvel; 
 float rad;
 float fric;
 float gravy = 20000;
 color col;
 float mass;

 Ball(float xin, float yin, float xvin, float yvin, color col, int rad, float mass)
 {
  xpos = xin;
  ypos = yin;
  xvel = xvin;
  yvel = yvin; 
  this.rad = rad;
  this.col = col;
  this.mass = mass;
 }
 
 void display()
 {
  fill(col);
  ellipse(xpos,ypos,rad,rad); 
 }
 
 void move(Ball[] ballList)
 {
   if(simNum == 0)
   {
     if ( (xpos > width)|| (xpos <0))
       xvel = -xvel;
     if (ypos > height || (ypos < 0))
       yvel = -yvel;
   }
   
   xpos = xpos + xvel;
   ypos = ypos + yvel;
   float gravityFelt;
   for( int i = 0; i < ballList.length; i++)
   {
     //If I'm looking at myself just hop to the next one.
     if(ballList[i] == null)
       continue;
     if((abs(ballList[i].xpos - xpos) < 1) && (abs(ballList[i].ypos - ypos) < 1))
       continue;
     gravityFelt = ballList[i].mass/pow(dist(xpos,ypos,ballList[i].xpos,ballList[i].ypos),3);
     xvel = xvel - gravityFelt*(xpos-ballList[i].xpos);
     yvel = yvel - gravityFelt*(ypos-ballList[i].ypos);
   }
 }
}


