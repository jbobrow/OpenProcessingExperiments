
PImage img;
int blurType=0;

void mouseClicked(){ blurType=1-blurType; }

void setup(){
  size(900,900,P2D);
  frameRate(999);
  background(0,255,0);
  smooth();

  for(int x=0;x<width;x++)
  for(int y=0;y<height;y++)
  set(x,y,color(
    map( x, 0,width -1, -40, 255+40 )
   ,map( y, 0,height-1, -40, 255+40 )
   ,map( x, 0,width -1, -40, 255+40 )
  )); // gradient background to check blur brightness stability

  img=g.get();
  colorMode(HSB);
}

void draw(){
  //draw some content
  noFill();
  stroke(frameCount%360, 255, 255 );
  strokeWeight(1);
  ellipse(width/2,height/2
    ,sin(1+frameCount/300f)*width /2
    ,cos(1+frameCount/300f)*height/2
  );

  noFill();
  stroke(frameCount%360, 255, 255 );
  strokeWeight(40);  ellipse(mouseX,mouseY,30,30);  // WTF star?

  //do blurring
  if(blurType==0){
    loadPixels(); //copy window contents -> pixels[]==g.pixels[]
    fastSmallShittyBlur(g,img
     ,15.0*pow(1.0* mouseX / width,  2 )
     ,15.0*pow(1.0* mouseY / height, 2 )
    ); //g=PImage of main window
    image(img,0,0); //draw results;
  }else{
    filter(BLUR,
      15.0*pow(1.0* mouseX / width,  2 )/4
     +15.0*pow(1.0* mouseY / height, 2 )/4
    );
  }
}

/*
Fast: 40 times faster than filter(BLUR,1);
Small: Available only in 1 pixel radius
Shitty: Rounding errors make image dark soon
What happens:
   11111100 11111100 11111100 11111100 = mask == FF-3 = FCFCFCFC
   AAAAAAAA RRRRRRRR GGGGGGGG BBBBBBBB = PImage.pixel[i]
   AAAAAA00 RRRRRR00 GGGGGG00 BBBBBB00 = masked pixel
AA AAAAAARR RRRRRRGG GGGGGGBB BBBBBB00 = sum of four masked pixel, alpha overflows, who cares
   00AAAAAA RRRRRRRR GGGGGGGG BBBBBBBB 00 = shift results to right -> broken alpha, good RGB (rounded down) averages
*/

void fastSmallShittyBlur(PImage a, PImage b, float hradius, float vradius ){ //a=src, b=dest img
  int pa[]=a.pixels;
  int pb[]=b.pixels;
  int h=a.height;
  int w=a.width;
  int rowStart,rowEnd,y,i;
  int rounding;
  int   hiradius=0, viradius=0;
  float hfradius=0, vfradius=0;

  // TODO: unrandomize, use frameCount if possible for less flicker
  hfradius = random(0,hradius);
  vfradius = random(0,vradius);
  hiradius += floor(hfradius) + ( hfradius%1 > random(0,1) ? 1:0);
  viradius += floor(vfradius) + ( vfradius%1 > random(0,1) ? 1:0);

  if( viradius + hiradius <= 0 ){ arrayCopy( pa, pb ); return; }

  int rowStep = w * viradius;
  
  for( y = viradius; y < h-viradius; ++y ){ //edge pixels ignored
    rowStart=y*w  +hiradius;
    rowEnd  =y*w+w-hiradius;
    rounding = ((y^frameCount)&1)==0 ? 0x00010101 : 0x00020202; // add +1.5 (average) to prevent darkening, use ? 0xC0010101 : 0xC0020202 to fix 100% alpha if necessary
    for( i=rowStart; i<rowEnd; ++i ){
      pb[i]=((
        ( ( pa[i - rowStep  ] & 0x00FCFCFC ) // sum of neighbours only, center pixel ignored
        + ( pa[i + rowStep  ] & 0x00FCFCFC )
        + ( pa[i - hiradius ] & 0x00FCFCFC )
        + ( pa[i + hiradius ] & 0x00FCFCFC )
        )>>2)
        //|0xFF000000 // set opacity to 100%, use this or the rounding value if necessary
        )
        +rounding;
      //pb[i]-=0x020202; // uncomment for glitch mode
    }
  }
}


void fastSmallShittyBlur_OLD(PImage a, PImage b){ //a=src, b=dest img
  int pa[]=a.pixels;
  int pb[]=b.pixels;
  int h=a.height;
  int w=a.width;
  int rowStart,rowEnd,y,i;
  int rounding;
  for(y=1;y<h-1;++y){ //edge pixels ignored
    rowStart=y*w  +1;
    rowEnd  =y*w+w-1;
    rounding = ((y^frameCount)&1)==0 ? 0x00010101 : 0x00020202; // add +1.5 (average) to prevent darkening, + 0xC0000000 to fix 100% alpha
    for(i=rowStart;i<rowEnd;++i){
      pb[i]=((
        ( (pa[i-w]& 0x00FCFCFC ) // sum of neighbours only, center pixel ignored
         +(pa[i+w]& 0x00FCFCFC )
         +(pa[i-1]& 0x00FCFCFC )
         +(pa[i+1]& 0x00FCFCFC )
        )>>2)
        //|0xFF000000 //alpha -> opaque
        )
        +rounding;
    }
  }
}


