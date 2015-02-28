
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
 
void setup(){
  size(500, 500);
  a = loadImage("01.jpg");
  b = loadImage("02.jpg");
  c = loadImage("03.jpg");
  d = loadImage("04.jpg");
  e = loadImage("05.jpg");
  f = loadImage("06.jpg");
  g = loadImage("07.jpg");
  h = loadImage("08.jpg");
  i = loadImage("09.jpg");
  j = loadImage("10.jpg");
}
 
void draw(){
  image(a, 0, 0, 150, 200);
  image(b, 150, 0, 150, 200);
  image(c, 300, 0, 300, 200);
  image(d, 0, 200, 100, 150);
  image(e, 100, 200, 130, 150);
  image(f, 230, 200, 150, 150);
  image(g, 380, 200, 150, 150);
  image(h, 0, 350, 200, 150);
  image(j, 320, 350, 200, 150);
  image(i, 150, 350, 200, 150);
}



