
PImage pic;
float puntos,p,r,g,b,n,N;

void setup() {
  p=0;
  n=0;
  background(0);
  size(682,511);
  frameRate(150);
  pic = loadImage("P7220050.jpg");
  smooth();
  noStroke();
}

void draw() {
  n+=0.039;
  p+=0.01;
  puntos=25-p;
  N=noise(n)*2.3;
  if (p>=20){
    p=0; 
  }  
  int x = int( random(pic.width));
  int y = int( random(pic.height));
  int P = x + y*pic.height;
  loadPixels();
  r = red(pic.pixels[P]);
  g = green(pic.pixels[P]);
  b = blue(pic.pixels[P]);
  fill(r,g,b,160*N);
  ellipse(x,y,puntos,puntos); 
}






