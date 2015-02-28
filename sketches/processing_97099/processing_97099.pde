
// Connections Spherical
//
// 'b' - draw lines/beziers
// 'r' - reset particles
// 'c' - clear screen

int w=600;
Dot c1, c2, c3, c4;
boolean bez = false;

void setup() {
 size(600,600);
 background(0);
 ellipseMode(CENTER);
 //frameRate(120);
 noFill();
 c1 = new Dot();
 c2 = new Dot();
 c3 = new Dot();
 c4 = new Dot();
 }

void draw() {
  //background(0);
  noFill();
  
  stroke(255-dist(c1.x,c1.y,c2.x,c2.y),0,0, 255-dist(c1.x,c1.y,c2.x,c2.y));
  strokeWeight( abs(map(dist(c1.x,c1.y,c2.x,c2.y),0,255,1,0.1) ));
  if (bez) { bezier(c1.x,c1.y,  c4.x,c4.y, c3.x,c3.y, c2.x,c2.y ); } else { line(c1.x,c1.y,c2.x,c2.y); }
  
  stroke(0,0,255-dist(c2.x,c2.y,c3.x,c3.y), 255-dist(c2.x,c2.y,c3.x,c3.y));
  strokeWeight( abs(map(dist(c2.x,c2.y,c3.x,c3.y),0,255,1,0.1) ));
  if (bez) { bezier(c2.x,c2.y,  c1.x,c1.y, c4.x,c4.y, c3.x,c3.y ); } else { line(c2.x,c2.y,c3.x,c3.y); }
  
  stroke(0,255-dist(c3.x,c3.y,c4.x,c4.y),0, 255-dist(c3.x,c3.y,c4.x,c4.y));
  strokeWeight( abs(map(dist(c3.x,c3.y,c4.x,c4.y),0,255,1,0.1) ));
  if (bez) { bezier(c3.x,c3.y,  c2.x,c2.y, c1.x,c1.y, c4.x,c4.y ); } else { line(c3.x,c3.y,c4.x,c4.y); }
  
  stroke(255-dist(c4.x,c4.y,c1.x,c1.y),255,0, 255-dist(c4.x,c4.y,c1.x,c1.y));
  strokeWeight( abs(map(dist(c4.x,c4.y,c1.x,c1.y),0,255,1,0.1) ));
  if (bez) { bezier(c4.x,c4.y,  c3.x,c3.y, c2.x,c2.y, c1.x,c1.y ); } else { line(c4.x,c4.y,c1.x,c1.y); }  
  
  c1.drawit();
  c2.drawit();
  c3.drawit();
  c4.drawit();
}

class Dot {
  float x,y,CX,CY,angle,speed,r;
 
  Dot() {
    reset();
 } 
  
  void drawit() {
   x= r*cos(radians(angle)) + CX;
   y= r*sin(radians(angle)) + CY;
   noStroke();
   fill(c1.x,c2.x,c3.x,c4.y);
   //strokeWeight(1);
   //point(x,y);
   //ellipse(x,y,2,2);
   angle+=speed;
}
  void reset() {
    speed = random(-2,2);
    if (speed<=0) {speed--;} else {speed++;}
    angle = random(360);
    CX = 300;
    CY = 300;
    r = random(100)+100;
  }
  
  
}

void keyPressed() {
 if (key == 'r') { c1.reset(); c2.reset(); c3.reset(); c4.reset(); } 
 if (key == 'b') { bez = !bez; }
 if (key == 'c') { background(0); }  
}


