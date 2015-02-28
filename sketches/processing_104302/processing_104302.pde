
Zoog [] zoogies = new Zoog[200];

void setup() {
 size(500, 500);
 smooth();
 for (int i = 0; i < zoogies.length; i ++) {
  zoogies[i] = new Zoog(random(width), random(height), 30, 30, 8);
 } 
}

void draw() {
 background(255);
 for (int i = 0; i < zoogies.length; i++) {
  zoogies[i].display();
  zoogies[i].jiggle();
 } 
}

class Zoog {
 float x, y, w, h, eyeSize;

 Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
  x = tempX;
  y = tempY;
  w = tempW;
  h = tempH;
  eyeSize = tempEyeSize;
 } 


void jiggle() {
 x = x + random(-1, 1); 
 y = y + random(-1, 1); 
 
 x = constrain(x,0,width); 
 y = constrain(y,0,height);
}

void display() {
// Set ellipses and rects to CENTER mode 
ellipseMode(CENTER);
rectMode(CENTER);
for (float i = y-h/3; i < y + h/2; i+=10) {
stroke(0); 
line(x-w/4, i, x+w/4,i);
}


stroke(0); 
fill(175);
rect(x,y,w/6,h);

stroke(0); 
fill(255);
ellipse(x,y-h,w,h);

// Draw Zoog's eyes 
fill(0); 
ellipse(x-w/3,y-h,eyeSize,eyeSize*2);
ellipse(x+w/3,y-h,eyeSize,eyeSize*2);

// Draw Zoog's legs
stroke(0); 
line(x-w/12,y+h/2,x-w/4,y+h/2+10); 
line(x+w/12,y+h/2,x+w/4,y+h/2+10);
  }
}
