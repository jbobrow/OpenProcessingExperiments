
float x=50.0;
float y=50.0;
float angle=0.2;
float speed=5;

void setup(){
  size(700,500);
  background(0);
  stroke(x+100,x*2,y,130);
  randomSeed(121);
}
void draw(){
  angle+=random(-0.3,0.3);
  x+=cos(angle)*speed;
  y+=sin(angle)*speed;
  translate(x,y);
  rotate(angle);
  line(0,-100,0,100);
}


