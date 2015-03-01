
void setup() { 
  size(600, 600);
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
  background(255);
  
  strokeWeight(10);
  float w= map(mouseX,0,600,50,200);
  float r= map(mouseX,0,600,250,0);

  stroke(r,0,0);
  catmullRom(200, 0, 400, 100, 300+w, 250+w-60, 400, width-100 ); 
  catmullRom(400, 100, 300+w,250+w-60, 400,width-100, 0, width);
 
  catmullRom(400, 0, 200, 100, 300-w, 250+w-60, 200, width-100 ); 
  catmullRom(200, 100, 300-w,250+w-60, 200,width-100, 600, width);
}

