
//copyright Joanne Lo jylo 2014
  //Homework_3
  
//variable declaration
float x,y;
float w,h;
float xDist, yDist;
float easingCoef;
{
  x=200;
  y=200;
  w=50;
  h=50;
}
 
void setup()
{ 
   size(400,400);
   background(0);
   noCursor();
   easingCoef=0.3;
   smooth();
  frameRate(20);
}
void draw()
{
    x=mouseX;
    y=mouseY;
    fill(0,10);
    rect(0,0, width, height);
    
     fill(0,0, random (255));
    noStroke();
    triangle(x*2,y, w,h,x*0.8,y*0.4); 
     
 noStroke();
    fill (random(255), 0, 0);
    triangle(x-.10*w,y-.10*h, .5*w,.5*h,x*0.1,y*0.3);

    fill(100,0, random (255));
    noStroke();
    triangle(x*2,y*2, w,h,x*0.3,y*0.4); 
    
   
}



