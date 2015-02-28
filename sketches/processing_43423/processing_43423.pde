
// Click mouse to see original image
// Based on code, courtesy of Glen Murphy http://www.bodytag.org/nav.php?u=grid2/

PImage lake;
int POINTNUM = 5000;
Gridpoint[] g = new Gridpoint[POINTNUM];
boolean click = false;

class Gridpoint {
  int dir;
  float vel;
  float x, y;
  color col;

  Gridpoint(int xIn, int yIn, int dirIn, float velIn, color rectCol) {
    x = xIn;
    y = yIn;
    dir = dirIn;
    vel = velIn;
    col = rectCol;
  }
  void update() {
    if(dir == 1) {
      y += vel;
      if(y < 132)
      y += 132;
      else if(y > height)
      y -= height-132;
    } else {
      x += vel;
      if(x < 0)
      x += width;
      else if(x > width)
      x -= width;
    }
    col = getColor(x, y, lake);
    fill(red(col), green(col), blue(col), 30);
    noStroke();
    rect(x,y,vel*5,vel*5);
  }
}

color getColor(float x, float y, PImage img){
  float maxloc= img.width*img.height;
  float loc = (y * img.width) + x;
  if (loc < maxloc){
    return img.pixels[(int)loc];
  } else {
    return 0;
  }
}

void setup() {
  size(400,300);
  lake = loadImage("lake.jpg");
  lake.loadPixels();
  image(lake,0,0);
  for(int i = 0; i < POINTNUM; i++) {
    int x = (int)random(width);
    int y = (int)random(132, height);
    int dir = (int)random(2);
    float vel = random(-2,2);
    color col = getColor(x, y, lake);
    g[i] = new Gridpoint(x,y,dir,vel,col);
  }
}

void draw() {
  if (click) {
    image(lake, 0, 0);
  } else {
    for(int i = 0; i < POINTNUM; i++) {
      g[i].update();
    }
  }
}

void mousePressed(){
  click = true;
}

void mouseReleased(){
  click = false;
}


