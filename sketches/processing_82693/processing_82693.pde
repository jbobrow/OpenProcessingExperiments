
float noiseval, xpos;
float angle = 0.0;
float scalar = 0.05; 
float x1=10;
float y1=0;
float x2;
float x3;
float y3=30;

void setup() {
  size (1200, 400);
  background(0);   
  noiseval = 0;
  xpos = 10;
} 
void draw() {

  strokeWeight(0); 
  noiseval += 0.1;
  xpos=xpos+5;

  float n=random(-30, 30);
  float valorSeno = sin(angle);
  float valorCoseno = cos(angle);

  noFill();
  stroke(255, 170);
  strokeWeight(2);

  angle += 0.1;

  pushMatrix();
  translate(0, noise(-1, 1)*5*height/4*sin(angle)*scalar+170);
  triangle(x1+n+xpos, y1+noiseval, x2-n+xpos, y1-noiseval, x3*n+xpos, y3+random(-height/3, height/3));

  popMatrix();
}
