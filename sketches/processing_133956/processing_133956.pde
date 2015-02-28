
/* @pjs preload="foreground.png";*/
/* @pjs preload="middleground.png";*/
/* @pjs preload="background.png";*/

PImage fg;
PImage mg;
PImage bg;

void setup() {
  size(800, 500);
  fg = loadImage("foreground.png");
  mg = loadImage("middleground.png");
  bg = loadImage("background.png");
}

void draw(){
  fill(0,40,80);
  rect(0,0,800,500);
  float fgX=map(mouseX,0,800,0,-700);
  image(fg,fgX,0);
  float mgX=map(mouseX,0,800,-50,-400);
  image(mg,mgX,0);
  float bgX=map(mouseX,0,800,0,-100);
  image(bg,bgX,0);
  
}


