
float headX = 300;
int inc = 3;

void setup() {
  size(800,600);
  frameRate(5);
}

void draw(){
  fill(255,255,0);
  ellipse(headX,200,200,200);
  fill(0,0,0);
  ellipse(headX-30,180,30,30);
  ellipse(headX+30,180,30,30);
  headX += inc;
}
