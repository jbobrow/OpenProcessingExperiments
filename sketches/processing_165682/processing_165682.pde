
PImageimgIn;PImageimgOut;
void setup() {imgIn= loadImage("Parrots.jpg");
imgOut= new PImage( imgIn.width, imgIn.height);
size( imgIn.width*2, imgIn.height);}
void draw() {background(255);myFilter( imgIn, imgOut);
image( imgIn, 0, 0 );image( imgOut, imgIn.width, 0 );}
