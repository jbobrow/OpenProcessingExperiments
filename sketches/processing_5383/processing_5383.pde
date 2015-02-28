
PImage img;
int blurType=0;
void keyReleased(){ blurType=1-blurType; }

void setup(){
  size(900,900,P2D);
  frameRate(999);
  background(0,255,0);
  img=g.get();
}

void draw(){
  //draw some content
  noFill();stroke(255,0,128);strokeWeight(2);smooth();
  ellipse(width/2,height/2
    ,sin(1+frameCount/300f)*width /2
    ,cos(1+frameCount/300f)*height/2
  );
  noFill();stroke(0,0,255);strokeWeight(2);smooth();
  ellipse(mouseX,mouseY,20,20);

  //do blurring
  if(blurType==0){
    loadPixels(); //copy window contents -> pixels[]==g.pixels[]
    fastSmallShittyBlur(g,img); //g=PImage of main window
    image(img,0,0); //draw results;
  }else{
    filter(BLUR,1);
  }
}

/*
Fast: 40 times faster than filter(BLUR,1);
Small: Available only in 1 pixel radius
Shitty: Rounding errors make image dark soon
What happens:
   11111100 11111100 11111100 11111100 = mask
   AAAAAAAA RRRRRRRR GGGGGGGG BBBBBBBB = PImage.pixel[i]
   AAAAAA00 RRRRRR00 GGGGGG00 BBBBBB00 = masked pixel
AA AAAAAARR RRRRRRGG GGGGGGBB BBBBBB00 = sum of four masked pixel, alpha overflows, who cares
   00AAAAAA RRRRRRRR GGGGGGGG BBBBBBBB 00 = shift results to right -> broken alpha, good RGB (rounded down) averages
*/
void fastSmallShittyBlur(PImage a, PImage b){ //a=src, b=dest img
  int pa[]=a.pixels;
  int pb[]=b.pixels;
  int h=a.height;
  int w=a.width;
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ( (pa[i-w]&mask) // sum of neighbours only, center pixel ignored
         +(pa[i+w]&mask)
         +(pa[i-1]&mask)
         +(pa[i+1]&mask)
        )>>2)
        |0xFF000000 //alpha -> opaque
        ;
    }
  }
}

