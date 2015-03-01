
int constant=250;
float angle=0.05;
int scalar=100;
float speed=0.05;

void setup(){
  size(600,600);
  frameRate(60);
  smooth();
}

void draw(){
  background(242,253,255,100);
  float x=constant+sin(angle)*scalar;
  float y=constant+cos(angle)*scalar;
  float x2=constant-sin(angle)*scalar;
  float y2=constant-cos(angle)*scalar;
  //float x3=constant-sin(angle)*scalar;
  //float y3=constant-cos(angle)*scalar;
  noStroke();
  fill(255,0,0,50);
  ellipse(x,y,50,50);
  fill(0,255,0,50);
  ellipse(x2+100,y2+100,50,50);
  //fill(0,0,255,40);
  //ellipse(x3+100,y3+100,50,50);
  angle=angle+speed;
}
