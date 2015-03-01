
int hex=15, num=1, frames=200;
float radius=170, alpha, theta;

void setup() {
  size(540, 540);
  noStroke();
}

void draw() {
  background(20);
  float alpha = map(sin(theta),-1,1,10,255);
  fill(255, alpha);
  translate(width/2, height/2);
  for (int j=0; j<num; j++) {
    for (int i=0; i<hex; i++) {
      pushMatrix();
      rotate(TWO_PI/hex*i);
      float scal = map(j, 0, num-1, 1, .5);
      float x = radius*scal;
      ellipse(radius/2, 0, radius, radius);
      popMatrix();
    }
  }
  theta+=TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

void keyPressed() {
  save(random(2323)+".jpg");
}

