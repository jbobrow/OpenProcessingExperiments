
// List of cells
ArrayList<Cell> cells;

// global mouse value, accounting for translationg and scaling
PVector mouse;
Mousey mousey;
Cell currentCell;

// define dimensions, borders, rows/cols
int rows = 8;
int cols = 8;
int cellSize = 60;
int border = 20;

// time
float animTime = 24;
int fr = 60; //framerate
int idleTime = 2*fr; // three seconds until idle

// color
color[] colors;
color darkgreen = #27382C, 
green = #42CC6B, 
lightgreen = #9DFF6C, 
pink = #E9ACFF, 
purple = #8342CC;
PImage img;
int t = 0;

void setup() {
  // rendering
  noCursor();
  size(520, 520, P2D);
  //size(cols*cellSize + border*2, rows*cellSize + border*2);
  background(darkgreen);
  noStroke();
  frameRate(fr);
  
  // save specified colors for easy randomization
  colors = new color[5];
  colors[0] = darkgreen;
  colors[1] = green;
  colors[2] = lightgreen;
  colors[3] = pink;
  colors[4] = purple;
  cells = new ArrayList();
  
  // inst mouse
  mousey = new Mousey();
  
  // instantiate cells
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      float x = col*cellSize + cellSize/2.;
      float y = row*cellSize + cellSize/2.;
      Cell cell = new Cell(x, y, cellSize);
      cells.add(cell);
    }
  }
}

void draw() {
  pushMatrix();
  translate(border,border);
  //mouse = new PVector(mouseX,mouseY);
  mouse = new PVector(mouseX-border,mouseY-border);
  background(darkgreen);
  updateCells();
  mousey.updateMousey(mouseX, mouseY);
  popMatrix();
  
  //vignette();
}

void updateCells() {
  for (Cell cell:cells) { 
    cell.updateCell();
    cell.updateMouse(mouse);
    cell.renderCell();
  }
}

/*void vignette() {
  t+=5;
  int radius = width/2;
  int rings = 100 + round(10*sin(radians(t)));
  int maxRad = round(radius*sqrt(2));
  noFill();
  ellipseMode(RADIUS);
  for (int i = 0; i < rings; i++) {
    float a = lerp(125, 0, (float)i/rings);
    stroke(0, a);
    ellipse(width/2, height/2, maxRad-i, maxRad-i);
  }
}*/

//M~M~M~M~M~M~M~M~M~M~M~M~M~//
class Mousey {
  int x,y;
  int t;
  int a;
  
  Mousey() {
    t = 60;
    a = 0;
  }
  
  void updateMousey(int inX, int inY) {
    if (x == inX && y == inY) {
      t++;
    } else {
      t=0;
      //a = 255;
    }
    x = inX;
    y = inY;
    
    if (t > 60) {
      if (a > 0)
        a-=5;
    } else {
      if (a < 255)
        a+=15;
    }
    
    fill(255, a);
    ellipse(mouse.x,mouse.y, 8,8);
  }
}

//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//
class Cell {
  PVector pos;
  boolean mouseOver;
  boolean isIdle;
  int colorindex;
  color nextcolor;
  float s;
  float t; //time since last mouseEnter
  ArrayList<Animation> anims;

  Cell(float x, float y, float inSize) {
    pos = new PVector(x,y);
    s = inSize;
    anims = new ArrayList();
    colorindex = 0; //round(random(0, 4));
    nextcolor = colors[colorindex];
  }
  
  void updateCell() {
    t++;
    if (isIdle)
      return;
    if (t>idleTime)
      idle();
  }

  void updateMouse(PVector mouse) {

    if ((pos.x - s/2) < mouse.x && mouse.x < (pos.x + s/2)
      && (pos.y - s/2) < mouse.y && mouse.y < (pos.y + s/2)) {
      if (mouseOver == false) {
        mouseEnter();
      }
      mouseOver = true;
    } 
    else {
      mouseOver = false;
    }
  }

