
float theta, inc;

void setup() {
  size (800, 600);
  smooth();
  theta = 0;
  inc = 0.0;
  noStroke();
}

void draw(){
  background(255);
  pushMatrix();
    translate(width/2, height/2);
    rotate(radians(theta));
    fill(255, 227, 247);
    drawArc0();
  popMatrix();
 
  pushMatrix();
    translate(width/3, height*2/3);
    rotate(radians(theta));
    fill(153, 252, 233);
    drawArc1();
  popMatrix();
  
  theta++;
}

 
void drawArc0(){
  int numSpokes = 300;
  for (int i=0; i < numSpokes; i++) {
    float t0 = map(i, 0, numSpokes, 0, TWO_PI);
    float t1 = t0 + (TWO_PI/(2 * numSpokes));
    arc(0, 0, 800, 1000, t0, t1);
  }
}
 
void drawArc1() {
  int numSpokes = 100;
  for (int i=0; i < numSpokes; i++) {
    float t0 = map(i, 0, numSpokes, 0, TWO_PI);
    float t1 = t0 + (TWO_PI/(2 * numSpokes));
    arc(0, 0, 600, 600, t0, t1);
  }
}



