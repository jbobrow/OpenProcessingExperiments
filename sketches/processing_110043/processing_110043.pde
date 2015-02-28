
//Homework 4//
//Amy Friedman
//amyfried
//copyright Sept 2013
//image from cartoon solutions 

float x,y,wd,ht,xi, yi, wdi, hti;
PImage picture;

float xValues;
float yValues;


void setup()
{ size(400,400);
  //snowman 
  x  = width/2;
  y  = height/4;
  wd = width;
  ht = height;
  //image
  xi  = width/2;
  yi = height/2;
  wdi = width;
  hti = height;
  
  //snow
   xValues = random(0,width/2);
   yValues = random(0,height/2);
   
imageMode(CENTER);
picture = loadImage("35447_1 copy.jpg");


}

void draw()
{
  image( picture, xi, yi, wdi, hti );
 
 
 //snowman
 fill(#FFFFFF);
 ellipse(x, y+250, wd*.15, ht*.15);
 ellipse(x, y+200, wd*.11, ht*.11);
 ellipse(x, y+170, wd*.09, wd*.09);
 fill(#030303);
 ellipse(x+10, y+165, wd*.01, ht*.01);
 fill(#FAAF0D);
 triangle(x+10, y+170, x+35, y+175, x+10, y+180);

 //snow
 fill(#FFFFFF);
    ellipse(xValues,yValues, random(1,20), random(1,20));    
    yValues = yValues + 2;

}

void mouseReleased()
{    
if (mouseX<300)
{ xValues= random(0,400);
 yValues= random(0,10);}
}

void keyPressed()
{
 if (keyCode == RIGHT)
{x=x+30;}
else if (keyCode == LEFT)
{x=x-30;}

}


