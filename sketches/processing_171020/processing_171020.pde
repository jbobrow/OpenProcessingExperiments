
int step, frames=240;
float theta;

void setup() {
  size(500, 500);
  step = height/10;
}

void draw() {
  color col1 = #5A8358;
  color col2 = #ffffff;
  float h = step/4.0;
  background(col1);
  noStroke();
  for (int y=0; y<height; y+= step) {
    fill(col2,200);
    rect(0, y, width, h);
  }
  float r = width/4;
  float sz = 150;
  float x = width/2+cos(theta)*r;
  float py = height/2+sin(theta)*r;
  fill(col1);
  ellipse(x, py, sz, sz);    
  for (int y=step/2; y<height; y+= step) {
    fill(col2);
    rect(0, y, width, h);
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

