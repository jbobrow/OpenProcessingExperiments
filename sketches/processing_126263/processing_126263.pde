
// This sketch builds on a prior work, "ColourArcs-Controlled", created by jim murfitt
// http://studio.sketchpad.cc/sp/pad/view/ro.9LY6heTNYyLnF/rev.1079
 
 
 
//Further development of my previous sketch http://www.openprocessing.org/sketch/20177
// moving the mouse left and right will change the weight of the drawn lines
// Speed is controlled by left clicking and moving the mouse up and down
// The rate of fade for the drawn lines is controlled by right clicking the //mouse while moving it left and right.
 
float fade = (1);
float d = (3);
float e = (6);
float f = (9);
int g = (24);
float h = (1);
float lwgt = (0.5);
 
 
void setup()
{
  size(500, 500, P2D);
  
  background(0);
};
 
 
 
 
void draw()
{
    
    
    
    fade = (map (mouseX, 0,500,0.01,0.99) );
    if (mousePressed && (mouseButton == RIGHT)){ lwgt = map (mouseY, 0,500,0.01,0.99);}
 
 
 rectMode(CORNER);
  fill(0,fade);
  rect(-1, -1, width+2, height+2);
  
 
 
  
  if (mousePressed && (mouseButton == LEFT)) {
    g = mouseY+1;
  }
 
 
  strokeWeight(lwgt);
 
  frameRate(g);
 colorMode(HSB, 360,100,100);
c1 = (frameCount*0.25)%360;
c2 = 75;
c3 = 75;
 
 
  pushMatrix();
 
  translate(250, 250);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/e %360));
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/f %360));
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();  
  pushMatrix();
 
  translate(250, 250);
  rotate(radians(frameCount/d %360));
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/d %360));
 
  pushMatrix();
 
  translate(0, 100);
  rotate(radians(frameCount/d %360));
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/e %360));
 
  pushMatrix();
 
  translate(75, 0);
  rotate(radians(frameCount/e %360));
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
 
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/f %360));
 
  pushMatrix();
 
  translate(0, 50);
  rotate(radians(frameCount/f %360));
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/d %360));
 
  pushMatrix();
 
  translate(0, 100);
  rotate(radians(frameCount/e %360));
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/d %360));
 
  pushMatrix();
 
  translate(0, 100);
  rotate(radians(frameCount/f %360));
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/e %360));
 
  pushMatrix();
 
  translate(75, 0);
  rotate(radians(frameCount/f %360));
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 50);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/e %360));
 
  pushMatrix();
 
  translate(75, 0);
  rotate(radians(frameCount/d %360));
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/e %360));
 
  pushMatrix();
 
  translate(75, 0);
  rotate(radians(frameCount/d %360));
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/f %360));
 
  pushMatrix();
 
  translate(0, 50);
  rotate(radians(frameCount/d %360));
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(0, 100);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
 
 
 
  pushMatrix();
  translate(250, 250);
  rotate(radians(frameCount/f %360));
 
  pushMatrix();
 
  translate(0, 50);
  rotate(radians(frameCount/e %360));
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/d % 360));
  line(0, 0, 0, 100);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/e %360));
  line(0, 0, 75, 0);
  stroke(c1,c2,c3);
  popMatrix();
 
  pushMatrix();
  translate(75, 0);
  rotate(radians(frameCount/f %360));
  line(0, 50, 0, 0);
  stroke(c1,c2,c3);
  popMatrix();
  popMatrix();
  popMatrix();
}
 
;


