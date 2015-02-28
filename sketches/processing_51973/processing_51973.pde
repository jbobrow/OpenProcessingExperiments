
PImage puppy;
float x,y,dX,dY,easing;

void setup(){
  size(1000,800);
  puppy = loadImage("puppy.jpg");
  imageMode(CENTER);
  x = 0;
  y = 0;
  easing = .05;
}

void draw(){
  //background(255);
  dX = mouseX - x;
  dY = mouseY - y;
  
  x = x + dX*easing;
  y = y + dY*easing;
  image(puppy,x,y);
  
}

