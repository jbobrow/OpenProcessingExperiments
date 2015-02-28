
//Copyright 2013
//D. John Kirby
int i;
int maxBalls = 6;
Ball[] balls = new Ball[maxBalls];
int simNum = -1;
void setup()
{
 frameRate(30);
 size(900,480);
 setupSim(simNum);
 background(177,255,255);
}
void draw()
{
  if (simNum == -1)
  {
     background(255);
  textSize(20);
  fill(0);
  text("Select your simulation", 0, 0);
  text( "0 & 1: Compares a ball that feels no force, to one that feels gravity,",0,20);
  text("to one that feels drag and gravity", 0,40);
  text("2: Proves 45 degrees is your best bet", 0, 60);
  text("3: Same as before,  but with drag",0,80);
  text("4: Shoot the monkey! Well, smack the ball with the other ball",0,100);
  text("q resets everything. Thanks for playing!",0,120);

  }
  if(keyPressed)
  {
    background(255);
     if (key == '0')
       simNum = 0;
     else if(key == '1')
        simNum = 1;
     else if(key == '2')
        simNum = 2;
     else if(key == '3')
       simNum =3;
     else if(key == '4')
        simNum = 4;
     else if(key == '5')
        simNum = 5;
     else if(key == '6')
        simNum = 5;
     else if(key == 'q')
        simNum = -1;
     setupSim(simNum);
   }
   else
   {
     if (simNum != 3 && simNum != 2)
     {
       fill(177,255,255,55);
       rect(0,0,width,height);
     }
     for( i =0; i < maxBalls; i++)
     {
      if( balls[i] != null)
      {
        (balls[i]).display();
        (balls[i]).move(); 
      }
     }
   }
}

void setupSim(int simNum)
{
 for( i = 0; i < maxBalls; i++)
   balls[i] = null;
   
 color col = color(255,0,0);
 if(simNum == 0)
 {
   balls[0] = new Ball(0.0, 1.0*height/8, 10.0, 0.0, 0.0, 0.0, col);
   col = color(0,255,0);
   balls[1] = new Ball(0.0, 1.0*height/8+10,10.0,0.0,0.25,0.0, col);
   col = color(0,0,255);
   balls[2] = new Ball(0.0, 1.0*height/8+20,10.0,0.0,0.25,0.001, col);
 }
 else if (simNum==1)
 {
   balls[0] = new Ball(0.0, 1.0*height, 10.0, -10.0, 0.0, 0.0, col);
   col = color(0,255,0);
   balls[1] = new Ball(0.0, 1.0*height,10.0,-10.0,0.25,0.0, col);
   col = color(0,0,255);
   balls[2] = new Ball(0.0, 1.0*height,10.0,-10.0,0.25,0.001, col);
 }
 else if (simNum == 2)
 {
   frameRate(20);
   for( int j = 0; j < 6; j ++)
   {
    col = color(random(255),random(255),random(255));
    balls[j] = new Ball(0.0,1.0*height, 15.0*sin(radians(15*j)), -15.0*cos(radians(15*j)), 0.25, 0.0, col);
   }
 }
 else if (simNum == 3)
 {
   frameRate(20);
   for( int j = 0; j < 6; j ++)
   {
    col = color(random(255),random(255),random(255));
    balls[j] = new Ball(0.0,1.0*height, 15.0*sin(radians(15*j)), -15.0*cos(radians(15*j)), 0.25, 0.001, col);
   }
 }

  else if (simNum == 4)
  {
     col = color(random(255),random(255),random(255));
     balls[0] = new Ball(0.0, 1.0*height, 15.0, 15.0, 0.25, 0.0, col); 
     balls[1] = new Ball(700.0, height-700.0, 0.0, 0.0, 0.25, 0.0, col, 20);
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
 float gravy;
 color col;

 Ball(float xin, float yin, float xvin, float yvin, float gravy, float fric, color col)
 {
  xpos = xin;
  ypos = yin;
  xvel = xvin;
  yvel = yvin; 
  rad = 10;
  this.gravy = gravy;
  this.col = col;
  this.fric = fric;
 }
 
  Ball(float xin, float yin, float xvin, float yvin, float gravy, float fric, color col, int rad)
 {
  xpos = xin;
  ypos = yin;
  xvel = xvin;
  yvel = yvin; 
  this.rad = rad;
  this.gravy = gravy;
  this.col = col;
  this.fric = fric;
 }
 
 void display()
 {
  fill(col);
  ellipse(xpos,ypos,rad,rad); 
 }
 
 void move()
 {
   //if ( (xpos > width)|| (xpos <0))
   //  xvel = -xvel;
   if (ypos > height)
   {
     yvel = -yvel;
     ypos = height-1;
   }
   
 
   if (xvel > 0)
     xvel = xvel - fric*xvel*xvel;
   else
     xvel = xvel + fric*xvel*xvel;
     
   if (yvel > 0)
     yvel = yvel + gravy - fric*yvel*yvel;
   else
     yvel = yvel + gravy + fric*yvel*yvel;
     
   ypos = ypos + yvel;
   xpos = xpos + xvel;
   
   //kill dead balls
   if (abs(yvel) < 0.25)
   {
    yvel = 0; 
   }
 }
 }
