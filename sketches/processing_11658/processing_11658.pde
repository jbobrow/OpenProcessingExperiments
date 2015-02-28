

float value, target, value2, target2;

void setup(){
  size(400,400);
  smooth();
  noStroke();
  value = 10;
  target = width-10;
  value2 = 10;
  target2 = width+10;
}

void draw(){
  background(0);
  float velocity = (target - value) * 0.01;
  value += velocity;

  ellipse(value, height/2, 25, 25);

  float velocity2 = (target2 + value2) * 0.05;
  value2 -= velocity2;
  rect(value2, height/4, 25, 25);
}


