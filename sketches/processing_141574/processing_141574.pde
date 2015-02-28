
int num = 20;
float[] posX = new float[num];
float unit, theta, x, szX, szY;

void setup() {
  size(500, 300);
  rectMode(CENTER);
  noFill();
  fill(#FCD300);
  stroke(#777777);
  strokeWeight(2);
  unit = (width-50)/num;
}


void draw() {
  background(#202020);
  for (int i=0; i<num; i++) {
    szX = map(sin(theta+(TWO_PI/num)*i), -1, 1, 5, 10);
    szY = map(sin(theta+(PI/num)*i), -1, 1, 30, 250);
    x = map(sin(theta+(PI/num/2)*i), -1, 1, i*unit, width/2);
    rect(x+25, height/2, szX, szY);
  }
  theta += 0.0523;

  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
}

