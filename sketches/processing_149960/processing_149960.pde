
int step, i=0, num=26;
float theta;

void setup() {
  size(500, 500);

  step=height/num;

}

void draw() {
  background(20);
  fill(#FFB700);
  noStroke();
  ellipse(width/2,height/2,width*.6, height*.6);
  i=0;
  for (int y=2*step; y<height-2*step+1; y += step) {
    float sw = map(sin(theta+(TWO_PI/num*i)), -1, 1, 1.5, 12);
    float edge = 2*step;
    stroke(20);
    strokeWeight(sw);
    line(edge, y, width-edge, y);
    i++;
  }
  theta += .0523;
  
  //if (frameCount%1==0 && frameCount<121) saveFrame("image-###.gif");
  
}

