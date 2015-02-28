
PImage t;
PImage c;
float x,y;

void setup() {
  t=loadImage("town.png");
  c=loadImage("car.png");
  size(548,548);
  background(0);
  //imageMode(CENTER);
  smooth();
  noStroke();
  x=-130;
  y=100;
}

void draw() {
  background(0);
  image(t,0,0);
  image(c,x,y); 
  x=x+2;
  y=y+1;
  if(x>width)
  {
    x=-130;
    y=100;
  }
}

