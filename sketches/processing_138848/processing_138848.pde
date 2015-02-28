
// SANDCASTLES
// Will Welch, HON 201, March 7, 2014
// This piece reflects the persistent, non-organic growth of cities.
// Despite being dynamically drawn, it severely limits the interaction of the participant, 
// who can only stop growths by clicking above them.
// New growths emerge faster than they can be stemmed, eventually leaving the canvas barren.
 
// global variables
int x1;
int y1;
int x2;
int y2;
int sign = 1;
int startX;

int towerWidth; //width of growths
int thickness; //thickness of levels

PGraphics pg; //dynamically drawn image
PImage cracks; //growth detail image

void setup(){
  //canvas size
  size(800,600);
  
  //load random variables
  thickness = int(random(2,11));
  startX = int(random(width-towerWidth));
  towerWidth = int(random(20,100));

  //load images
  cracks = loadImage("data/crack.png");
  pg = createGraphics(width,height);
  pg.beginDraw();
  pg.background(255,255,255);
  pg.endDraw();
}

void draw(){
  //reset current image
  image(pg,0,0);
  image(cracks,0,0,width,height);
  blend(pg,0,0, width,height, 0,0,width,height,ADD);
  
  //draw next growth level
  strokeCap(SQUARE);
  strokeWeight(thickness);
  line(startX+x1,height+y1,startX+x2,height+y2);
  
  //changes direction of line drawing
  x2+=30*sign;
  
  //sets start of new line above end of old one and reverses drawing direction
  if (x2 >= towerWidth || x2 <= 0) {
    store();
    sign*=-1;
    y2-=10;
    x1=x2;
    y1=y2;
  }
  
  //restarts growth if top of canvas is hit
  if (height+y2 <= 0){
    restart();
  }
}

void mousePressed(){
  //restarts growth if mouse is clicked above current growth
  if (mouseX >= startX && mouseX <= startX+towerWidth && mouseY <= height+y2){
    restart();
  }
}

void restart(){
  //draws current growth level to canvas
  store();
  
  //reset all values
  y1 = 0;
  y2 = 0;
  x1 = 0;
  x2 = 0;
  sign=1;
  towerWidth = int(random(20,100));
  startX = int(random(width-towerWidth));
  thickness = int(random(2,15));
}

void store(){
  //draws current growth level to canvas
  pg.beginDraw();
  pg.strokeCap(SQUARE);
  pg.strokeWeight(thickness);
  pg.line(startX+x1,height+y1,startX+x2,height+y2);
  pg.endDraw();
}

