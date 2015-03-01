
int num = 25, num2=16, frames=180;
float theta;

void setup() {
  size(500, 400);
}

void draw() {
  background(240);
  stroke(#114B09,150);
  strokeWeight(1);
  float y = height;
  float x = 0; 
  for (int j=0; j<num2; j++) {
    x = -50+j*50;
    float off2 = PI/num2*j;
    for (int i=0; i<num; i++) {
      pushMatrix();
      translate(x, y);
      float offSet = PI/num;
      float r = -PI/2 + map(sin(theta+off2), -1, 1, PI/4, i*offSet);
      rotate(r);
      line(0, 0, 0, -i*10);
      popMatrix();
    }
  }
  theta += TWO_PI/frames;
  //if (frameCount<frames+1) saveFrame("image-###.gif");
}

