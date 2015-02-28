
int[] y;
int idx=0;


void setup() {
  size(400, 400);
  stroke(255);
  y  = new int [width];
}
void draw() {
  background(0);
  ellipse(width/2, mouseY, 10,10);
  //advance index
  idx = (idx+1)%width;
  // set value
  y[idx]=mouseY;
  // draw the line

  for (int i =idx;i<width+idx;i++) {
    point((width/2+(i-idx))%width,y[i%width]);
  }
}



