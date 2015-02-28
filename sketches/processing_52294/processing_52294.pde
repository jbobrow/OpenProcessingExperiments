
float angulo = 0.0;

void setup(){
  size(429,420);
  smooth();
  frameRate(15);
}

void draw(){
  fill (random(255));
  translate(random(400),random(400));
  rotate(angulo);
  rect(-30,-30,60,60);
  angulo=angulo+0.1;
}                           
