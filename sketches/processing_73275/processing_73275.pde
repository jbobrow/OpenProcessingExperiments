
//Dakotah Konicek    dkonicek
//Copyright © 2012 Dakotah Konicek
//HW7
 
//click the mouse to move the green ball
//keep the green ball away from the red ball
//If you touch the red ball the count goes up
//if you go off the screen the count goes up
 
float x,y,wd,ht,gravity,speedgx,speedgy,gx,dia;
float gy,bx,by,speedbx,speedby,d,count;

 
void setup()
{
  size (400,400);
  smooth();
  strokeWeight(2);
  textSize(12);
  x=40;
  y=40;  
  gx=20;
  gy=20;
  speedgy=1;
   speedgx=1;
}
 
void draw()
{
  prepWindow();
  drawB(bx,by); //red ball
  drawA(gx,gy); //green ball
  moveB(); //move red ball
  moveA(); //move green ball
  time();
  collisions();
}
 
void prepWindow()
{
  fill(255,10);
  rect(0,0, width, height);
}
 
 // Green ball with x and y wrap
void drawA(float x,float y)
{ 
  dia=20;
ellipseMode(CENTER);
fill(0,255,0);
ellipse(x,y,dia,dia);
}

void moveA() //green ball
 {
   
   gx=gx+speedgx;
   gy=gy+speedgy;
   if (mousePressed==true) {
   speedgy=(mouseY/2-gy/2);
   speedgx=(mouseX/2-gx/2);
   }
   
   if(gy>height) {
     gy=0;
     count=count+1;
     background(255,0,0);
     gx=random(400);
     gy=random(400);
   }
   if(gy<0) {
     gy=height;
     count=count+1;
     background(255,0,0);
     gx=random(400);
     gy=random(400);
   }
   if(gx>width) {
     gx=0; 
      count=count+1;
      background(255,0,0);
      gx=random(400);
      gy=random(400);
   }
   if(gx<0) {
     gx=width; 
     count=count+1;
     background(255,0,0);
     gx=random(400);
     gy=random(400);
   }
 }
//void keyPressed() {
//  if (key==CODED) {
//if (keyCode==UP)
//{gy=gy-10;}
//if(keyCode==DOWN)
//{gy=gy+10;}
//if (keyCode==LEFT)
//{gx=gx-10;}
//if (keyCode==RIGHT)
//{gx=gx+10;}
// }
//}
   
//Red ball with bounce
void drawB (float x, float y)
{
wd=80;
ht=80;
  
ellipseMode(CENTER);
fill(250,0,0);
ellipse(x,y,wd,ht);
}
//bounce and wrapping
void moveB()
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
 
void time() {
  fill(0);
text ("Time:"+(millis()/1000), 250,20);
}

void collisions() {
  d=dist(gx,gy,bx,by);
  if (d<50) {
    count=count+1;
    gx=random(400);
    gy=random(400);
    background (255,0,0);
}
  text ("score:"+count,300,20);
}
//void keyPressed() {
//  if (key=='p')
//  {saveFrame("hw7.jpg");}}

