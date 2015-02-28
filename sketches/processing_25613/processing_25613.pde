
float qx = 0;
float wx = 0;
float ex = 0;
float rx = 0;
float tx = 0;
float yx = 0;
float ux = 0;
float ix = 0;
float ox = 0;
float px = 0;
float ax = 0;
float sx = 0;
float dx = 0;

void setup(){
size(250, 250);
smooth();

frameRate(60);

}

void draw(){
rectMode(CORNER);
  fill(255, 50);
  noStroke();
  noCursor();
 ////////////////////////////////////
 rect(0,0, height, width);
 
 sx = random(1,1);


 noFill();
 strokeWeight(random(1,2));
 
 stroke(#5F9335, random(100, 150));
 rectMode(CENTER);

  qx = random(1, 40);
  wx = random(1, 40);
  ex = random(1, 40);
  rx = random(1, 40);
  tx = random(1, 40);
  yx = random(1, 40);
  ux = random(1, 40);
  ix = random(1, 40);
  ox = random(1, 40);
  px = random(1, 40);
  ax = random(1, 40);
  sx = random(1, 40);
  dx = random(1, 40);
  
 
rect(random(1, 300), random(1, 300), qx, qx);
rect(random(1, 300), random(1, 300), wx, wx);
rect(random(1, 300), random(1, 300), ex, ex);
rect(random(1, 300), random(1, 300), rx, rx);
rect(random(1, 300), random(1, 300), tx, tx);
rect(random(1, 300), random(1, 300), yx, yx);
rect(random(1, 300), random(1, 300), ux, ux);
rect(random(1, 300), random(1, 300), ix, ix);
rect(random(1, 300), random(1, 300), ox, ox);
rect(random(1, 300), random(1, 300), px, px);
rect(random(1, 300), random(1, 300), ax, ax);
rect(random(1, 300), random(1, 300), sx, sx);
rect(random(1, 300), random(1, 300), dx, dx);

noStroke();
fill(#FFFFFF,175);
rect(mouseX+150, 125, 250, 250);

fill(#80C648,200);
rect(mouseX, 125, 1, 250);
rect(mouseX-3, 125, 1, 250);
rect(mouseX-9, 125, .5, 250);
rect(mouseX+3, 125, 1, 250);
rect(mouseX+17, 125, 3, 250);
rect(mouseX+20, 125, 1, 250);
rect(mouseX+10, 125, 9, 250);




}
