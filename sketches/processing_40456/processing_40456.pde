
int circleQ=100;
int circleW=75;
int circleE=300;
int circleT=200;
int weight=15;
int fifty=50;

void setup() {
  size(400,400);
  background(255);
  smooth();
}

void draw(){
  stroke(fifty,circleQ,circleT);
  strokeWeight(weight);
  fill(circleT,circleW,circleT);
  ellipseMode(CENTER);
  ellipse(circleQ,circleQ,circleW,circleW);
  ellipse(circleE,circleE,circleW,circleW);
  ellipse(circleQ,circleE,circleW,circleW);
  ellipse(circleE,circleQ,circleW,circleW);
  circleQ=circleQ+1;
  circleE=circleE-1+fifty;
  circleT=circleE+2-circleQ;
  circleT=circleQ-fifty;
  fifty=circleE-weight;
  weight=circleQ+30;
  


}


