
int diameter=5,x=0,y=0;
float r=255,b=0,g=0;
void setup(){
  size(300,300);
  stroke(255,255,255);
  frameRate(33);
}
void draw(){
  ellipse(x,y,diameter,diameter);
  fill(r,g,b);
  r=r-3;
  x=x+4;
  y=y+4;
  diameter=diameter+1;
  drawA();
}
int xA=300,yA=270;
float rA=0,gA=255,bA=0;
void drawA(){
  ellipse(xA,yA,diameter,diameter);
  fill(rA,gA,bA);
  gA=gA-3;
  xA=xA-4;
  yA=yA-4;
  diameter=diameter+1;
  drawB();
}

int xB=270,yB=300;
float rB=0,gB=0,bB=255;
void drawB(){
  ellipse(xB,yB,diameter,diameter);
  fill(rB,gB,bB);
  bB=bB-3;
  xB=xB-4;
  yB=yB-4;
  diameter=diameter+1;
}
  void mousePressed(){
    background(0+mouseX,255-mouseX,mouseY);
  }