  void mouseEnter() {
    t = 0; //set idle timer to 0
    isIdle = false;
    for (Animation a : anims) {
      a.unpause();
    }
    int oldcolor = colorindex;
    if (anims.size() == 0)
      oldcolor = 0;
    while (oldcolor == colorindex) 
      colorindex = round(random(0, 4));
    nextcolor = colors[colorindex];
    Animation a = new Animation(pos, s, nextcolor, this);
    anims.add(a);
  }
  
  void idle() {
    isIdle = true;
    int asize = anims.size();
    if (asize>0)
      anims.get(asize-1).reverseAndGo();
  }

  void renderCell() {
    rectMode(CENTER);

    pushMatrix();
    translate(pos.x, pos.y);
    int asize = anims.size();
    if (asize > 0) {
      int start = asize > 2 ? asize-2 : 0;
      for (int i = 0; i < asize; i++) {
        Animation a = (Animation) anims.get(i);
        /*if (a.t>=animTime && !a.reverse) {
          a.pause();
        } else if (a.t<=1 && a.reverse) {
          anims.remove(a);
        }   */
        a.updateAnim();
      }
    }
    popMatrix();
  }
  
  void destroyAnim() {
    int asize = anims.size();
    anims.remove(asize-1);
    
    asize--;
    if (asize == 0)
      return;
    else
      anims.get(asize-1).reverseAndGo();
  }
}


//[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]//
class Animation {
  Cell cell;
  float t;
  int dir;
  PVector pos;
  int cellSize;
  color topcolor;
  color bottomcolor;
  boolean paused;
  boolean reverse;

  Animation(PVector p, float s, color clr, Cell cel) {
    t = 0;
    pos = p;
    cellSize = round(s);
    dir = getDirection();
    topcolor = clr;
    cell = cel;
  }
  
  void updateAnim() {
    if (!reverse) {
      t++;
      if (t >= animTime)
        pause();
    }
    else if (reverse) {
      t--;
      if (t == 0)
        cell.destroyAnim();
    }
    
    renderAnim();
  }

  void renderAnim() {
    if (paused) {
      drawSquare();
      return;
    } else {
      drawSwipe();
    }
  }

  void drawSwipe() {
    pushMatrix();
    drawFade();
    rotate((dir-1)*PI/2);
    int tl = -cellSize/2;
    int br = round(map(t, 0, animTime, tl, -tl));
    fill(topcolor);
    rectMode(CORNERS);
    rect(tl, tl, -tl, br); //swipe  
    
    float alpha = lerp(150,0,t/animTime); // color fade top
    fill(0, alpha);
    rect(tl, tl, -tl, br);
    
    /*if (t==5) {
      stroke(255);
      line(-cellSize/2, br, cellSize/2, br);
      noStroke();
    }*/
    popMatrix();
  }
  void drawFade() {
    rectMode(CENTER);
    float alpha = lerp(0,80,t/animTime);
    fill(0, alpha);
    rect(0,0,cellSize,cellSize);
  }

  void drawSquare() {
    rectMode(CENTER);
    fill(topcolor);
    rect(0, 0, cellSize, cellSize);  
  }
  
  void reverseAndGo() {
    t = animTime;
    paused = false;
    reverse = true;
  }
  
  void destroyAnim() {
    cell.destroyAnim();
  }
  
  void unpause() {
    if (reverse) {
      reverse = false;
      paused = false;
    }
  }
  
  void pause() {
    paused= true;
    t = animTime;
  }

  int getDirection() {
    PVector m = mouse;
    float n = dist(m.x, m.y, pos.x, pos.y - cellSize/2);
    float e = dist(m.x, m.y, pos.x + cellSize/2, pos.y);
    float s = dist(m.x, m.y, pos.x, pos.y + cellSize/2);
    float w = dist(m.x, m.y, pos.x - cellSize/2, pos.y);

    int direction = 1;
    float d = n;
    if (e<d) {
      direction = 2;
      d = e;
    }
    if (s<d) {
      direction = 3;
      d = s;
    }
    if (w<d) {
      direction = 4;
    }
    return direction;
  }
}

