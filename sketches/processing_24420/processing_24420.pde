
import processing.pdf.*;

int r=300; //rhs of picture
int b=600; //bottom of pic
int m=150; //middle of picture (l to r)
float s=15; //height of box
float w=15; //width of box
float h=0; //height at box drawn
float g=0; //how far right box is drawn
float c=.815; //how much the width changes each time
float c2=.908; //how much the height changes each time

color blue = color(0,0,255);

void setup(){
  size(r,600);
  background(255);
  
  //beginRecord(PDF, "linePattern.pdf");
  noStroke();
}

void draw(){
  while(g<300){
    s=15;
    while(h<600){
      drawBox(g,h,w,s);
      h=h+2*s;
      if(h<300)
      s=s*c2;
      else
      s=s/c2;
    }
    h=0;
    
    g=g+2*w;
    if(g<150)
    w=w*c;
    else
    w=w/c;
  }
    
 //endRecord();
}

public void drawBox(float x, float y, float w, float h){
  fill(blue);
  rect(x,y,w,h);
  rect(x+w,y+h,w,h);
}

