
class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Circle() {
    x=random(width);
    y=random(height);
    radius=random(100)+20;
    linecol=color(random(100,255));
    fillcol=color(random(255),0,0);
    
    //linecol=color(random(255), random(255), random(0));
    //fillcol=color(random(255), random(255), random(255));
    alph=random(0,100);
    xmove=random(10)-4;
    ymove=random(10)-5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    rect(x,y,radius*1.5,radius*2);
    //ellipse(x, y, radius*2, radius*2);
    stroke(0);
    strokeWeight(1);
    //stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x+=xmove-1;
    y+=ymove-1;
    if (x>(width+radius)) {
      x=0-radius;
    }
    if (x<(0-radius)) {
      x=width+radius;
    }
    if (y>(height+radius)) {
      y=0-radius;
    }
    if (y<(0-radius)) {
      y=height+radius;
    }
    boolean touching=false;
    for (int i=0;i<_circleArr.length;i++) {
      Circle otherCirc=_circleArr[i];
      if (otherCirc!=this) {
        float dis=dist(x, y,otherCirc.x, otherCirc.y);
       
       
       float overlap=dis-radius-otherCirc.radius;
       if (overlap<0){
       float midx,midy;
     midx=(x+otherCirc.x)/2;
   midy=(y+otherCirc.y)/2;
 stroke(0,100);
 noFill();
 overlap+=-1;
 ellipse(midx,midy,overlap,overlap);
 }}}
 /*
        if ((dis-radius-otherCirc.radius)<0) {
          touching=true;
          break;
        }
      }
    }
    if (touching) {
      if (alph>0) {
        alph--;
      }
      else {
        if (alph<255) {
          alph+=2;
        }
      */

      drawMe();
    }//updateMe
    }//classC
  
  

