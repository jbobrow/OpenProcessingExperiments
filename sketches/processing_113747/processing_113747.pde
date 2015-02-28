
int fpWidth = 10, fpHeight = 10;
int [][] fpBitmap = new int[fpWidth][fpHeight];
int [] embers1 = new int[fpWidth],
  embers2 = new int[fpWidth];
  
PImage img = new PImage(fpWidth, fpHeight);
color [] palette = new color[256];

void setup(){
  size(300,300);
  frameRate(30);
  
  for (int iColor=255; iColor>225; iColor--)
    palette[iColor] = color(255,255,100);

  for (int iColor=225; iColor>200; iColor--)
    palette[iColor] = color(255,255,40);


  for (int iColor=200; iColor>100; iColor--)
    palette[iColor] = color(255, iColor-50, 40);
    
  for (int iColor=100; iColor>75; iColor--)
    palette[iColor] = color(255-iColor, 0, 0);
  
  for (int iColor=75; iColor>0; iColor-=5){
    int c = (int)(random(iColor));
    palette[iColor] = color(c);
    palette[iColor+1] = color(c);
    palette[iColor+2] = color(c);
    palette[iColor+3] = color(c);
    palette[iColor+4] = color(c);
  }
    
  //for (int iColor=0; iColor<256; iColor++)
    //palette[iColor] = color(iColor);
}

int updateFrames = 0, nUpdateFrames = 10;

void draw(){
  background(0);
  
  for (int iX = 0; iX<fpWidth; iX++)
    for (int iY = 0; iY<fpHeight; iY++)
      img.set(iX, iY, palette[fpBitmap[iX][iY]]);
  
  for (int iY = 0; iY<fpHeight-1; iY++)
    for (int iX = 1; iX<fpWidth-1; iX++)
      fpBitmap[iX][iY] = 
      (int)(((fpBitmap[iX-1][iY+1]*.1) +
       (fpBitmap[iX][iY+1]*.8) + 
       (fpBitmap[iX+1][iY+1]*.1))*.9) ; 
  
  if ((updateFrames = (updateFrames + 1)%nUpdateFrames)==0){  
    for (int iX=0; iX<fpWidth; iX++){
      embers1[iX] = embers2[iX];
      embers2[iX] = (int)random(255);
    }
  }
   for (int iX=0; iX<fpWidth; iX++){
     fpBitmap[iX][fpHeight-1] = (int)lerp(embers1[iX], embers2[iX], updateFrames/(float)nUpdateFrames);
     
  }
 
  
  pushMatrix();
  scale((float)width/(fpWidth));
  image(img, 0, 0);
  popMatrix();
}


