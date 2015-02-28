
PImage img;
color r;
int side = 5;
int rot = 0;
int turn = 45;

void setup() {
  colorMode(HSB, 360, 100, 100);
  r = color(255, 100, 100);
   img = loadImage("logo_plain.jpg");
   size(500,150); 
   image(img,0,0);
   loadPixels();

   for (int i=0; i<height; i+=side) {
     for (int j=0; j<width; j+=side) {
       int k = i*width+j;
       color cp = pixels[k];
       float b = brightness(cp);
       if (b > 10) {
         rot += turn;
         createSquare(i,j,side,rot%360);
         }
       }
     } 
   //save("squares001.jpg");
}

void draw() {
}

void createSquare(int i_, int j_, int side_, int rot_) {
  int i = i_;
  int j = j_;
  int side = side_;
  int rot = rot_;
  rectMode(CENTER);
  colorMode(HSB,360,100,100);
  fill(40,100,100);
  stroke(0);
  pushMatrix();
  translate(j,i);
  rotate(rot);
  rect(0,0, side, side);
  popMatrix();
}

