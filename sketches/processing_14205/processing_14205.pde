
//Tian Jason Tian
//Assignment 5: Spire in the Sand

int lastx = 300;
int lasty = 500;
int setl = 50;
int recur = 8;

void setup() {
  size(600,600);
  background(250,222,192);
  smooth();
  noLoop();
}

void draw() {
  translate(300,300);
  scale(0.5);
  build(lastx,lasty,50, recur);
}

void mousePressed(){
  rotate(.1);
  lastx = mouseX;
  lasty = mouseY;
  redraw();
}

void mouseMoved(){
  if(mouseX>100 && mouseY>100){
  build(mouseX,mouseY,setl,recur);
  }
  rotate(.1);
  redraw();
}

void build(int x, int y, int dist, int num){
  fill(284,189,140,80);
  stroke(142,77,7,80);
  line(x,y,x,y-dist);
  line(x-dist, y-dist, x+dist, y-dist);
  if (num>0){
    pushMatrix();
    rotate(random(-0.5,0.5));
    build(x-dist,y-dist,dist/2,num-1);
    build(x+dist,y-dist,dist/2,num-1);
    popMatrix();
  }
}

class bsand {
  bsand(int xloc, int yloc) {
    int height = 100;
    int width = 50;
    stroke(0);
    strokeWeight(2);
    fill(0);
    line(xloc,yloc,xloc,yloc-height);
    line(xloc,yloc-height,xloc+width,yloc-height-width);
    line(xloc,yloc-height,xloc-width,yloc-height-width);
  }
}


