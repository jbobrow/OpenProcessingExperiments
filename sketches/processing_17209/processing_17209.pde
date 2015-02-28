
import processing.xml.*;
import geomerative.*;

RFont f;
RShape grp;
RShape grp2;
RShape s;
float pos;
float len;
float angle;

float ANGLEERROR = 0.01;
float POINTERROR = 0;


float LENGTHTANGENT = 20;
float LENGTHTANGENTGROWTH = 1.0001;//04;


int ALPHAVALUE = 3;


int VELOCITY = 500;

void setup(){
  size(540, 400);
  smooth();

  RG.init(this);
  
 grp = RG.getText("Happy new year!!", "Bauhaus 93.TTF",50, CENTER);
  grp2 = RG.getText("designplaygrounds.com", "Bauhaus 93.TTF",15, CENTER);
 
  LENGTHTANGENT = LENGTHTANGENT * width/800F;
  translate(width/2, height/2);
 
  noFill();
  background(255);
}

void draw(){
  translate(width/2, height/2);
  
  pushMatrix();
  for(int k=0;k<VELOCITY;k++){
     stroke(14,56,random(255), ALPHAVALUE);
    pos = random(0.01, 0.99);

    RPoint tg = grp.getTangent(pos);
    RPoint p = grp.getPoint(pos);
    
    p.x = p.x + random(-POINTERROR,POINTERROR);
    p.y = p.y + random(-POINTERROR,POINTERROR);

    len = random(-LENGTHTANGENT, LENGTHTANGENT);
    angle = atan2(tg.y, tg.x) + random(-ANGLEERROR, ANGLEERROR);

    line(p.x, p.y, p.x + len*cos(angle+random(4)), p.y + len*sin(angle));
  }
      
  popMatrix();
  LENGTHTANGENT *= LENGTHTANGENTGROWTH;
  pushMatrix();
  translate(160,180);
  grp2.draw();
  popMatrix();
}
void mousePressed(){
  background(255);
  
}

