
int counter;
int sizeX, sizeY;
void setup() {  //setup function called initially, only once
  sizeX = 600;
  sizeY = 600;
  size(sizeX+1,sizeY+1);
  line(0,0,0,500);
//  line(0,10,10,10);
//  line(0,20,10,20);

  for ( int i = 0; i <= sizeX; i=i+10) {
    line(0,i,sizeX,i);
  }
  for ( int i = 0; i <= sizeY; i=i+10) {
    line(i,0,i,sizeY);
  }
}

void draw() {  //draw function loops 
//  int i;
  fill(204, 102, 0);
  rect(0,0,10,10);
  rect(10,0,10,10);
  rect(20,0,10,10);
  rect(0,10,10,10);
  rect(20,10,10,10);
  rect(0,20,10,10);
  
}


