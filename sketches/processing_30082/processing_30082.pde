
// GUI Triangle - Sid Guglielmino 18/06/2010
// gv3.com.au
import controlP5.*;
ControlP5 controlP5;
 
float ax=350;    // point A
float ay=350;
float bx=80;     // point B
float by=350;
float cx=350;    // point C
float cy=80;
 
void setup(){
  size(700,700);
  PFont fontA = loadFont("Arial-BoldMT-48.vlw");
  smooth();
  controlP5 = new ControlP5(this);
  controlP5.addSlider("ax",  50,650,  10,10,   200,15);
  controlP5.addSlider("ay",  50,650,  10,30,   200,15);
  controlP5.addSlider("bx",  50,650,  10,50,   200,15);
  controlP5.addSlider("by",  50,650,  10,70,   200,15);
  controlP5.addSlider("cx",  50,650,  10,90,   200,15);
  controlP5.addSlider("cy",  50,650,  10,110,  200,15);
}
 
void draw(){
 background(0);
 
 fill(255,0,0);                    // red triangle
 triangle(ax,ay,bx,by,cx,cy);      // point A x,y    point B x,y    point C x,y

 fill(255,90);                     // Draw circles at each point
 ellipse(ax,ay,26,26);
 fill(255,90);  
 ellipse(bx,by,26,26);
 fill(255,90);  
 ellipse(cx,cy,26,26);

 fill(255); 
 text("A", ax-4, ay+5);             // Labels on Points
 text("B", bx-4, by+5);
 text("C", cx-4, cy+5);
}


