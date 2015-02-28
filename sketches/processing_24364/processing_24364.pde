
import processing.pdf.*;

int w = 0; //width
float h = 150; //height
int lh = 150; //line height
float g = 0; //position from right
float p = 15; //change
int end = 600; //end of picture
int n = 300; //height of box
int r = 300; //rhs of picture
float s = 300; //width of box
float change = 0.91; //amount width changes

color red = color(0,0,255,160);
color white = color(255);
color current = red;

void setup(){
  size(r,end);
  fill(255);
  strokeWeight(1);
  beginRecord(PDF, "boxIllusion.pdf");
 }

void draw(){
  drawTop();
  drawSquares();
  drawLines();
  endRecord();
  }

public void drawTop(){
  while(w<=135){
      fill(current);
      rect(0,w,r,end);
      w=w+15;
      end=end-30;
      changeColor(current);
  }
}

public void drawSquares(){
  current = red;
  while(s>1){
    fill(current);
    rect(g,h,s,s);
    g=g+p;
    h=h+p;
    s=s-2*p;
    p=p*change;
    changeColor(current);
  }
}

public void drawLines(){
  line(0,150,300,450);
  line(300,150,0,450);
}

public void changeColor(color one){
  color two = one;
  if(two==red)
    current=white;
  if(two==white)
    current=red;
}


