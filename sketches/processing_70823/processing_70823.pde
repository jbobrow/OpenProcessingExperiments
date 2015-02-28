
//Dakotah Konicek    dkonicek
//Copyright © 2012 Dakotah Konicek
//HW6

//press 'r' to refresh the background and restart obiting initial

float x,y,wd,ht,gravity,speedx,speedy,gx;
float gy,bx,by,speedbx,speedby;


void setup()
{
  size (400,400);
  smooth();
  x=40;
  y=40;
  gravity= 2;
  speedx=0;
  speedy=0;
  speedby=0;
  speedbx=0;
 
  // x and y positioning for initial with gravity
  gx=random(250);
  gy=random(250);
  bx=100;
  by=100;
 
}

void draw()
{
  prepWindow();
  drawInitialB(bx,by);
  drawInitialA(gx,gy);
  moveInitialA();
  moveInitialB();
}

void prepWindow()
{
  fill(255,1);
  rect(0,0, width, height);
}

 //InitialA with x and y wrap
void drawInitialA(float x, Float y)
{
wd=80;
ht=80;
 
ellipseMode(CENTER);
fill(80,103,122);
ellipse(x,y,wd,ht);
 
//inner ellipse
fill(164,210,250);
ellipse(x,y,.95*wd,.95*ht);
noFill();
 
//Line for D
stroke(#FAF142);
strokeWeight(5);
arc(x,y, .4*wd, .4*ht, -PI,0);
 
//Line for K
stroke(#FAF142);
strokeWeight(5);
beginShape();
curveVertex(x-(.3*wd), y+(.45*wd));
curveVertex(x-(.2*wd), y+(.3*wd));
curveVertex(x-(.1*wd), y+(.15*wd));
curveVertex(x, y);
curveVertex(x+(.1*wd), y+(.15*wd));
curveVertex(x+(.2*wd), y+(.3*wd));
curveVertex(x+(.3*wd), y+(.45*wd));
endShape();
 
//Line for D and K
stroke(80,103,122);
strokeWeight(5);
beginShape();
vertex(x-(.3*wd), y);
vertex(x+(.3*wd),y);
endShape();
}
//initial A with obiting movement
void moveInitialA()
{
  gy=gy+speedy;
  gx=gx+speedx;
  //gravity
  //point of the center of gravity
  if (gy>200)
  {speedy=speedy-gravity;}
  if (gy<200)
  {speedy=speedy+gravity;}
  if (gx>200)
  {speedx=speedx-gravity;}
  if (gx<200)
  {speedx=speedx+gravity;}
  
 if (gx>width)
   {gx=0;}
 if (gx<0)
 {gx=width;}
 if (gy>height)
 {gy=0;}
 if (gy<0)
 {gy=height;}
 }

//initial B with bounce
void drawInitialB (float x, float y)
{
wd=80;
ht=80;
 
ellipseMode(CENTER);
fill(80,103,122);
ellipse(x,y,wd,ht);
 
//inner ellipse
fill(164,210,250);
ellipse(x,y,.95*wd,.95*ht);
noFill();
 
//Line for D
stroke(#FAF142);
strokeWeight(5);
arc(x,y, .4*wd, .4*ht, -PI,0);
 
//Line for K
stroke(#FAF142);
strokeWeight(5);
beginShape();
curveVertex(x-(.3*wd), y+(.45*wd));
curveVertex(x-(.2*wd), y+(.3*wd));
curveVertex(x-(.1*wd), y+(.15*wd));
curveVertex(x, y);
curveVertex(x+(.1*wd), y+(.15*wd));
curveVertex(x+(.2*wd), y+(.3*wd));
curveVertex(x+(.3*wd), y+(.45*wd));
endShape();
 
//Line for D and K
stroke(80,103,122);
strokeWeight(5);
beginShape();
vertex(x-(.3*wd), y);
vertex(x+(.3*wd),y);
endShape();
}
//bounce and wrapping
void moveInitialB()
{
  bx=bx+speedbx;
  by=by+speedby;
  speedby=speedby+1;
  speedbx=speedbx+1;
  
  if (bx>width)
   {bx=width;
    speedbx=-speedbx;}
 if (bx<0)
 {bx=width;}
 if (by<0)
   {by=height;
   by=by+speedby;}
   if (by>height)
     {by=height-wd/2;
      speedby=speedby*-.92;}
}

void keyPressed()
{
  if (key=='r')
  {background(random(255),random(255),random(255));
  gx=random(300);
  gy=random(300);
  speedx=0;
  speedy=0;}
  if (key =='p')
  {saveFrame("hw6.jpg");
  }
}

