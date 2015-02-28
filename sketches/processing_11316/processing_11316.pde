
 /*for one example, we run without the smooth-function...
 means no smoothing of the edges of zoogs shapes*/
 
 void setup() {
   size(200,200);
   noSmooth();
   background(116,185,143);
   ellipseMode(CENTER);
   rectMode(CORNER);
 }
 
 /*MY Zoog with color in the background and a opaque ellipse over all
 AND variable Stroke-Weightness*/
 
 void draw() {
   noStroke();
   fill(126,195,153,220);
   ellipse(0,0,250,250);
   noStroke();
   fill(200);
   rect(75,75,30,70);
   strokeWeight(1);
   stroke(170);
   fill(180);
   ellipse(90,50,50,50);
   stroke(250);
   fill(255);
   ellipse(90,45,40,15);
   noStroke();
   fill(0);
   ellipse(100,45,5,5);
   stroke(200);
   strokeWeight(3);
   line(75,145,70,155);
   line(105,145,110,155);
 }
  

