
/*
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage p;
PImage q;
PImage r;
PImage s;
PImage t;
PImage u;
PImage v;
PImage w;
PImage x;
PImage y;
*/
int pasthour; 
PImage imagechoice;


void setup() {
  size(480, 480);
  background(255);
  smooth();
  /*
  a = loadImage("hour1.png");
  c = loadImage("hour2.png");
  d = loadImage("hour3.png");
  e = loadImage("hour4.png");
  f = loadImage("hour5.png");
  g = loadImage("hour6.png");
  h = loadImage("hour7.png");
  i = loadImage("hour8.png");
  j = loadImage("hour9.png");
  k = loadImage("hour10.png");
  l = loadImage("hour11.png");
  m = loadImage("hour12.png");
  n = loadImage("hour13.png");
  o = loadImage("hour14.png");
  p = loadImage("hour15.png");
  q = loadImage("hour16.png");
  r = loadImage("hour17.png");
  s = loadImage("hour18.png");
  t = loadImage("hour19.png");
  u = loadImage("hour20.png");
  v = loadImage("hour21.png");
  w = loadImage("hour22.png");
  x = loadImage("hour23.png");
  y = loadImage("hour24.png");
  */
  
   noLoop();
}
 
void draw() {
  background(255);
  if (pasthour!=hour())
  {
  pasthour=hour();
  imagechoice = loadImage("hour"+pasthour+".png");
  image(imagechoice, 0, 0);
//picture = loadImage("ME" + counter + ".JPG");
  //image(picture, 0, 0);

  }
  smooth();
  
  
  
  
  
  
  
  
  
  
  
  
}

