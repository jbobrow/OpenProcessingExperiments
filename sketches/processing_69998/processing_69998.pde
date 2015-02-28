
//Isla Hansen ihansen@andrew.cmu.edu
//copyright 2012
//homework 5 - initials function
//Move the mouse around to move the initials.
//Drag (click/hold & move) the mouse to change the colors of the initials.
//Press and hold the UP arrow to watch the initials grow, pop, and grow again.
 


float x,y,w,h;
color c1, c2, c3, c4, c5, c6, c7,c8,c9,c10,c11,c12;

void setup()
{

size(400,400);
c1= color(50,255,200);
c2= color(105,255,210);
c3= color(145,255,225);
c4= color(200,255,240);
c5= color(255,255,255);
c6= color(230,255,255);
c7=color(random(255), random(255), random(255));
c8=color(random(255), random(255), random(255));
c9=color(random(255), random(255), random(255));
c10=color(random(255), random(255), random(255));
c11=color(random(255), random(255), random(255));
c12=color(random(255), random(255), random(255));
x=width*.5;
y=height*.5;
w=200;
h=200;


}

void draw()
{
initials (mouseX, mouseY, w, h);

}

void initials (float x, float y, float w, float h)

{
  smooth();
//background(30,20,80);
strokeCap(SQUARE);
 
noStroke();
fill(c1);
ellipse(x,y,w,h);
 
fill(c2);
ellipse(x-(.08*w),y-(.08*h),w*.4,h*.4);
 
fill(c3);
ellipse(x-(.1*w),y-(.1*h),w*.3,h*.3);
 
fill(c4);
ellipse(x-(.1*w),y-(.1*h),w*.2,h*.2);
 
fill(c5);
ellipse(x-(.1*w),y-(.1*h),w*.1,h*.1);
 
 
noFill();
stroke(c6);
strokeWeight(6);
 
//top of i
beginShape();
curveVertex(x+(.1*w),y-(.4*h));
curveVertex(x-(.1*w),y-(.4*h));
curveVertex(x-(.3*w),y-(.3*h));
curveVertex(x-(.45*w),y-(.1*h));
curveVertex(x-(.5*w),y+(.1*h));
endShape();
 
//bottom of i
beginShape();
curveVertex(x+(.1*w),y+(.4*h));
curveVertex(x-(.1*w),y+(.4*h));
curveVertex(x-(.3*w),y+(.3*h));
curveVertex(x-(.45*w),y+(.1*h));
curveVertex(x-(.5*w),y-(.1*h));
endShape();
 
//i vertical
beginShape();
curveVertex(x-(.2*w),y-(.4*h));
curveVertex(x-(.3*w),y-(.3*h));
curveVertex(x-(.3*w),y+(.3*h));
curveVertex(x-(.1*w),y+(.4*h));
endShape();
 
//h outside curve
beginShape();
curveVertex(x,y-(.3*h));
curveVertex(x+(.2*w),y-(.38*h));
curveVertex(x+(.36*w),y);
curveVertex(x+(.2*w),y+(.38*h));
curveVertex(x,y+(.3*h));
endShape();
 
//h inside curve
beginShape();
curveVertex(x-(.2*w),y-(.3*h));
curveVertex(x+(.05*w),y-(.40*h));
curveVertex(x+(.18*w),y);
curveVertex(x+(.05*w),y+(.40*h));
curveVertex(x-(.2*w),y+(.3*h));
endShape();
 
//h horizontal curve
beginShape();
curveVertex(x+(.7*w),y-(.2*h));
curveVertex(x+(.36*w),y);
curveVertex(x+(.18*w),y);
curveVertex(x-(.1*w),y-(.2*h));
endShape();



}

void mouseDragged()
{
      c1=c7*mouseX;
      c2=c8*mouseY;
      c3=c9*mouseX;
      c4=c10*mouseY;
      c5=c11*mouseX;
      c6=c12*mouseY;
      
     
     
     
    }
   
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP) {
      w = w + 5;
      h = h + 5;
      if (w > 400){
        w = 5;
      }
      if (h > 400) {
        h = 5;

      }}}}
