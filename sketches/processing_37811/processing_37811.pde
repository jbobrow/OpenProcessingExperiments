
//homework 6
//copyright Kristen McConnell September 2011 Pittsburgh PA 15221

//Variables
float x,y,wd,ht;

//Color Variables
color col, col2, col3, col4, col5;

//Initial Setup
void setup()
{
 size(450,450);
 smooth();
 ellipseMode(CORNER);
 //background
 background(256,256,256);

 //Initial Color Settings
 col = color(255);
 col2 = color(11,173,0);
 col3 = color(16,255,0);
 col4 = color(5,77,0);
}

void draw()
{
 //Outer Square
 x = 0;
 while (x < width)
 {
   initials(x,0,50,50);
   initials(x,400,50,50);
   x = x + 50;
 }
 
  y = 0;
 while (y < height)
 {
   initials(0,y,50,50);
   initials(400,y,50,50);
   y = y + 50;
 }
 
 //Middle Square
 x = 105;
 while(x <.75*width)
 {
   initials(x,100,30,30);
   initials(x,310,30,30);
   x = x + 50;
 }
 
 y = 150;
 while (y <.66*height)
 {
   initials(105,y,30,30);
   initials(305,y,30,30);
   y = y + 50;
 }

 //Inner Square
 x = 195;
 while(x <.55*width)
 {
   initials(x,195,20,20);
   initials(x,225,20,20);
   x = x + 30;
 }
}

void initials(float x, float y, float wd, float ht)
{
 //background circle;
 fill(col);
 noStroke();
 ellipse(x,y,wd,ht);

 //A: Color and Placement
 fill(col2);
 beginShape();
  curveVertex(x + .36*wd, y + .6*ht);
  curveVertex(x + .2*wd, y + .85*ht);
  curveVertex(x + .3*wd, y + .91*ht);
  curveVertex(x + .3*wd, y + .6*ht);
  vertex(x + .4*wd, y + .45*ht);
  vertex(x + .575*wd, y + .45*ht);
  vertex(x + .65*wd, y + .9*ht);
  curveVertex(x + .8*wd, y + .85*ht);
  curveVertex(x + .675*wd, y + .95*ht);
  curveVertex(x + .75*wd, y + .85*ht);
  curveVertex(x + .575*wd, y + .15*ht);
  curveVertex(x + .5*wd, y);
  curveVertex(x + .425*wd, y + .15*ht);
  curveVertex(x + .2*wd, y + .85*ht);
  curveVertex(x + .2*wd, y + .85*ht);
 endShape();

 //inside of the A: Color and Placement
 fill(col);
 beginShape();
  vertex(x + .425*wd, y + .375*ht);
  vertex(x + .57*wd, y + .375*ht);
  vertex(x + .5*wd, y + .1*ht);
  vertex(x + .425*wd, y + .375*ht);
 endShape();

 //back of the k: Color and Placement
 noStroke();
 fill(col3);
 beginShape();
  curveVertex(x + .05*wd, y + .45*ht);
  curveVertex(x + .05*wd, y + .3*ht);
  curveVertex(x + .1*wd, y + .25*ht);
  curveVertex(x + .15*wd, y + .325*ht);
  curveVertex(x + .15*wd, y + .65*ht);
  curveVertex(x + .1*wd, y + .75*ht);
  curveVertex(x + .05*wd, y + .65*ht);
  curveVertex(x + .05*wd, y + .3*ht);
  curveVertex(x + .05*wd, y + .3*ht);
 endShape();

 //top arm of k: Placement
 beginShape();
  curveVertex(x + .15*wd, y + .45*ht);
  curveVertex(x + .15*wd, y + .45*ht);
  curveVertex(x + .25*wd, y + .35*ht);
  curveVertex(x + .3*wd, y + .35*ht);
  curveVertex(x + .3*wd, y + .4*ht);
  curveVertex(x + .15*wd, y + .55*ht);
  curveVertex(x + .15*wd, y + .45*ht);
  curveVertex(x + .15*wd, y + .45*ht);
 endShape();

 //bottom arm of k: Placement
 beginShape();
  curveVertex(x + .15*wd, y + .5*ht);
  curveVertex(x + .17*wd, y + .5*ht);
  curveVertex(x + .2*wd, y + .5*ht);
  curveVertex(x + .34*wd, y + .7*ht);
  curveVertex(x + .325*wd, y + .75*ht);
  curveVertex(x + .25*wd, y + .7*ht);
  curveVertex(x + .15*wd, y + .55*ht);
  curveVertex(x + .15*wd, y + .55*ht);
 endShape();

 //M: Color and Placement
 fill(col4);
 beginShape();
  curveVertex(x + .7*wd, y + .45*ht);
  curveVertex(x + .6*wd, y + .35*ht);
  curveVertex(x + .675*wd, y + .3*ht);
  curveVertex(x + .775*wd, y + .375*ht);
  curveVertex(x + .875*wd, y + .3*ht);
  curveVertex(x + .95*wd, y + .35*ht);
  curveVertex(x + .95*wd, y + .675*ht);
  curveVertex(x + .9*wd, y + .75*ht);
  curveVertex(x + .85*wd, y + .675*ht);
  curveVertex(x + .85*wd, y + .45*ht);
  curveVertex(x + .775*wd, y + .5*ht);
  curveVertex(x + .7*wd, y + .45*ht);
  curveVertex(x + .7*wd, y + .675*ht);
  curveVertex(x + .65*wd, y + .75*ht);
  curveVertex(x + .6*wd, y + .675*ht);
  curveVertex(x + .6*wd, y + .35*ht);
  curveVertex(x + .6*wd, y + .35*ht);
 endShape();
}

