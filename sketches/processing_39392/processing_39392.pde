
int X;
int Y;
int directionX;
int directionY;
int value = 0;

void setup(){
  size(600,600);
  smooth();
  X = 40;
  Y = 280;
  directionX = 1;
  directionY = 2;
}

void draw(){
  //background(255);
  noStroke();
  fill(value);
  triangle(X, Y, 0, 0, 0, 80);
  X += directionX;
  Y += directionY;
  fill(value);
  rect(X,Y,50,50);
  if(X>=600){
    directionX = -21;
  }
  if(Y>=600){
    directionY = -18;
  }
  if(X<=0){
  directionX = 21;
  }
  if(Y<=0){
  directionY = 19;
  }
  println("x: " + mouseX + " y: " + mouseY);
}

void mouseDragged() 
{
  value = value + 55;
  if (value > random(255)) {
    value = 0;
  }
}

