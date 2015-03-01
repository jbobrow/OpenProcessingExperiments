
int num = 60, frames=100, sw=2;
float stepY, theta;

void setup() {
  size(500, 500);
  stepY = height*1.2/num;
}

void draw() {
  background(#53777A);
  fill(20);
  noStroke();
  rect(0,0,width, height);
  stroke(255);
  noFill();
  strokeWeight(sw);
  for (int i=0; i<num; i++) {
    float y = -50 + i*stepY;
    float offSet = TWO_PI/num*i;
    float vari = map(sin(theta+offSet), -1, 1, -60, 60);
    stroke(255);
    bezier(-sw+50, y, 0, y+vari, width, y-vari, width+sw-50, y);
  }
  strokeWeight(200);
  stroke(255);
  noFill();
  ellipse(width/2, height/2, width*1.2, height*1.2);
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}
