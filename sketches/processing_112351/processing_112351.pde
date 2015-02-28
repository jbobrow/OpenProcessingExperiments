
/* @pjs font="FingerPaint-Regular.ttf"; */
float x = 0;
float x1 = 0;
float y = 350;
PImage sky ;
PFont lyrics ;

void setup() 
{ 
  size(500,500);
  sky = loadImage("sky.jpg") ;
  noStroke();
  smooth();
  fill(255);
   
  lyrics = createFont("FingerPaint-Regular.ttf");
  
}

void draw ()
{
  fill(255);
  ellipse(0,0,100,100);
  textFont(lyrics, 13);
  image(sky, 0, 0, 942, 706);
 fill(255,0,0);
  ellipse(x,100,5,5);
  x = x + 4;
  
  fill(255);
  ellipse(x1,120,5,5);
  x1 = x1 + 2;
  
  if (x > 500)
  {x = 0 ;}
  
    if (x1 > 500)
  {x1 = 0 ;}
  
  if (y < 1)
  {y = 350 ;}
  
  fill(220);
  ellipse(20,20,100,100); 
   fill(255);
   ellipse(100,150,5,5);
   ellipse(180,80,5,5);
   ellipse(130,50,5,5);
   ellipse(250,20,5,5);
   ellipse(350,60,5,5);
   ellipse(450,10,5,5);
   ellipse(500,90,5,5);
   ellipse(460,150,5,5);
   ellipse(225,150,5,5);
  text("Can We Pretend That Airplanes In The Night Sky Like Shooting Stars", 15,y);
  y = y - 2;
  
}


