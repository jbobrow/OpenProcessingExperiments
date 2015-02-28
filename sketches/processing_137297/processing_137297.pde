
int x = 0;
float n;
float y;

void setup(){
  size (500,500);
  background(255);
  frameRate (50);
}

void draw(){
  x ++;
  float n = norm (x, 0.0, 500.0);
  float y = 1-pow(n, 4);
  y *= 500;
  noFill();
  stroke (x, 120, 20);
  ellipseMode(CORNER);
  ellipse (x ,y, 0.5*x, 0.5*y);
  //stroke (x,45,20);
  //rect(x,y, 10, 10);
  if (x>500){
    x = x-500;
  }
  println(y);
}


