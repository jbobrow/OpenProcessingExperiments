
int dotNum = 15;
int bx,by;

Dot[] dt = new Dot[dotNum];

void setup() {
  size(640,480,P2D);
  frameRate(60);
  background(102);
  noStroke();
  smooth();

  for(int i = 0; i < dotNum; i++) {
  bx = ceil(random(0,width));
  by = ceil(random(0,height));
  dt[i] = new Dot(bx,by,i);
  }
}  

void draw() {
    fill(0,10);
  rect(0,0,width,height);
  fill(255);
  
  for(int i = 0; i < dotNum; i++) {
  dt[i].Update(mouseX,mouseY);
  dt[i].DotMove();
  }
}


class Dot {
  float beginX, beginY;
  float endX, endY;
  float mx,my;
  float distX, distY;
  float exponent = 3.0;
  float x,y = 0;
  float step = 0.01;
  float pct = 0.0;
  int direction = 1;
  float relX;

  Dot(int begX, int begY, int gen) {
   beginX = begX;
   beginY = begY; 
   if(gen % 2 == 0) { relX = gen * 10; }
   else{ relX = -(gen * 10); }
  }

void Update(int mX,int mY) {
  if(mousePressed == true) { 
    pct = 0.0;
    beginX = x; beginY = y; 
    endX = mX; endY = mY; 
    if(beginX < endX && beginY > endY) { direction = 1;} else{ direction = -1;}
    }
  
  pct += step;
  
  if (pct < 1.0) {
    distX = endX - beginX;
    distY = endY - beginY;
    x = beginX + (pow(pct, exponent) * distX);
    y = beginY + (pct * distY);
  }
  
  else{
   pct = 0.0;
   beginX = endX;
   beginY = endY; 
  } 
  
  
  
}

void DotMove() {
    pushMatrix();
      translate(x,y);
      if(direction == 1 && pct > 0.0 && pct < 1.0) {
        rotate(HALF_PI*pct);
        }
      if(direction == -1 && pct > 0.0 && pct < 1.0) {
        rotate(-(HALF_PI*pct));
        }
    ellipse(relX,0,10,10);
  popMatrix();
}


}

