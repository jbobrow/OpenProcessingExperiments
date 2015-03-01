
//Based on http://www.openprocessing.org/sketch/172431

float a = 90;
float lastx = 0;
float lasty = 0;
  
void setup() {
  size (640,640);
  background(240);
  noStroke();  
}

void draw() {
  background(240);
  smooth ();
  float offset =height/2;
  float scaleVal = height/4;
  float angleInc = 10;
  float angle = 90;  

  for (int y = height/4; y <= height-height/4; y += height/128) {
    float x = offset + (cos(angle+a) * scaleVal);
    float z = offset + (sin(angle+60+a) * scaleVal);
    //float z = offset + 1;
    //fill(180,53,250,60);
    //stroke(#C907E8);
    ellipse(x,y,z/64,z/64);
    fill(0);
    stroke(0,64);
    if (y!=height/4) {
      line(x,y,lastx,lasty);
    }
    
    lastx = x;
    lasty = y;    
    angle +=angleInc;
  }
  a+=0.01;
}


