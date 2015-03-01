
void setup(){
  size (400,400, JAVA2D);
  frameRate(1);
}

void draw(){
  background(255);
  noStroke();
 for(int i =0; i <60; i++){
    int x = int(random (0,400));
    int y = int (random (0,400));
    int r = int (random (100,255));
    fill(r,0,0,int (random (0,50)));
    rect(x,y,30,30);
    for(int j = 0; j<20; j++){
      fill(r,0,0,40-j*2);
      rect(x + j*2,y +j*2,30,30);
    }
 }
}
