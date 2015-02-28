
void setup() {
  size(500,500);
  background(0);
  frameRate(10);
}

void draw() {
  if (mousePressed) {
    float d1 = generateD1();
    float d2 = generateD2();
    fill(random(255),random(255),random(255));
    yinyang(mouseX,mouseY,d1,d2);
  }
}

float generateD1() {
  float d1 = ((width-mouseX)/4)+1;
  return d1;
}

float generateD2() {
  float d2 = ((height-mouseY)/4)+1;
  return d2;
}

void mouseReleased() {
  fill(0,0,0);
  rect(0,0,width,height);
}

void yinyang(float x, float y, float d1, float d2) {
  
  // weight/pull of curve
  float w = d1/4;
  
  ellipse(x,y,d1,d2);
  
  stroke(0);
  
  // bottom bezier
  float x1=x;
  float y1=y;
  float x2=x;
  float y2=y+d1/2;
  float cx1=x1+w;
  float cy1=y1;
  float cx2=x1+w;
  float cy2=y2;
  bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2);
  
  // top bezier
  y2=y-d1/2;
  cx1=x-w;
  cx2=x-w;
  cy2=y2;
  bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2);
  
}


