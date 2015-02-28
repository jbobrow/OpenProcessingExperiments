

// Assignment #3
// Name: Ying Ying Sheng
// E-mail: ysheng@brynmawr.edu
// Date: september 23rd

PImage myPic;
//the bottom middle coordinates of (x,y), 
//and the width (w) and height(h) of the enclose rectengle
float x, y, w, h; 

float u, v;
float speed=1;
float m;
float n;
//distance between loops
float xx,yy;


void setup() {
  size(950,633);
  background(255);
  frameRate(70);
  
  myPic=loadImage("L1001362_3_4_5_6_7_8.jpg");
  u=90; 
  v=211; 
  w=180; 
  h=231;
  xx=200;
  yy=160;
  m=height+211;
  n=width+90;
  
  smooth();
}

void draw() {
 
image (myPic,0,0,950,633);
drawPeacock(u, v);
}

//As key pressed the peacock pattern become smaller 
//and further apart from each other
void keyPressed() {
u=80;
v=110;
w=60;
h=77;
xx=90;
yy=95;
m=height;
n=width;
}

//As mouse clicked a bigger peacock pattern is created at the position mouse clicked
void mouseClicked() {
  u=mouseX;
  v=mouseY;
  w=(random(200,60));
  h=1.28*w;
  xx=970;
  yy=990;
  n=width;
  m=height;
}

   
void drawPeacock(float x, float y) {
  stroke(255,255,255,200);
  strokeWeight(5);
  noFill();
  
//draw a peacock
//outside circle
for( y=v; y<m;y+=yy){
for( x=u; x<n; x+=xx){

fill(random(255),random(255),random(255),random(255));
beginShape();

curveVertex(x+2*w/11,y-12*h/13);
curveVertex(x+w/11,y-h);
curveVertex(x+3*w/11,y-12*h/13);
curveVertex(x+4*w/11,y-10*h/13);
curveVertex(x+5*w/11,y-8*h/13);
curveVertex(x+6*w/11,y-5*h/13);
curveVertex(x+5*w/11,y-3*h/13);
curveVertex(x+3*w/11,y-h/13);
curveVertex(x,y);
curveVertex(x-3*w/11,y-h/13);
curveVertex(x-5*w/11,y-3*h/13);
curveVertex(x-6*w/11,y-5*h/13);
curveVertex(x-5*w/11,y-9*h/13);
curveVertex(x-4*w/11,y-11*h/13);
curveVertex(x-3*w/11,y-12*h/13);
curveVertex(x-1.1*w/11,y-12.8*h/13);
curveVertex(x+w/11,y-h);
endShape(CLOSE);

//inside circle
noFill();
beginShape();

curveVertex(x+1.8*w/11,y-11.2*h/13);
curveVertex(x+2.8*w/11,y-10*h/13);
curveVertex(x+4*w/11,y-8*h/13);
curveVertex(x+5*w/11,y-5*h/13);
curveVertex(x+4*w/11,y-3*h/13);
curveVertex(x+2*w/11,y-2*h/13);
curveVertex(x,y-1.5*h/13);
curveVertex(x-2*w/11,y-2*h/13);
curveVertex(x-4*w/11,y-3*h/13);
curveVertex(x-4.5*w/11,y-5*h/13);
curveVertex(x-3.5*w/11,y-9*h/13);
curveVertex(x-2*w/11,y-11*h/13);
curveVertex(x+w/11,y-12*h/13);
curveVertex(x+2*w/11,y-9*h/13);
endShape(CLOSE);

////middle
fill(random(255),random(255),random(255),random(255));
beginShape();

curveVertex(x+0.5*w/11,y-5*h/13);
curveVertex(x+0.5*w/11,y-5*h/13);
curveVertex(x-w/11,y-4*h/13);
curveVertex(x-2*w/11,y-5*h/13);
curveVertex(x-1.5*w/11,y-6*h/13);
curveVertex(x+0.5*w/11,y-7.5*h/13);
curveVertex(x+2*w/11,y-7*h/13);
curveVertex(x+2.5*w/11,y-6*h/13);
curveVertex(x+3*w/11,y-5*h/13);
curveVertex(x+2*w/11,y-4*h/13);
curveVertex(x+0.5*w/11,y-5*h/13);
curveVertex(x+0.5*w/11,y-5*h/13);
endShape(CLOSE);
 }
}
}









