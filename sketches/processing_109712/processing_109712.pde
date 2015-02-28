
float sz;
float theta= 0;

void setup() {
  size(400, 400);
  background(0);
  noStroke();
}

void draw() {
  background(#981A81);
  fill(255);
  ellipse(width/2, height/2, 250, 250);
  fill(#981A81);
  sz = map(sin(theta), -1, 1, 270, 350);
  ellipse(width/2, height/3, sz, sz);
  theta += .02;

  //if (frameCount % 5 == 0) {
   // saveFrame("line-######.gif");
  //}

  //if (theta > TWO_PI) {
  //  noLoop();
  //}
}



