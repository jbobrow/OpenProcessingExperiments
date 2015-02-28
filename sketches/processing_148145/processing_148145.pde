
void setup() {
  size(400, 400);
  noFill();
  smooth();
  stroke(0.01);
}

void draw() {
  grow();
}
float a=0;

void grow() {
  background(255);
  //fill(0);
  translate(width/2, height/2);

  beginShape();
  float noise =200;//+= random(-3,3);
  for (int i=0;i<360;i+=1) {
    noise = 150+sin( radians( i*a ) ) * 40;
    float diameter = 0;
    curveVertex( diameter+(cos( radians(i) )*noise), diameter+(sin( radians(i) )*noise) );
  }
  a+=0.1;
  endShape();
}

