
float x = 0.0;
float y = 0.0;

void setup(){
  size(250, 250);
  smooth();
  background(255);
}

void draw(){
  frameRate(60);
  x += 3;
  y = -x + 200;
  stroke(255, 0, 0, y);
  noFill();
  ellipse(125, 125, x, x);
  if (x > 360){
    x = 0;
  }
}

