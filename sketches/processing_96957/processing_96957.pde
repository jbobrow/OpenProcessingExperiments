
// Connections
//
// 'b' - draw lines/beziers
// 'r' - reset particles
// 'c' - clear screen

int w=600;
Dot c1, c2, c3;
boolean bez = false;

void setup() {
 size(600,600);
 background(0);
 ellipseMode(CENTER);
 noFill();
 c1 = new Dot();
 c2 = new Dot();
 c3 = new Dot();
 }

void draw() {
  //background(0);
  noFill();
  stroke(100,255-dist(c1.x,c1.y,c2.x,c2.y),255, 255-dist(c1.x,c1.y,c2.x,c2.y));
  strokeWeight( abs(map(dist(c1.x,c1.y,c2.x,c2.y),0,255,2,0.1) ));
  if (bez) { bezier(c1.x,c1.y,  c3.x,c3.y, c3.x,c3.y, c2.x,c2.y ); } else { line(c1.x,c1.y,c2.x,c2.y); }
  stroke(100,255-dist(c2.x,c2.y,c3.x,c3.y),255, 255-dist(c2.x,c2.y,c3.x,c3.y));
  strokeWeight( abs(map(dist(c2.x,c2.y,c3.x,c3.y),0,255,2,0.1) ));
  if (bez) { bezier(c2.x,c2.y,  c1.x,c1.y, c1.x,c1.y, c3.x,c3.y ); } else { line(c2.x,c2.y,c3.x,c3.y); }
  stroke(100,255-dist(c1.x,c1.y,c3.x,c3.y),255, 255-dist(c1.x,c1.y,c3.x,c3.y));
  strokeWeight( abs(map(dist(c1.x,c1.y,c3.x,c3.y),0,255,2,0.1) ));
  if (bez) { bezier(c1.x,c1.y,  c2.x,c2.y, c2.x,c2.y, c3.x,c3.y ); } else { line(c1.x,c1.y,c3.x,c3.y); }
  c1.drawit();
  c2.drawit();
  c3.drawit();  
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
   fill(100,100,255,200);
   //ellipse(x,y,20,20);
   angle+=speed;
}
  void reset() {
    speed = random(-2,2);
    if (speed<=0) {speed--;} else {speed++;}
    angle = random(360);
    CX = random(300)+150;
    CY = random(300)+150;
    r = random(100)+100;
  }
  
  
}

void keyPressed() {
 if (key == 'r') { c1.reset(); c2.reset(); c3.reset(); } 
 if (key == 'b') { bez = !bez; }
 if (key == 'c') { background(0); }  
}


