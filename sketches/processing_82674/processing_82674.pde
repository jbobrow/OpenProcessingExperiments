
int state = 2;
int x1,y1,x2,y2;
int boxsize = 4;
int maxstate = 4;
int maxlevel = 7;
float ecc = 0.25;

void setup() {
  size(600,600);
  stroke(255);
  reset();
  noLoop();
}

void reset(){
  background(0);
}

void boxAt(int x, int y){
  fill(0);
  rect(x-boxsize/2, y-boxsize/2, boxsize, boxsize);
}

void drawLightning(int x1_,int y1_,int x2_,int y2_,int lvl){
   if (lvl < maxlevel){
     int midx = (x1_ + x2_)/2;
     int midy = (y1_ + y2_)/2;
     float d = dist(x1_, y1_, x2_, y2_);
     d *= ecc;
     midx += random(-d, d);
     midy += random(-d, d);
     drawLightning(x1_, y1_, midx, midy, lvl+1);
     drawLightning(midx, midy, x2_, y2_, lvl+1);
   } else {
     line(x1_,y1_,x2_,y2_);
   }
}

void mousePressed(){
  switch(state){
    case 0: {
      x1 = mouseX;
      y1 = mouseY;
      redraw();
      break;
    }
    case 1: {
      x2 = mouseX;
      y2 = mouseY;
      redraw();
      break;
    }
    case 2: {
      redraw();
      break;
    }
  }
}



void draw(){
  switch(state){
    case 0: {
      reset();
      boxAt(x1,y1);
      state = 1;
      break;
    }
    case 1: {
      //reset();
      boxAt(x2,y2);
      drawLightning(x1,y1,x2,y2,0);
      state = 2;
      break;
    }
    case 2: {
      reset();
      state = 0;
      break;
    }
  }
}



