
/**
 * faling ladder
 *
 *
 * Matthew Conroy ( conroy (at) math.washington.edu )
 **/

HScrollbar hs1, hs2, hs3, hs4, hs5, hs6,hs7;

float lasta, lastb; // to keep track of whether things have changed
int lastm;

void setup()
{
  size(700, 600);
  noStroke();
  int hbarthick=10;
  hs1 = new HScrollbar(0, height-70, width-1, hbarthick, 3*5+1,50);
  hs2 = new HScrollbar(0, height-40, width-1, hbarthick, 3*5+1,50);
  hs3 = new HScrollbar(0, height-10, width-1, hbarthick, 3*5+1,50);
  //hs4 = new HScrollbar(0, height-30, width-1, hbarthick, 3*5+1,50);
  //hs5 = new HScrollbar(0, height-20, width-1, hbarthick, 3*5+1,50);
  //hs6 = new HScrollbar(0, height-10, width-1, hbarthick, 3*5+1,50);
  //hs7 = new HScrollbar(0, height-70, width-1, hbarthick, 3*5+1,50);
  
}

void draw()
{
  background(255);
  smooth();
  
  int vertAdjust=50;

  // Get the position of the scrollbars
  float timeNow = (hs1.getPos())/(width-2.);
  float Pos2 = (hs2.getPos()-1)/(width-3.);
  float Pos3 = (hs3.getPos())/(width-2.);
 
  //float scale=30.0;

  
  float ladderLength=400;
  
  // the ladder
  strokeWeight(3);
  if (timeNow>1) { timeNow=1; }
  float a = timeNow*ladderLength;
  float xLadderBase = width/2.-ladderLength*0.5+a;
  float yLadderTop = height/2+ladderLength*0.5-(sqrt(ladderLength*ladderLength-(timeNow*ladderLength)*(timeNow*ladderLength)));
  
  stroke (120,60,200);
  line(xLadderBase,height/2.+ladderLength*0.5-vertAdjust,width/2.-ladderLength*0.5,yLadderTop-vertAdjust);
  

  
  // moving point
  strokeWeight(1);
  float alpha=2*(Pos2-0.5);
  float beta=Pos3;
  
  float r = alpha*timeNow+beta; // fractional position of moving point on ladder 
  
  float xMoving = width/2.-ladderLength*0.5+a*(1-r);
  float yMoving = height/2.+ladderLength*0.5-r*sqrt(ladderLength*ladderLength-a*a);
  
  stroke(180,40,30);
  fill(180,40,30);
  ellipseMode(CENTER);
  ellipse(xMoving,yMoving-vertAdjust,5,5);
  
  // the curve
  
  int numPoints=1000;
  
  float xLast=0;
  float yLast=0;
  
  for(int i=0; i<numPoints; i++) {
     float tt=(i-1.)/numPoints;
     float xx=tt*(1-(alpha*tt+beta));
     float yy = (alpha*tt+beta)*sqrt(1-tt*tt);
     stroke(0);
     fill(0);
     float xCurr=width/2.-ladderLength*0.5+xx*ladderLength;
     float yCurr=height/2.+ladderLength*0.5-yy*ladderLength;
     if (i>0) {
     	line(xCurr,yCurr-vertAdjust,xLast,yLast-vertAdjust);
     }
     xLast=xCurr;
     yLast=yCurr;
     
  }
     
    // wall and floor
    
    stroke(200);
    strokeWeight(2);

    line(width/2.-ladderLength*0.5,height/2.+ladderLength*0.5-vertAdjust,width/2.+ladderLength*0.5,height/2.+ladderLength*0.5-vertAdjust); // floor
    line(width/2.-ladderLength*0.5,height/2.+ladderLength*0.5-vertAdjust,width/2.-ladderLength*0.5,height/2.-ladderLength*0.5-vertAdjust); // wall
 
    // text
    
    fill(0);
    text("time ="+int(100*timeNow)/100.,10,height-80);
    text("speed of moving point on ladder ="+int(100*alpha)/100.,10,height-50);
    text("initial position of moving point ="+int(100*beta)/100.,10,height-20);
    
    // update the sliders

    stroke(128);
    hs1.update();
    hs2.update();
    hs3.update();
    
    hs1.draw();
    hs2.draw();
    hs3.draw();
    
} // end draw 


class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (int xp, int yp, int sw, int sh, int l, int sposition) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    // note the width and height of the slider are both sheight
    spos = xpos+sheight/2.+sposition/100.*(swidth-sheight)-sheight/2.;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void draw() {
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(128);
    } else {
      fill(0);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}



