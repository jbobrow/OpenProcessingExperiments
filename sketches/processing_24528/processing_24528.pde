
import processing.pdf.*;

int sWdth =200;
int sHght =sWdth*2;

void setup() {

  size (sWdth,sHght);
 // beginRecord(PDF, "rain.pdf");
}

void stream(float x, float y,float ylength,float ellipSize){
 stroke(255,50);
fill(100,110,250,150);
ellipse(x,y,ellipSize,ellipSize);
 ellipse(x,y+ylength*1/6,ellipSize*1.5,ellipSize*1.5);
 ellipse(x,y+ylength*2/6,ellipSize*2,ellipSize*2);
 ellipse(x,y+ylength*3/6,ellipSize*2.5,ellipSize*2.5);
 ellipse(x,y+ylength*4/6,ellipSize*3,ellipSize*3);
 ellipse(x,y+ylength*5/6,ellipSize*3.5,ellipSize*3.5);  
}

void draw(){
  smooth();
  for (float y = sHght; y>-1; y=y-sHght/100) {
    color from = color(0,130,220); 
    color to = color(255);
    color inter = lerpColor( from, to, y/sHght);

    noStroke();
    fill(inter);
    rect(0,y,sWdth,sHght/100+1);
  }

stream(sWdth/4,sHght/10,sWdth*2/5,sWdth/15);
stream(sWdth/2,sHght*2/5,sWdth*2/5,sWdth/15);
stream(sWdth/4,sHght*7/10,sWdth*2/5,sWdth/15);
stream(sWdth*3/4,sHght/10,sWdth*2/5,sWdth/15);
stream(sWdth*3/4,sHght*7/10,sWdth*2/5,sWdth/15);
stream(sWdth,sHght*2/5,sWdth*2/5,sWdth/15);
stream(0,sHght*2/5,sWdth*2/5,sWdth/15);
//endRecord();
}


