
/*
 Invaders fractal
 
 A demonstration of recursion, which means functions call themselves.
 Notice how the drawShape() function calls itself 3 times at each level.
 It continues to do this until the variable "level" is equal to 0.
 At each level draws a random generated invader on a 5x5 grid with a random
 color and size proportional to the level.
 Press any key or mouse button to generate another fractal.
 Press 's' key to switch between smoothing and no smoothing.
*/

PImage inv=createImage(5, 5, ALPHA); // 5x5 bitmap that holds the random generated invader
int N=7; // number of iterations
boolean sm=true; // apply smoothing by deafault
 
void setup() 
{
  size(640, 640);
  smooth();
  //background(255);
  background(0);
  drawShape(0, 0, width, height, N);
}

void draw() 
{
}

void drawShape(float x, float y, float w, float h, int level)
{                    
  if(level==0) return;
  gen_invader(inv);
  float xm=x+w/2;
  float ym=y+h/2;
  level--;
  tint(int(random(128))+128, int(random(128))+128, int(random(128))+128);
  //tint(0);
  int r=int(random(4));
  if(r!=0) {
    drawShape(x, y, w/2, h/2, level);
  }
  else {
    image(inv, x, y, w/2, h/2);
  }
  if(r!=1) {
    drawShape(x, ym, w/2, h/2, level);
  }
  else {
    image(inv, x, ym, w/2, h/2);
  }
  if(r!=2) {
    drawShape(xm, y, w/2, h/2, level);
  }
  else {
    image(inv, xm, y, w/2, h/2);
  }
  if(r!=3) {
    drawShape(xm, ym, w/2, h/2, level);
  }
  else {
    image(inv, xm, ym, w/2, h/2);
  }
}

// Generate a random invader bitmap on a 5x5 grid.
// It has a vertical symmetry where the right hand side mirrors
// the left hand side.
void gen_invader(PImage a) { 
  a.loadPixels();
    for(int n=0; n<5; n++) {
      a.pixels[n*5]=int(random(2))*255;
      a.pixels[n*5+1]=int(random(2))*255;
      a.pixels[n*5+2]=int(random(2))*255;
      a.pixels[n*5+3]=a.pixels[n*5+1];
      a.pixels[n*5+4]=a.pixels[n*5];
    }
  a.updatePixels();  
}

void mousePressed() {
  //background(255);
  background(0);
  drawShape(0, 0, width, height, N);
}

void keyPressed() {
  if(key=='s' || key=='S') {
    sm=!sm;
    if(sm) {
      smooth();
    }
    else {
      noSmooth();
    }
  }
  //background(255);
  background(0);
  drawShape(0, 0, width, height, N);
}


