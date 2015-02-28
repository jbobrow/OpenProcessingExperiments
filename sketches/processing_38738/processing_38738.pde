
//homework 7
//copyright Kristen McConnell September 2011 Pittsburgh PA 15221
 
//Variables
float x,y,wd,ht,deltaX,deltaY,dia,maxSpeed,minSpeed;
 
  
//Color Variables
color col, col2, col3, col4;
 
void setup()
{
  size(400,400);
  smooth();
  x=width/2;
  y=height/2;
  maxSpeed = 10;
  minSpeed = -10;
  dia = 100;
  
  //Color Settings
  col = color(255);
  col2 = color(11,173,0);
  col3 = color(16,255,0);
  col4 = color(5,77,0); 
}
 
void draw()
{
  prepScreen();
  moveInitials();
  changeSpeed();
  showSpeed();
  stopInitials();
}
 
//Returns the Initials to the Center of the Screen when Any Key is Pressed
void stopInitials()
{
  if (keyPressed == true)
  {
    x = width/2.75;
    y = width/2.75;
    deltaX = 0;
    deltaY = 0;
    initials(x,y,dia,dia);
  }
}
 
//Displays Horizontal & Vertical Speed on the Screen
void showSpeed()
{
  text("Horizontal Speed:",10,height-30);
  text("VerticalSpeed:",10,height-10);
  text(deltaX,125,height-30);
  text(deltaY,100,height-10);
}
 
//Allows the Initials to Vertically & Horizontally Move & Wrap Around the Screen
void moveInitials()
{
  x = x + deltaX; 
  if(x>width + dia/2)
  {
    x = -dia/2;
  }
    //too far left;
    if(x < -dia/2)
    {
      x = width + dia/2;
    }
  y = y + deltaY; 
  if(y>height + dia/2)
  {
    y = -dia/2;
  }
    if(y < -dia/2)
    {
      y = height + dia/2;
    }
   initials(x-50,y-50,dia,dia);
}
 
//Controls Speed Based on Location of the Mouse
void changeSpeed()
{
  deltaX = map(mouseX,0,width,minSpeed,maxSpeed);
  deltaY = map(mouseY,0,height,minSpeed,maxSpeed);
}
 
 
//Draws the Initials
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
 
//Draws White Background Repeatedly
void prepScreen()
{
  fill(col);
  rect (0,0,width,height);
}

