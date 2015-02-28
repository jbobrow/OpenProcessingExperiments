
/* @pjs preload="1.jpg"; 
 */

float sin1(float v){ return sin(2*PI*v); }
float cos1(float v){ return cos(2*PI*v); }
//////////////////////////////////////////////////////////////////

static final float HTMaxF      = 255; // too small -> jaggies
static final int   HTSizeShift = 10; //buggy if smaller than 10
static final int   HTSize      = 1 << HTSizeShift; // HTSize=5-10: pixelated dots, HTSize=big values: smooth dot edges
static final int   HTSizeMask  = HTSize - 1;
static final int   HTSizeY     = HTSize     << HTSizeShift;
static final int   HTSizeMaskY = HTSizeMask << HTSizeShift;
static final float HTSizeF     = HTSize;

static final float ROTMUL   = 16384.0; //integer math helper, the bigger the better
static final int   SPEEDMUL = 6;       // the greater the slower
static final int   dotsize = (int)(ROTMUL*SPEEDMUL/HTSize*70.0); // size of a dot

   int halftone[]; //halftone[0..HTSize-1]=0..HTMaxF
 float rot = 32; // grid rotation
   int time=0;
PImage img; //original image, halftoned image
   int img1[];
   int WW, HH; //pic width,height

void setup(){
  //s i z e ( 470, 580 );
  size( 329, 406 );
  WW = width;
  HH = height;

  img = loadImage("1.jpg");
  img.resize(WW,HH);
  img.loadPixels();
  img1 = new int[ WW * HH ];
  for( int y=0; y < HH; y++ ){
  for( int x=0; x < WW; x++ ){
    //img1[y*width+x]=(255-img.pixels[y*HH/height*WW+x*WW/width] &0xFF)*55/255    +y*(255-55)/height;
    img1[ y*width + x ] = (255-img.pixels[y*WW+x] &0xFF)*55/255    +y*(255-55)/HH;
  }}

  halftone = new int[ HTSize * HTSize ];
  for( int y=0; y < HTSize; y++ ){
  for( int x=0; x < HTSize; x++ ){
    halftone[y*HTSize+x] = round(  (cos1(x/HTSizeF) + cos1(y/HTSizeF) +2.0  )/4.0*HTMaxF); // halftone[]=0..HTMaxF
  }}
}

void draw(){
  loadPixels();

  //rot=sin((float)time/40.0)*21;
  time++;

  // rotations by CMYK
  int s1 = round( ROTMUL * sin(2*PI*(rot+ 108 )/360));
  int c1 = round( ROTMUL * cos(2*PI*(rot+ 108 )/360));
  int s2 = round( ROTMUL * sin(2*PI*(rot+ 162 )/360));
  int c2 = round( ROTMUL * cos(2*PI*(rot+ 162 )/360));
  int s3 = round( ROTMUL * sin(2*PI*(rot+  90 )/360));
  int c3 = round( ROTMUL * cos(2*PI*(rot+  90 )/360));
  int s4 = round( ROTMUL * sin(2*PI*(rot+  45 )/360));
  int c4 = round( ROTMUL * cos(2*PI*(rot+  45 )/360));

  int x1d = ((( SPEEDMUL*c1 )/dotsize + HTSize*1000) % HTSize );
  int y1d = ((( SPEEDMUL*s1 )/dotsize + HTSize*1000) % HTSize ) << HTSizeShift;
  int x2d = ((( SPEEDMUL*c2 )/dotsize + HTSize*1000) % HTSize );
  int y2d = ((( SPEEDMUL*s2 )/dotsize + HTSize*1000) % HTSize ) << HTSizeShift;
  int x3d = ((( SPEEDMUL*c3 )/dotsize + HTSize*1000) % HTSize );
  int y3d = ((( SPEEDMUL*s3 )/dotsize + HTSize*1000) % HTSize ) << HTSizeShift;
  int x4d = ((( SPEEDMUL*c4 )/dotsize + HTSize*1000) % HTSize );
  int y4d = ((( SPEEDMUL*s4 )/dotsize + HTSize*1000) % HTSize ) << HTSizeShift;

  int col1,col2,col3,col4;  // calculated CMYK colors
  int target; // pixel value of the "image" to paint
  int xt,yt,ytt,xy;
  int x1, y1, x2, y2, x3, y3, x4, y4;

  int t0 = millis();//benchmark

  for( int yy=0; yy < HH; yy++ ){
    // calculate current pixel color, you can get it from an image
    float p = (float)yy / HH; // =0..1
          p = asin( p*2.0 - 1.0 )/PI + 0.5; // smoother transitions
    target = floor( p*HTMaxF );

    ytt = (yy - HH/2) * SPEEDMUL;
    int yt3 = ytt + time*3;                //actual speed=time/SPEEDMUL*xxx
    int yt1 = ytt + time*4;                //actual speed=time/SPEEDMUL*xxx
    int yt2 = ytt + time*5;                //actual speed=time/SPEEDMUL*xxx
    int yt4 = ytt + time*6;                //actual speed=time/SPEEDMUL*xxx

    xy = yy*WW+(0); //array index
    xt = ((0)-WW/2)*SPEEDMUL; //(0) <=> xx=0

    x1 = ((( xt*c1 - yt1*s1 )/dotsize + 1000*HTSize ) & HTSizeMask ); // big number to fix % or & as modulo
    y1 = ((( xt*s1 + yt1*c1 )/dotsize + 1000*HTSize ) & HTSizeMask ) << HTSizeShift;
    x2 = ((( xt*c2 - yt2*s2 )/dotsize + 1000*HTSize ) & HTSizeMask );
    y2 = ((( xt*s2 + yt2*c2 )/dotsize + 1000*HTSize ) & HTSizeMask ) << HTSizeShift;
    x3 = ((( xt*c3 - yt3*s3 )/dotsize + 1000*HTSize ) & HTSizeMask );
    y3 = ((( xt*s3 + yt3*c3 )/dotsize + 1000*HTSize ) & HTSizeMask ) << HTSizeShift;
    x4 = ((( xt*c4 - yt4*s4 )/dotsize + 1000*HTSize ) & HTSizeMask );
    y4 = ((( xt*s4 + yt4*c4 )/dotsize + 1000*HTSize ) & HTSizeMask ) << HTSizeShift;

    for( int xx = 0;  xx < WW;  xx++ ){
      target = img1[xy];

      // Light->Dark colors, dark colors are faster
      x1 += x1d;   y1 += y1d;
      x2 += x2d;   y2 += y2d;
      x3 += x3d;   y3 += y3d;
      x4 += x4d;   y4 += y4d;
      pixels[xy] = (halftone[ (x1 & HTSizeMask) + (y1 & HTSizeMaskY) ] > target ? 0xFFFFFFFF : 0xFF0FFFFF)  //Cyan
                 & (halftone[ (x2 & HTSizeMask) + (y2 & HTSizeMaskY) ] > target ? 0xFFFFFFFF : 0xFFFF0FFF)  //Magenta
                 & (halftone[ (x3 & HTSizeMask) + (y3 & HTSizeMaskY) ] > target ? 0xFFFFFFFF : 0xFFFFFF0F)  //Yellow
                 & (halftone[ (x4 & HTSizeMask) + (y4 & HTSizeMaskY) ] > target ? 0xFFFFFFFF : 0xFF3F3F3F); //blacK


      xy++; //array index
      xt += SPEEDMUL; //(xx-WW/2)*SPEEDMUL
    }
  }
  //println((float)(millis()-t0));

  updatePixels();
}


