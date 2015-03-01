
float []x = {0, 100, 295, 500, 600};
float []y = {0, 300, 405, 300, 0};
float xinc = 0, yinc = 0;
float r = 0;
int hue; 
void setup() { 
  size(600, 600);
  colorMode(HSB, 360,100, 100);
   hue= 200;
}
void catmullRom (float x1, float y1, float x2, float y2, 
float x3, float y3, float x4, float y4) { // equivalent to Processing curve() function
  beginShape();
  for (float t=0; t<=1; t+=0.02) {
    float t2 = t*t;
    float t3 = t2*t;
    float x= (-.5*x1 + 1.5*x2 -1.5*x3 + .5*x4)*t3 + (x1 -2.5*x2 +2*x3 -.5*x4)*t2 + (-.5*x1 + .5*x3)*t + x2; 
    float y= (-.5*y1 + 1.5*y2 -1.5*y3 + .5*y4)*t3 + (y1 -2.5*y2 +2*y3 -.5*y4)*t2 + (-.5*y1 + .5*y3)*t + y2; 
    vertex(x, y);
  }
  endShape();
}
void draw() { 
  translate(width/2, height/2);
  
  rotate(r);
  background(0);
  noFill();
  
  
  stroke(hue,100,100);
  strokeWeight(10);
  for(int i=0; i<6; i++){
    pushMatrix();
    rotate(radians(i*60));
  catmullRom(x[0], y[0], x[1], y[1], x[2], y[2], x[3], y[3]); 
  catmullRom(x[1], y[1], x[2], y[2], x[3], y[3], x[4], y[4]);
  popMatrix();
}
  if(hue > 360) hue -= 360;
  else if(hue<0) hue +=360;
  hue += noise(xinc, yinc)*360;
  for(int i=0; i<5; i++){
    if(i==2) continue;
     x[i] += map(noise(xinc,yinc), 0, 1, -10 , 10);
     y[i] += map(noise(yinc,xinc), 0, 1, -10 , 10);
     yinc+=0.1;
  }
  
  r+= noise(xinc, yinc)*360;
  xinc+=0.1;
}

