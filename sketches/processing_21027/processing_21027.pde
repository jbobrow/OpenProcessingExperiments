
float FI = 1.618;

boolean creciendo;
float scaleRate;

void doricColumn(float x, float y1, float y2) {
  float l = y2-y1;  
  float r = l/8;
  float r2 = r*FI;  
 
  //noFill();  
  /*line(x-r*.5,y1,x+r*.5,y1);
  line(x-r*.5,y2,x+r*.5,y2);
  */
  

  beginShape();
  vertex(x-r*.5,y1);
  //stroke(0);
  bezierVertex(x-r2*.5,y1+(y2-y1)/FI,x-r2*.5,y1+(y2-y1)/FI,x-r*.5,y2);
  vertex(x+r*.5,y2);
  bezierVertex(x+r2*.5,y1+(y2-y1)/FI,x+r2*.5,y1+(y2-y1)/FI,x+r*.5,y1);
  vertex(x-r*.5,y1);
  endShape();
}

void setup() {
 // size(600,round(map(157,0,192,0,600)));
 size(192,157);
  //smooth();
  creciendo=true;
  scaleRate=.1;
}

void displayColumns() {
  noStroke();
  fill(172,222,214);
  rectMode(CORNERS);
  rect(-width*100,-height*100,width*100,height-height/FI+height/FI/FI);
  fill(100,222,160);
  rect(-width*100,height-height/FI+height/FI/FI,width*100,height*100);
  
  stroke(0);
  line(-width*100,height-height/FI+height/FI/FI,width*100,height-height/FI+height/FI/FI);
  fill(255);
  doricColumn(.25*width,height-height/FI,height);
  doricColumn(.4*width,height-height/FI,height);
  doricColumn(.1*width,height-height/FI,height);
  doricColumn(.75*width,height-height/FI,height);
  doricColumn(.9*width,height-height/FI,height);
  doricColumn(.6*width,height-height/FI,height);
}

void displayChapital() {
  float aureanTableau = (height-height/FI)/FI;
  rectMode(CORNERS);
  rect(.05*width,height-height/FI-aureanTableau/FI*.5,.95*width,height-height/FI);
  rect(.02*width,height-height/FI-aureanTableau/FI,.98*width,height-height/FI-aureanTableau/FI*.5);
  rect(.5*width-(height-height/FI),0,.5*width+(height-height/FI),aureanTableau);
}

float a=.1;

void draw() {
  frameRate(6);
  background(200);
 /* translate(width*.5,height*.5);
  if (a<TWO_PI) {
    a+=.1;
    rotate(a);
  }
  translate(-width*.5,-height*.5);*/
  a+=.1;
  float xpos=lerp(0,width*.5,1-scaleRate);
  xpos-= cos(a)*xpos*.5;
  float ypos=lerp(0,height-height/FI,1-scaleRate);
  translate(xpos,ypos);
  scale(scaleRate);
  if (creciendo) {
    scaleRate+=.1;
    a+=.1;
  }
  else {
    scaleRate-=.1;
    a-=.1;
  }
  if (scaleRate<=.2) creciendo=true;
  if (scaleRate>=1) creciendo=false;
  println(scaleRate);
  displayColumns();
  displayChapital();
  

 
}

