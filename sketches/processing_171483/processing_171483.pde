
void setup() {
  size(600, 600);
}
void draw()
{
  // Start the tree from the bottom of the screen
  translate(width/2, height);

  //let's rotate coordinate to radians(-90)
  rotate(radians(-90));

  // first, draw a line that are as thick as a trunk
  strokeWeight(10);
  line(0, 0, 50, 0);

  //then,
  drawBranch(50, 12, 12);
}

// yall know that we must set the function (drawBranch!)
void drawBranch(int x, int sw, int num) {
  //start a first branch! by posing a starting point
  translate(x, 0);

  //  pushMatrix();
  rotate(radians(4));
  strokeWeight(sw);
  line(0, 0, x, 0);
  //  popMatrix();

  //  pushMatrix();
  rotate(radians(-8));
  strokeWeight(sw);
  line(0, 0, x, 0);
  //  popMatrix();

  if (num >1) {
    num--;
    drawBranch(x, sw-num/4, num);
  }
}

