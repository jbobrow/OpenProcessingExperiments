
PImage imgIn;
PImage imgOut;
void setup() {
imgIn= loadImage("http://www61.atwiki.jp/nekowiz?cmd=upload&act=open&pageid=1296&file=2678.jpg");
imgOut= new PImage( imgIn.width, imgIn.height);
size( imgIn.width*2, imgIn.height);}

void draw() {
background(255);
image( imgIn, 0, 0 );
image( imgOut, imgIn.width, 0 );
}


void alphaBlend(PImage src1,PImage src2,PImage dust,float alpha){
 rM=a*r1+(1-a)*r2;
 gM=a*g1+(1-a)*g2;
 bM=a*b1+(1-a)*b2;
}
