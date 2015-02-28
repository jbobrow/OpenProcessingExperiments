
import processing.pdf.*;

int sWdth =200;
int sHght =sWdth*2;

void setup() {
  size (sWdth,sHght);
  //beginRecord(PDF, "bubbbles.pdf");
}

void bubbles (float x, float y, float wdth, float hght) {
  fill(20,160,240,70);
  stroke(255,50);
  ellipse(x,y,wdth,hght);
 /* noFill();
  arc(x,y,7*wdth/10,7*hght/10,PI/2,PI);
  arc(x,y,wdth/2, 7*hght/10,PI/2,PI);   //this is the part of the code that adds shine to the bubbles
  line((x-(wdth/4)),y,x-7*wdth/20,y);*/
}


void draw() {
  smooth();
  for (float y = sHght; y>-1; y=y-sHght/100) {
    color from = color(0,130,220); 
    color to = color(0,30,50);
    color inter = lerpColor( from, to, y/sHght);

    noStroke();
    fill(inter);
    rect(0,y,sWdth,sHght/100+1);
  }
  bubbles(sWdth/5,sHght*0.95,sWdth/10,sWdth/10);
  bubbles(sWdth*3/5,sHght*0.95,sWdth/10,sWdth/10);
  bubbles(sWdth*2/5,sHght*.875,sWdth*3/20,sWdth*3/20);
  bubbles(sWdth*4/5,sHght*.875,sWdth*3/20,sWdth*3/20);
  bubbles(sWdth/5,sHght*.775,sWdth*4/20,sWdth*4/20);
  bubbles(sWdth*3/5,sHght*.775,sWdth*4/20,sWdth*4/20);
  bubbles(sWdth*2/5,sHght*.65,sWdth*5/20,sWdth*5/20);
  bubbles(sWdth*4/5,sHght*.65,sWdth*5/20,sWdth*5/20);  
  bubbles(sWdth/5,sHght/2,sWdth*6/20,sWdth*5/20);
  bubbles(sWdth*3/5,sHght/2,sWdth*6/20,sWdth*5/20);
  bubbles(sWdth*2/5,sHght*.325,sWdth*7/20,sWdth*5/20);
  bubbles(sWdth*4/5,sHght*.325,sWdth*7/20,sWdth*5/20);
  bubbles(sWdth/5,sHght*.125,sWdth*15/40,sWdth*5/20);
  bubbles(sWdth*3/5,sHght*.125,sWdth*15/40,sWdth*5/20);

  endRecord();
}


