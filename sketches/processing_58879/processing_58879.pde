
int x=0, y=0, w=200, h=200, r=255, g=0, b=0, hVel=1,wVel=-1;
float theta=0;

void setup() {
  size(1000,1000);
  background(255);
  smooth();
}

void draw() {
  //background(255);
  fill(r,g,b,60); //motionblur
  rect(-100,-100,1200,1200); //motionblur
  pushMatrix();
  translate(width/2,height/2);
  rotate(theta);
  fill(255);
  strokeWeight(2);
  
  newColor();
  stroke(r,255,b);
  pushMatrix();
  translate((int)h/4,0);
  rotate(theta*theta);
  beginShape();
  vertex(-x,-y);
  vertex(-x-h,-y);
  vertex(-h,-y-w);
  vertex(-2*x,-2*y);
  endShape(CLOSE);
  popMatrix();
  //rect(x-w,y-h,w,h);
  
  newColor();
  fill(255);
  stroke(255,g,b);
  pushMatrix();
  translate(-(int)h/4,0);
  rotate(theta*theta);
  beginShape();
  vertex(x,y);
  vertex(x+(431-w)/2,y);
  vertex(w/2,y+h/2);
  endShape(CLOSE);
  popMatrix();
  
  //newColor();
  stroke(r,g,255);
  pushMatrix();
  translate(-(int)h/4,0);
  rotate((theta*theta)/2);
  beginShape();
  vertex(h-w,w-h);
  vertex(h+(431-h)/2,w);
  vertex(h/2,w+w/2);
  endShape(CLOSE);
  popMatrix();
  //rect(x,y,w/2,h/2);
  popMatrix();
  theta+=.1;
  if(h>500) hVel=-1;
  if(h<2) hVel=1;
  h+=hVel;
  if(w>431) wVel=-1;
  if(w<2) wVel=1;
  w+=wVel;
}

void newColor() {
  if (r==255) {
    r=0;
    b=255;
  }
  else if (g==255) {
    g=0;
    r=255;
  }
  else if (b==255) {
    b=0;
    g=255;
  }
}

