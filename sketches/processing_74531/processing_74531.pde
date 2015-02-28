
int  dimY=10;

void setup() {
  size(400, 400, P2D);
  smooth (4);
}


void draw () {
  background(248, 255, 144);
  for (int y = 0; y <= height; y = y +40) {
   for(int x = 0; x <= width; x = x + 40){
     noStroke();
     fill(232, 191, 23, 150);
     ellipse (x, y, 20, 20);
     fill(178, 145, 13);
     }
  }
  
  for( int dimX=0; dimX <= height; dimX = dimX+20){
  for(int dimY = 0; dimY <=width; dimY = dimY+10){
    fill(222, 119, 40, 100);
    ellipse (dimX, dimY, 20, 10);
  }
  }
  
}
