
float x;
float y;
float directionX;
float directionY;

void setup(){
  size(1000,1000);
  smooth();
  frameRate(1000);
  x = 100;
  directionX = 3.1;
  y = 300;
  directionY = 3.1;
}

void draw(){
  background(20);
  ellipse(x,y,30,30);
  x += directionX;
  y += directionY;
  if (x > width){
    directionX = -4.001 * directionX;
  }
  if (y > height){
    directionY = -4.001 * directionY;
  }
  if (x < 0){
    directionX = 10.2;
  }
  if (y < 0){
    directionY = 7.4;
  }
  println (x);
  println (y);
}
void mouseMoved() {
int Red = round(random(0,100));
int Green = round(random(0,100));
int Blue = round(random(0,100));
background(Red,Green,Blue);
println(Red + ", " + Green + ", " + Blue);
}

