
int num =20;
float step, sz, offSet, theta, angle;
 
void setup() {
  size(600, 450);
  strokeWeight(5);
  step = 22;
}
 
void draw() {
  background(250);
  translate(width/2, height*.75);
  angle=0;
  for (int i=0; i<num; i++) {
    //stroke((255-i)%100,(255*i)%100,(cos(i)*255)%100);
    stroke((cos((i*i)-i)*255)%255,(cos(i)*255)%255,(cos(i+1)*255)%255);
    noFill();
    sz = i*step;
    float offSet = PI/sin(i)/i;
    float arcEnd = map(tan(theta+offSet)*i-cos(theta-offSet),-1,1, TWO_PI-i, (TWO_PI*PI)-i);
    arc(0, -100, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
  theta += 0.005;
}

