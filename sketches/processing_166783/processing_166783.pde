
PImage img;
int r=0, g=0, b=0;

void setup() {
  img = loadImage("p.png");
  size(600, 400);
}

void draw() {

  r+=1; 
  g+=2; 
  b+=3;
  colorMode(HSB, 600, 100, 100);

  background(r%256, g%256, b%256, 255);
  tint(0, 0, 80);
  image(img, 0, 0);
  
 }
 


