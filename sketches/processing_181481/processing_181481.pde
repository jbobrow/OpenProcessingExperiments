
int num =20;
float step, sz, offSet, theta, angle;

colorMode(RGB,100);
 
void setup() {
  size(600, 400);
  strokeWeight(5);
  step = 22;
}
 
void draw() {
  background(20);
  translate(width/2, height*.75);
  angle=0;
  for (int i=0; i<num; i++) {
    

    stroke(random(num*2), random(num*2), random(num*2));
    
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
   
}
