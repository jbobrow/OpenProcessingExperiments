
Zoog zoog1;
Zoog zoog2;

void setup() {
  size(200,200);
  smooth();
   zoog1 = new Zoog(100,125,60,60,16,random(255), random(255), random(255));
   zoog2 = new Zoog(50,50,30,30,16,random(255), random(255), random(255));
}

void draw() {
  background(255);
  float factor = constrain(mouseX/10,0,5);
  zoog2.jiggle(factor);
  zoog2.display();
  zoog1.jiggle(factor);
  zoog1.display();
}
class Zoog {
  float x;
  float y;
  float w;
  float h;
  float eyeSize;
  float eyeR;
  float eyeG;
  float eyeB;
  float diameter;
  Zoog (float tempX, float tempY, float tempW, float tempH, float tempEyeSize, float tempEyeR, float tempEyeG, float tempEyeB){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
    eyeR = tempEyeR;
    eyeG = tempEyeG;
    eyeB = tempEyeB;
    
  }
  void jiggle(float speed){
    x = x + random(-1,1)*speed;
    y = y + random(-1,1)*speed;
    
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    
    for (float i = y -h/3; i < y + h/2; i += 10) {
      stroke(0);
      line(x-w/4,i,x+w/4,i);
    }
    //Head
    stroke(0);
    fill(0);
    ellipse(x,y-h,w,h);
    //Body
    stroke(0);
    fill(175);
    rect(x,y,w/6,h);
    //Eyes
    diameter= random(20);
    fill(eyeR,eyeG,eyeB);
    ellipse(x-w/3,y-h,diameter,eyeSize*2);
    ellipse(x+w/3,y-h,diameter,eyeSize*2);
    //Legs
    stroke(0);
    line(x-w/12,y+h/2,x-w/4,y+h/2+10);
    line(x+w/12,y+h/2,x+w/4,y+h/2+10);
  }
}

