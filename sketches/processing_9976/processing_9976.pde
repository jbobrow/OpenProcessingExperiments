
 int x = 10;
PImage a;

void setup(){
  size(400,400);
}

void draw (){
  x =  x + 2;
  if (x > 255)
    x = 255;

  PImage a;
  a = loadImage ("ciudad.jpg");
  tint (10+x); 
  image (a,0,0);
  
  stroke (185,107,58,250);
  fill (211,160,58,150);
  ellipse (70,120,60,60);
}

