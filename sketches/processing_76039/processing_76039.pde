
int frame;
ArrayList<Branch> branches;
Branch b;

class Branch {
  int startX;
  int startY;
  boolean left;
  float angle;
  int finalLength;
  int presentLength;
  boolean growing;
  color col;
  int gen;
  boolean willSplit;
  
  Branch() {
    startX = width/2;
    startY = height;
    angle = -PI/2;
    finalLength = 64;
    presentLength = 0;
    growing = true;
    col = color(255);
    willSplit = true;
  }
  
  Branch(int c) {
    startX = width/2;
    startY = height - 64;
    finalLength = 64;
    presentLength = 0;
    growing = true;
    willSplit = true;
    
    switch(c) {
      case 0:
        col = #FF0000;
        angle = -PI/2 - 1;
        break;
      case 1:
        col = #FFFF00;
        angle = -PI/2 - 0.6;
        break;
      case 2:
        col = #00FF00;
        angle = -PI/2 - 0.2;
        break;
      case 3:
        col = #00FFFF;
        angle = -PI/2 + 0.2;
        break;
      case 4:
        col = #0000FF;
        angle = -PI/2 + 0.6;
        break;
      case 5:
        col = #FF00FF;
        angle = -PI/2 + 1;
    }
  }
  
  Branch(int x, int y, boolean l, float a, color c, int g) {
    startX = x;
    startY = y;
    if(l)
      angle = a - getNewAngle();
    else
      angle = a + getNewAngle();
    finalLength = getNewLength();
    presentLength = 0;
    growing = true;
    col = getNewColor(c);
    gen = g + 1;
    willSplit = booleanDiceRoll(g*0.06 + 1);
  }
  
  void grow() {
    if(growing) {
      if(++presentLength >= finalLength) {
        growing = false;
        int x = startX + int(finalLength*cos(angle));
        int y = startY + int(finalLength*sin(angle));
        if(willSplit)
          if(dist(x,y,width/2,height/2) < width/4)
            split(x,y);
      }
    }
  }
  
  void split(int x, int y) {
        branches.add(new Branch(x, y, true, angle, col, gen));
        branches.add(new Branch(x, y, false, angle, col, gen));
  }
}

class Trunk extends Branch {
  void split(int x, int y) {
    branches.add(new Branch(0));
    branches.add(new Branch(1));
    branches.add(new Branch(2));
    branches.add(new Branch(3));
    branches.add(new Branch(4));
    branches.add(new Branch(5));
  }
}

float getNewAngle() {
  while(true) {
    int p = 5;
    for(int i = 0; i < 16; i++)
      if(random(p + i) < 1)
        return ((float)i)/20 + 0.05;
  }
}

int getNewLength() {
  while(true) {
    int p = 8;
    for(int i = 0; i < 32; i++)
      if(random(p + i*2) < 1)
        return i + 8;
  }
}

color getNewColor(color c) {
  float r = red(c) + random(-32,32);
  float g = green(c) + random(-32,32);
  float b = blue(c) + random(-32,32);
  if(r > 255) r = 255;
  if(g > 255) g = 255;
  if(b > 255) b = 255;
  if(r < 0) r = 0;
  if(g < 0) g = 0;
  if(b < 0) b = 0;
  return color(r,g,b);
}

boolean booleanDiceRoll(float f) {
  if (random(f) < 1)
    return true;
  return false;
}

void setup() {
  size(1100,675);
  smooth();
  background(0);
  
  branches = new ArrayList<Branch>();
  //plant the tree!
  branches.add(new Trunk());
}

void draw() {
  
  for(int i = 0; i < branches.size(); i++) {
    b = branches.get(i);
    if(b.growing) {
      stroke(b.col);
      line(b.startX,b.startY,b.startX+(int)(b.presentLength*cos(b.angle)),b.startY+(int)(b.presentLength*sin(b.angle)));
      b.grow();
    }
  }
}
