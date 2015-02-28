
int x, y, directionx, directiony;
int trailNum = 100;
int prevx[];
int prevy[];


void setup() {
  size(600, 400);
  x = 170;
  y = 38;
  directionx = 1; 
  directiony = 1;
  prevx = new int [trailNum];
  prevy = new int [trailNum];
}

void draw() {
  background(40, 3, 80);
  for(int i = 1; i < trailNum; i++){
     prevx[i - 1] = prevx[i];
     prevy[i - 1] = prevy[i]; 
  }
  
  prevx[trailNum - 1] = x;
  prevy[trailNum - 1] = y;
  for(int i = 0; i < trailNum; i ++){
    ellipse(prevx[i],prevy[i],10,10); 
  }
 
  x += directionx;
  y += directiony;
  if (x > 600) {
    directionx = -1;
  }
  if (x < 0) {
    directionx = 1;
  }
  if (y > 500) {
    directiony = -1;
  }

  if (y < 0) {
    directiony = 1;
  }
}


