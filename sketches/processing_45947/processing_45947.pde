

//import processing.opengl.*;

int radius = 100;
void setup() {
  size(400, 400, P3D);
  background(0);
  stroke(0);
}
void draw() {
  
  background(0);
  
  translate(width/2, height/2, 0);
  
  rotateX(frameCount * 0.04);
 
  if (mousePressed) {
    rotateY(frameCount * 0.02);
  }
  
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  while (t < 180) {
    s += 5;
    t += 1;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius*cos(radianS)*sin(radianT));
    float thisy = 0 + (radius*sin(radianS)*sin(radianT));
    float thisz = 0 + (radius*cos(radianT));
    if (lastx != 0) {
      
      stroke (130,10,139);
      point(thisx, thisy, thisz);
      
       stroke(250,8,8);
       point(thisx-15, thisy-15, thisz-15);
       
       //green
        stroke(41,214,26);
       point(thisx-10, thisy-2, thisz-50);
       
       //blue
       stroke(10,136,139);
       point(thisx*2, thisy+6, thisz+4);
       
       //yellow
       stroke(252,245,0);
       point(thisx-1, thisy*2, thisz-5);
       
             
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}


