
import processing.pdf.*;

int h = 0; //height at boxes are drawn
int s = 30; //height and width of box
float r = 0; //how far from the right the boxes are drawn
int end = 600; //the bottom of the picture
int rhs = 300; //the rhs of the picture

color green = color(0,0,255,200);

void setup(){
  size(rhs,end);
  background(255);
  
  //beginRecord(PDF, "angledLines.pdf");
  fill(green);
}

void draw(){
  while(h<end){
    drawBoxes(h,r,s);
    drawLines(h,s);
  
    h=h+4*s;
  }
 //endRecord();
  
}

public void drawBoxes(int h, float r, int s){
 //while(h<end){
  while(r<rhs+s){
  rect(r,h,s,s);
  rect(r-s/2,h+s,s,s);
  rect(r,h+2*s,s,s);
  rect(r+s/2,h+3*s,s,s);
  r=r+2*s; 
}
//}
}

public void drawLines(int h, int s){
  strokeWeight(2);
  line(0,h,rhs,h);
  line(0,h+s,rhs,h+s);
  line(0,h+2*s,rhs,h+2*s);
  line(0,h+3*s,rhs,h+3*s);
  strokeWeight(1);
}

