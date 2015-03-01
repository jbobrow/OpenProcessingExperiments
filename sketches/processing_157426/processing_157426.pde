
//The Rosy Crucifixion
//A Plexus, ahem, homage
//by Mark Reynolds, 2013
//www.bentwayproductions.com

int _num=10;
Circle[]_circleArr = {};

void setup(){
  size(500,300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150,50);
  drawCircles();
}

void draw(){
  background(255);
  for(int i=0;i<_circleArr.length;i++){
    Circle thisCirc=_circleArr[i];
    thisCirc.updateMe();
  }
  fill(255,(random(150)));
  rect(0,0,width,height);
}

void drawCircles(){
  for(int i=0;i<=10;i++){
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr=(Circle[])append(_circleArr,thisCirc);
  }
}

void mouseReleased(){
  drawCircles();
//  println(_circleArr.length);
}

class Circle{
  float x,y;
  float radius;
  float innerRadius;
  color linecol,fillcol;
  float alph;
  float xmove,ymove;
  
  Circle(){
    x = random(width);
    y = random(width);
    radius = random(100)+20;
    innerRadius = 5;
    linecol = color(random(255),random(255),random(255));
    fillcol = color(random(255),random(255),random(255));
    alph = random(255);
    xmove = random(4)-2;
    ymove = random(4)-2;
  }
  
  void drawMe(){
    stroke(1,random(155)+100);
    noFill();
    ellipse(x,y,innerRadius*2,innerRadius*2);
  }
  
  void updateMe(){
    x += xmove;
    y += ymove;
    if(x>(innerRadius+width)){x = 0-innerRadius;}
    if(x<0-innerRadius){x = width+innerRadius;}
    if(y>innerRadius+height){y = 0-innerRadius;}
    if(y<0-innerRadius){y = height+innerRadius;}

    boolean touching=false;
    for(int i=0;i<_circleArr.length;i++){
      Circle otherCirc = _circleArr[i];
      if(otherCirc != this){
        float dis = dist(x,y,otherCirc.x,otherCirc.y);
        float overlap = dis-radius-otherCirc.radius;
        if(overlap<0){
          float midx,midy;
          midx = (x+otherCirc.x)/2;
          midy = (y+otherCirc.y)/2;
          stroke(0,random(100));
          noFill();
          overlap*=-1;
          line(x,y,otherCirc.x,otherCirc.y);
        }
      }
    }
    
    drawMe();
  }
}




