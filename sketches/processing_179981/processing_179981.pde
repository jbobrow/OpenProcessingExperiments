
int step=20;

void setup() {
  size(500, 500);
}

void draw() {
  background(20);
  stroke(255);
  strokeWeight(1);
  for (int y=-height; y<height; y+=step) {
   // line(0, y, width, y+width);
  }
  for (int x=-width; x<width; x+=step) {
    //line(x+frameCount%step, height, x+frameCount%step+width, 0);
    //line(x+frameCount%step, height, width, 0);
    line(x+frameCount%step, height, width, -width);
  }
  float sz=180;
  strokeWeight(180);
  stroke(20);
  noFill();
  ellipse(width/2, height/2, sz, sz);
  //if (frameCount<=step) saveFrame("image-###.gif");
}
