
int num =500;
float step, sz, offSet, theta;
int c = 0, dir = 1;
 
void setup() {
  size(1200, 800);
  strokeWeight(5);
  step = 2;
  
}
 
void draw() {
  if(c > 255){
    dir = -1;
  }
  
  if(c < 0){
    dir = 1;
  }
  background(255, 204, c);
  translate(width/2, height*1.1);
  for (int i=0; i<num; i++) {
    stroke(i*.75, i/3, i/2);
    noFill();
    sz = i*step*4;
    float offSet = TWO_PI/(num/10)*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .523;
   c += dir;
}



