
float rectWidth, rectCount;

void setup() {
  size(800,800);
  noLoop();
  rectWidth = width*0.09018; //evaluates to 54.108, based on golden ratio
  rectCount = width/rectWidth;
}


void draw() {
  background(255);
  pushMatrix();
  translate(width/2,height/2);
  rectMode(CENTER);
  noStroke();
  for(int i = int(rectCount); i > 0; i--) {
    fill(random(255), random(50,200), random(50,200) );
    rect(0,0,i*rectWidth,i*rectWidth);
  }
  popMatrix();
  rectMode(CORNER);
  fill(255,50);
  rect(0,0,width,height);
}


void mousePressed() {
  redraw();
}


