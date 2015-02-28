
int cols;
int rows;
float c;
int currentFrameCount;

void setup() {
  size(500, 500);
  colorMode(HSB);
  background(0);
  smooth();
  cols = width;
  rows = height;
}

void draw() {
  println(frameCount);
  if(frameCount-currentFrameCount<= 35){
    c=map(frameCount-currentFrameCount,0,35,150,0);
    }else{c=0;}
//  fill(0,10);
//  rect(0,0,width,height);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (dist(mouseX, mouseY, i, j)<60) {
        stroke(c,255,255,(60-dist(mouseX, mouseY, i, j))*0.6);
        point(i, j);
      }
    }
  }
}

void mouseMoved(){
  frameCount=currentFrameCount;
  }



