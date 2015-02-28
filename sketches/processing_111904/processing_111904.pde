
float r;
float g;
float b;
float a;

float x;
float y;
float diam=10;

float x1;
float y1;
float side1;

float x2;
float y2;
float side2;

float X;
float Y;
float DIAM;

void setup() {
  size(800,800);
  background(0);
  frameRate(25);
}

void draw() {
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  
  //Q2
  
  if (diam>80) {
    diam=10;
  }
  diam+=0.5;
  x=40+int(random(5))*80;
  y=40+int(random(5))*80;
  
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  
  // Q1
  
  rectMode(CENTER);
  x1=440+int(random(5))*80;
  y1=40+int(random(5))*80;
  fill(r,g,b,a);
  if (side1>80) {
    side1=10;
  }
  side1+=0.5;
  rect(x1,y1,side1,side1);

  // Q3
  
  x2=40+int(random(5))*80;
  y2=440+int(random(5))*80;
  if (side2>80) {
    side2=10;
  }
  side2+=0.5;
  rect(x2,y2,side2,side2);
  
  // Q4
  
   if (DIAM>80) {
   DIAM=10;
  }  
  DIAM+=0.5;
  X=440+int(random(5))*80;
  Y=440+int(random(5))*80;
  
  fill(r,g,b,a);
  ellipse(X,Y,DIAM,DIAM);
  
  // restart
   if (frameCount==450 || frameCount==900 || frameCount==1350 || 
   frameCount==1800 || frameCount==2250 || frameCount==2700) {
   background(0);
  }
  
}



  

  
  


