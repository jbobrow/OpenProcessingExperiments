
//ICE 21
//Copyright Miranda Jacoby 2014 All Rights Reserved
float distRed, distBlue;

int [] x = { 50, 100, 150, 200, 250, 300, 350};
int [] y = { 30, 100, 150, 200, 250, 300, 370 };
int [] speed = { 1, 2, 3, 4, 5, 6, 7};

color [] colorList = 
{
color( 0, 0, 0),  
color( 0, 255, 0),  
color( 0, 0, 255 ),  
color( 255, 255, 0),  
color( 255,   0, 255),  
color(   0, 255, 255),  
color( 255, 255, 255),    
};

int vel;
int spd;
int diam = 30;
int reddiam = 300;
int bludiam = 150;

void setup()
{
  size(400, 400);
  rectMode(CENTER);
  strokeWeight(5);
}

void draw()
{
 background(100, 255, 100); 
 
 //red circle
 //noStroke();
 fill(255, 0, 0);
 ellipse(width/2, height/2, reddiam, reddiam);

 //blue circle
 fill(0, 0, 255);
  ellipse(width/2, height/2, bludiam, bludiam);
 
 drawShapes();
 bounce();
 move();
}

void drawShapes()
{
    for (int i = 0; i < x.length; i++ )
   {
     design(x[i], y[i], colorList[i]);
   }
 }
  
void design( float xpos, float ypos, color fill)
{

  point(xpos, ypos);
}

void move()
{
  for (int i = 0; i < x.length; i ++)
  {
 distRed = dist(x[i], y[i], (width/2), (height/2) );
 distBlue = dist(x[i], y[i], (width/2) , (height/2) );
  if ( distBlue < (bludiam/2) + (diam/2))//(x[i] < distRed && y[i] < distRed)
  {
  fill(colorList[i]);
  rect(x[i], y[i], diam, diam);
  }
 else if ( distRed  < (reddiam/2) + (diam/2))
 //(x[i] < distBlue && y[i] < distBlue)
 {
  fill(colorList[i]);
  ellipse(x[i], y[i], diam, diam);
 }
 
 else
 {
   point(x[i], y[i]);
 }
  }
}


void bounce ()
{
    for (int i = 0; i < x.length; i ++)
  {
    x[i] += speed[i] ; 
    if (    x[i] >= width + diam ||
            x[i] < - diam + 2 )
    {
       speed[i] = -speed[i]; 
    }
    
//  spd = int(speed[i]);  
//  vel = spd + int(x[i]);
//   if (vel > width )//- wd* .5)
//   {
//     spd = -spd; // move left
//   }
//    //else if( x < 0 + wd* .5 ) 
//  //{
//   // dx = -dx;
//  //}
//    else if( vel <  0)//wd* .5 ) 
//   {
//     spd = -spd;  // move right
//   }
}
}


