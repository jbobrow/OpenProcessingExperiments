
int num = 30;
float theta, yStart;

void setup() {
  size(500, 500);
  noFill();
  strokeCap(SQUARE);
}

void draw() {
  background(#202020);
  translate(width/2, height/2);
  strokeWeight(2);
  stroke(#00ff00,200);
  for (int i=0; i<num; i++) {
    fill(#00ff00, 75);
    //noStroke();
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet);
    float sz = map(sin(theta+offSet*(num/10)), -1, 1, 50, 120);
    float start = theta/2;
    float end = start + PI;
    yStart = width*.25;
    arc(0, yStart, sz, sz, start, end);
    popMatrix();
  }
    for (int i=0; i<num; i++) {
    fill(#00ff00, 75);
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet);
    float sz = map(sin(theta+offSet*(num/10)), -1, 1, 50, 120);
    float start = theta/2;
    float end = start + PI;
    yStart = width*.25;
    float x = cos(start)*sz/2;
    float y = sin(start)*sz/2;
    float x2 = cos(end)*sz/2;
    float y2 = sin(end)*sz/2;
    fill(#202020);
    float sz2 = map(sin(theta), -1, 1, 10, 20);
    ellipse(x, yStart+y, sz2, sz2);
    ellipse(x2, yStart+y2, sz2, sz2);
    popMatrix();
  }
  theta += 0.0523;
  //if (frameCount%3==0 && frameCount<241) saveFrame("image-###.gif");
}

