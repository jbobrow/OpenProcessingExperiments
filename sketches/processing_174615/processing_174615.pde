
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
  background(242,208,171);
  //render eyes
  strokeWeight(50); 
  point(200, 100); 
  point(400, 100);
  //render nose
  strokeWeight(10);
  line(300,150,200,250);
  line(200,250,300,300);
  //render mouth
  strokeWeight(10);
  line(150,400,width-150,400);
  //render tongue;
  strokeWeight(10);
  catmullRom(0, 0, 200, 400, mouseX, mouseY, width-200, 400 ); 
  catmullRom(200, 400, mouseX, mouseY, width-200, 400, width, 0);
  fill(242,93,93);
}
