
void setup(){
  size(500,500);
  smooth();
  noFill();
  background(255);
  noLoop();
}

void drawBottom(int n,int t,color fill){
  float x;
  float dy;
  float y=55;
  int w=10;
  //stroke(complement[int(random(1,5))]);
  stroke(fill);
  strokeWeight(t);
  for(x=0; x<100; x+=0.1){
      dy = sin(x*0.65/w)/n;
      y+=dy;
      line(x, y, x, y);
  }
}

void drawMiddle(color fill){
  //stroke(complement[int(random(1,5))]);
  stroke(fill);
  strokeWeight(4);
  line(0,50,100,50);
}

void drawTop(int n,int t,color fill){
  float x;
  float dy;
  float y=46;
  int w=10;
  strokeWeight(t);
  //stroke(complement[int(random(1,5))]);
  stroke(fill);
  for(x=0; x<100; x+=0.1){
      dy = -1*(sin(x*0.65/w)/n);
      y+=dy;
      line(x, y, x, y);
  }
}

void drawBlock(color fill){
  drawMiddle(fill);
  drawTop(12,1,fill);
  drawTop(20,2,fill);
  drawTop(100,3,fill);
  drawBottom(12,1,fill);
  drawBottom(20,2,fill);
  drawBottom(100,3,fill);
}

void drawLine(color fill){
  for(int i=0; i<=width; i+=100) {
    pushMatrix();
    translate(i,0);
    drawBlock(fill);
    popMatrix();
  }
}

void drawUp(color fill) {
  pushMatrix();
  translate(-50,-50);
  drawLine(fill);
  popMatrix();
}

void drawHorizontal(color fill) {
  for (int i=0; i<=height; i+=100){
    pushMatrix();
    translate(0,-6+i);
    drawUp(fill);
    drawLine(fill);
    popMatrix();
  }
}

void draw() {
  drawHorizontal(170);
  pushMatrix();
  translate(width-5,0);
  rotate(PI/2);
  drawHorizontal(100);
  popMatrix();
}


