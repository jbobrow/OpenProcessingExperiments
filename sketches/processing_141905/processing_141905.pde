
float theta=0;
int r=0;
void setup() {
  size(700, 700);
  background(#473533);
  smooth();
}

void draw() {
  rectMode(CENTER);
  fill(#473533, 60);
  rect(0, 0, width*3, height*3);
  filter(DILATE);
 // filter(BLUR);
  theta+=0.1;
  noFill();
  stroke(#FE534C);
  translate(width/2, height/2);
  for (int i=0;i<width+500;i+=20) {
    ellipse(10*((sin(theta-i))), 10*((cos(theta-i))), i, i);
  }

  //  if (frameCount>10 & frameCount%4==0) {
  // saveFrame();
  // }
}



