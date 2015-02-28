
//Fall,Falling,Fallen
//When mouse released the rainning  will add,and the Falling color ball will more clear 
//Chiming Lu

int num = 50;
Rect[]rectArray= {
};

void setup() {
  size(400, 600);
  background(255);
  strokeWeight(1);
  fill(150, 20);
  drawRect();
  frameRate(8);
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
    xmove = random(10) -5;
    ymove = random(10) ;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    rectMode(CENTER);
    rect(x, y, c, c, r); 
    //noFill();
    fill(linecol);
    stroke(linecol, 150);
    ellipse(x, y, 10, 10);
  }
  void updateMe() {
    //x +=xmove;
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
      y=0-c;
      ymove=+ymove;
    }
    if (y < (0-c)) { 
      //y=height+c;
      ymove=-ymove;
    }


    boolean touching =false;
    for (int t=0;t<rectArray.length;t++) {
      Rect otherRect = rectArray[t];
      if (otherRect !=this) {
        float dis = dist(x, y, otherRect.x, otherRect.y);
        float overlap = dis-c-otherRect.c;  
        if (overlap<0) {

          float midx, midy, dx, dy;
          midx=(x+otherRect.x)/2;
          midy=(y+otherRect.y)/2;
          dx=midx-otherRect.x;
          dy=midy-otherRect.y;
          stroke(0, 100);
          noFill();
          overlap*=-1;

          //triangle(midx,midy,x,y,otherRect.x,otherRect.y);
          //ellipse(midx,midy,dx,dy);
          stroke(random(255), random(255));
          line(midx, midy, midy, midx);
          touching = true;
        }
      }
    }
    if (touching) {
      if (alph>0) {
        alph--;
      }
    }
    else {
      if (alph<50) {
        alph+=10;
      }
    }    
    drawMe();
  }
}



