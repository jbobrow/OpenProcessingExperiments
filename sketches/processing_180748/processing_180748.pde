
int frames = 200, num=20;
float theta;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  background(20);
  fill(255, 30);
  stroke(255, 50);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet=TWO_PI/num*i;
    rotate(offSet);
    float sz = width*.20;
    float x = map(sin(theta), -1, 1, sz, width*.2);
    translate(x, 0);
    pushMatrix();
    rotate(theta);
    ellipse(0, 0, sz, sz*2);
    ellipse(0, 0, sz*.7, sz*2*.7);
    popMatrix();
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

