
int num = 40;
int mod = 7;
float theta, sz = 20;

void setup() {
  size(500, 500);
}

void draw() {
  background(20);
  stroke(255);

  mod = (int) map(sin(theta),-1,1,1,8);

  for (int i=0; i<num; i++) {
    noFill();
    float x = width/2;
    float y = (i+.5)*sz*.7;
    float sz1 = ((i%mod)+1.5)*sz;
    ellipse(x, y, sz1, sz);
  }
  theta += 0.0523;
  
  //if (frameCount%4==0 && frameCount<121) saveFrame("image-###.gif");

}
