
Zoog zoog;
 void setup() {
 size(500,500);
 smooth();
 zoog = new Zoog(100,125,60,60,16);
}

void draw() {
  background(255);

  float factor = constrain(mouseX/10,0,5);
  zoog.jiggle(factor); 
  zoog.display();

}

class Zoog {

float x,y,w,h,eyeSize;

Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {

x = tempX;
y = tempY;
w = tempW;
h = tempH;
eyeSize = tempEyeSize;
}


void jiggle(float speed) {

 x = x + random(-1, 1) *speed;
 y = y + random(-1, 1) *speed; 
 
}

void display() {

 ellipseMode(CENTER);
 rectMode(CENTER);
for (float i = y - h/3; i < y + h/2; i += 10) {
 stroke(0); 
 line(x-w/4,i,x+w/4,i);
}


 stroke(0); 
 fill(175);
 rect(x,y,w/6,h);

 fill(255);
 ellipse(x,y-h,w,h);
 
 fill(0);
 ellipse(x-w/3,y-h,eyeSize, eyeSize*2); 
 //ellipse(x+w/3, y-h, eyeSize, eyeSize*2);

 stroke(0);
 //line(x-w/12, y+h/2, x–w/4, y+h/2+10);
 line(x+w/12,y+h/2,x+w/4,y+h/2+10);
 }
}
