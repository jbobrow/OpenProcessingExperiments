
Wall muro;
Target targ;
Ai ai;
int x, y;
int sx, sy;

void setup(){
  size(400, 400);
  background(0);
  muro = new Wall();
  targ = new Target();
  ai = new Ai();
  x = 300;
  y = 190;
  
  sx = 3;
  sy = 3;
  frameRate(30);
}

void draw(){
  background(0);
  
  muro.drawWall();
  targ.drawTarget();
  
  ai.drawAi(x, y);
  
  // engines started
  x += sx;
  y += sy;
  
  //canvas are hard
  if (x>= width - (ai.w) / 2 || x <= (ai.w) / 2)
  {
    sx*=-1;
  }
  if (y>= height - (ai.h) / 2 || y<= (ai.h) / 2)
  {
    sy*=-1;
  }
  
  //walls are hard
  if (x >= muro.x - (ai.w) /2 && x <= (muro.x + muro.w) + (ai.w) / 2)
  {
    if(y >= muro.y - (ai.w) /2 && y<= (muro.y + muro.h) + (ai.w)/2)
    {
      if (x >= muro.x && x<= muro.x + muro.w)
      {
        sy*=-1;
      }
      else
      {
        sx*=-1;
      }
    }
    
  }
  
  sx*= targ.checkTarget(x, y);
  sy*= targ.checkTarget(x, y);
  
}

class Wall {
  int x, y, w, h;
  
  Wall() {
    x = 160;
    y = 80;
    w = 80;
    h = 240;
  }
  
  void drawWall() {
    stroke(255);
    fill(255);
    rect(x, y, w, h);
  }
}

class Target {
  int x, y, w, h;
  
  Target() {
    x = 70;
    y = 180;
    w = 40;
    h = 40;
  }
  
  void drawTarget() {
    stroke(255);
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  
  int checkTarget(int curx, int cury) {
    if(curx >= x && curx <= x + w && cury >= y && cury <= y + h)
    {
      return 0;
    }
    else
    {
      return 1;
    }
  }
}

class Ai {
  int x, y, w, h;
  
  Ai() {
    //x = posx; //300;
    //y = posy; //190;
    w = 20;
    h = 20;
  }
  
  void drawAi(int posx, int posy) {
    stroke(0);
    fill(0, 255, 0);
    x = posx;
    y = posy;
    ellipse(x, y, w, h);
  }
}

