
//Emergence practice by class & array  
//When released mouse ,the rectangle(circle Cape rectangular) 
//will add,and every rectangles center point will connect with
//the point of intersection.
//Reference : colliding_circles2 by professor chien
//Chiming Lu

int num = 10;
Rect[]rectArray= {
};

void setup() {
  size(700, 300);
  background(255);
  strokeWeight(1);
  fill(150, 20);
  drawRect();
  //frameRate(5);
}
void draw() {
  background(255);
  for (int t=0;t< rectArray.length;t++) {
    Rect thisRect = rectArray[t];
    thisRect.updateMe();
  }
}

void mouseReleased() {
  drawRect();
}

void drawRect() {
  for (int i=0 ; i<num ; i++) {
    Rect thisRect = new Rect();
    thisRect.drawMe();
    //Array add
    rectArray = (Rect[])append(rectArray, thisRect);
  }
}
class Rect {
  float x, y, c;
  float r;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Rect() {
    x = random(width);
    y = random(height);
    c = random(100)-10;
    r = random(50)-5;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(40), random(100), random(240));
    alph = random(100);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    rectMode(CENTER);
    rect(x, y, c, c, r);  
    noFill();
    stroke(linecol, 150);
    ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x +=xmove;
    y += ymove;
    
    if (x > (width+c)) { 
      //x=0-c;
      xmove=-xmove;
    }
    if (x < (0-c)) { 
      //x=width+c;
      xmove=-xmove;
    }
    if (y > (height+c)) { 
      //y=0-c;
      ymove=-ymove;
    }
    if (y < (0-c)) { 
      //y=height+c;
      ymove=-ymove;
    }
boolean touching =false;
for(int t=0;t<rectArray.length;t++){
  Rect otherRect = rectArray[t];
  if(otherRect !=this){
    float dis = dist(x,y,otherRect.x,otherRect.y);
    float overlap = dis-c-otherRect.c;  
 if(overlap<0){
   
   float midx,midy;
   midx=(x+otherRect.x)/2;
   midy=(y+otherRect.y)/2;
   stroke(0,100);
   noFill();
   overlap*=-1;
   triangle(midx,midy,x,y,otherRect.x,otherRect.y);
    touching = true;

    }
  }
}
if(touching){
  if(alph>0){
    alph--;
  }
}else{
  if(alph<50){
    alph+=1;
  }
  
}    
    drawMe();
  }
}



