
float theta, sz = 150;
int num=30;

void setup() {
  size(640, 480);
}

void draw() {
  background(#529BFF);
  fill(#FCE400, 120);
  noStroke();
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    float offSet=TWO_PI/num*i;
    pushMatrix();
    rotate(offSet);  
    float s = map(sin(theta+offSet*8), -1, 1, -sz, -sz*1.5);
    triangle(-sz/2, 0, 0, s, sz/2, 0);
    popMatrix();
  }
  fill(#FCE400);
  ellipse(0, 0, sz*1.5, sz*1.5);
  theta += 0.0523;
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
}
