
// Assignment #3
// Name: Subin Park
// E-mail: spark02@brynmawr.edu 
// Date: 9/23/10

boolean button=false;
float c1;
float c2;
float c3;
float dia;
float x;
float y;

void setup() {
  size(500,500); 
  smooth();
}

void draw() {
  background(0,0,180);
  if(button) {  
    drawSmallFish(x,y,dia,color(c1,c2,c3));
    x=x-3;
  }
  drawBigFish();
}
void mousePressed() {
  c1=random(255);
  c2=random(255);
  c3=random(255);
  dia=random(20,80);
  x=mouseX;
  y=mouseY;
  if(height/8< x && y<((7*height)/8)) {
    button=!button;
  }
}
void drawBigFish() {
  noStroke();
  float m=0;
  float t=width/3;
  float e=60;
  float p=height/2;
  //fish mouth
  float mc1=random(255);
  float mc2=random(255);
  float mc3=random(255);
  fill(mc1,mc2,mc3);
  beginShape();
  curveVertex(m,m);
  curveVertex(m,m);
  curveVertex(m+t,m);
  curveVertex(m+t+e,m+e);
  curveVertex(m+(t/4),p);
  curveVertex(m+t+e,m+2*p-e);
  curveVertex(m+t,m+2*p);
  curveVertex(m,m+2*p);
  curveVertex(m,m+2*p);
  endShape();
  //fish eye
  stroke(0);
  fill(255);
  beginShape();
  curveVertex(m,m);
  curveVertex(m,m);
  curveVertex(m+(t/3),m);
  curveVertex(m+(t/2),m+(t/2));
  curveVertex(m,m+(t/3));
  curveVertex(m,m+(t/3));
  endShape();
  //fish eyeball
  fill(0);
  beginShape();
  curveVertex(m,m+(t/4));
  curveVertex(m,m+(t/4));
  curveVertex(m+(t/8),m+(t/8));
  curveVertex(m+(t/4),m);
  curveVertex(m+(t/3),m);
  curveVertex(m+(t/4),m+(t/4));
  curveVertex(m,m+(t/3));
  curveVertex(m,m+(t/3));
  endShape();
}
void drawSmallFish(float x,float y,float dia, color c) {
  //fish body
  fill(c);
  noStroke();
  ellipse(x,y,2*dia,dia);
  //fish tail
  fill(c);
  triangle(x+(dia/4),y,x+dia,y+dia,x+dia,y-dia);
  //fish eye
  fill(c1+100);
  ellipse(x-(dia/2),y,(dia/3),(dia/5));
}


