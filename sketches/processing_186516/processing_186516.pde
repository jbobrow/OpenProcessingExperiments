
float theta,sz;
int num = 150, min=40, max=100;
 
void setup() {
  size(1000, 500);
  colorMode(HSB, num,max,min);
}
 
 
void draw() {
  background(900,106,106);
  stroke(900,min);
  fill(max);
    for (int i=0; i<num; i=i+70) {
    fill(i,100,i,max);
    float offSet = TWO_PI/num*i;
    float y = map(sin(theta+offSet), -1, 1, height*.9, height*.8);
    float x = map(sin(theta-offSet), -1, 1, width*.2, width*.8);
    float sz = map(sin(theta*1+offSet*255), -1, 1, min, max);
 
    ellipse(y, y, y, min);
  }
  theta += 0.0523/2;
}
