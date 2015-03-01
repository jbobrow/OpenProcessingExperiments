
float theta,sz;
int num = 150, min=40, max=100;
 
void setup() {
  size(500, 500);
  colorMode(HSB, num,100,100);
}
 
 
void draw() {
  background(0);
  stroke(255,100);
  fill(255,5);
    for (int i=0; i<num; i=i+5) {
    fill(i,90,i,25);
    float offSet = TWO_PI/num*i;
    float y = map(sin(theta+offSet), -1, 1, height*.2, height*.8);
    float x = map(sin(theta-offSet), -1, 1, width*.2, width*.8);
    float sz = map(sin(theta*1+offSet*255), -1, 1, min, max);
 
    ellipse(x, y, i, x);
  }
  theta += 0.0523/2;
}
