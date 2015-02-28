
int num, steps = 20;
float theta, angle;

void setup() {
  size(400, 400);
  noStroke();
  rectMode(CENTER);
}


void draw() {
  background(#202020);

  translate(width/2, height/2);
  //ellipse(0, 0, 5, 5);
  angle=0;
  for (int j=0; j<steps; j++) {
    pushMatrix();
    rotate(angle);
    num = (int) map(sin(theta+TWO_PI/steps*j), -1, 1, 1, 13);
    colorMode(HSB,255,100,100);
    fill(255/steps*j,80,80);
    for (int i=0; i<num; i++) {
      rect(50+i*12, 0, 8, 12);
    }
    angle += (TWO_PI/steps);
    colorMode(RGB);
    popMatrix();
  }
  theta += .0523;
  
  if (frameCount%4==0 && frameCount < 121) saveFrame("image-###.gif");
  
}

