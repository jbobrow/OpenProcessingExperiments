
PImageimgIn;PImageimgOut;
void setup() {imgIn= loadImage("http://www61.atwiki.jp/nekowiz?cmd=upload&act=open&pageid=1296&file=2678.jpg");
imgOut= new PImage( imgIn.width, imgIn.height);
size( imgIn.width*2, imgIn.height);}
void draw() {background(255);myFilter( imgIn, imgOut);
image( imgIn, 0, 0 );image( imgOut, imgIn.width, 0 );}
