
float angle=0.0;
float speed=0.05;
void setup(){
  size(300,300);
  noStroke();
  smooth();
  fill(108,42,118,180);
}
void draw(){
  background(0);
  //circlehase(0.0);
  circlePhase(QUARTER_PI);
  circlePhase(HALF_PI);
  angle+=speed;
}
void circlePhase(float phase){
  float diameter=165+(sin(angle+phase)*100);
  ellipse(150,150,diameter,diameter);
}


