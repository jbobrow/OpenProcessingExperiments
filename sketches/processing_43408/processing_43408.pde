
//////////////////////////////////////////////////////
//  Exercise042 - content based filtering
//  Leonardo Covarrubias
//
//
//////////////////////////////////////////////////////

PImage muffin;
PImage muffinB;
PImage muffinC;

int thresh;

muffinB = loadImage("muffin.jpg");
muffinB.loadPixels();
muffinC = loadImage("muffin.jpg");
muffinC.loadPixels();

muffin = loadImage("muffin.jpg");
muffin.loadPixels();

int W = muffin.width;
int H = muffin.height;

int[] binArray = new int[H * W];

color RED = color(255,0,0);

size(muffin.width, muffin.height*2);

thresh = 25;
//colorMode(HSB,255);

for(int y=0; y < muffin.height; y++){
  int ycol = (y*muffin.width);
  for(int x = 0; x < muffin.width; x++){
    int index = ycol+x;

    color c = muffin.pixels[index];

    float r = red(c);
    float g = green(c);
    float b = blue(c);
    float h = hue(c);
    float s = saturation(c);
    float br = brightness(c);

    //blueberry blue = 43, 50, 53
    //face = 229, 181, 167
    //muffin = 238, 175, 78

    int redTarget = 43;
    int greenTarget = 50;
    int blueTarget = 53;

    if( (redTarget-thresh<=r)&&(r<=redTarget+thresh) && 
      (greenTarget-thresh<=g)&&(g<=greenTarget+thresh) && 
      (blueTarget-thresh<=b)&&(b<=blueTarget+thresh) ) {

      if(index < 120000){   
        muffin.pixels[index] = RED;// color (255,s*1.5,br*1.6);
      }

    }//end for thresh

  }//end for X
}//end for Y

////////////////////
//Grow red region//
////////////////////

int growTimes = 4;

for(int count = 1; count<=growTimes; count++){

  /////////////////////////////////////
  //create binary detection image/
  /////////////////////////////////////

  for(int i = 0; i < binArray.length; i++){
    if(muffin.pixels[i] == RED){
      binArray[i] = 1;
      muffinC.pixels[i] = color(255);
    }
    else{
      binArray[i] = 0;
      muffinC.pixels[i] = color(0);
    }
  }//end create binary bird Image

  /////////////////////////
  //grow RED pixel region//
  /////////////////////////

  ///////////
  // f|b|g //
  // d|a|c //
  // h|e|i //
  ///////////

  for(int y = 1; y < H-1; y++){
    int ycol = (y*W);
    color average;
    for(int x = 1; x < W-1; x++){
      int a = ycol+x;
      int b = (y*W) + (x-1);
      int c = ((y+1)*W) + x;
      int d = ((y-1)*W) + x;
      int e = (y*W) + (x+1);
      int f = ((y-1)*W) + (x-1);
      int g = ((y-1)*W) + (x+1);
      int h = ((y+1)*W) + (x-1);
      int i = ((y+1)*W) + (x+1);

      average = (muffinC.pixels[b]+muffinC.pixels[c]+muffinC.pixels[d]+muffinC.pixels[e])/4;

      muffinC.pixels[a] = average;

      if(binArray[a] == 1){
        muffin.pixels[b] = RED;
        muffin.pixels[c] = RED;
        muffin.pixels[d] = RED;
        muffin.pixels[e] = RED;
        //muffin.pixels[f] = RED;
        //muffin.pixels[g] = RED;
        //muffin.pixels[h] = RED;
        //muffin.pixels[i] = RED;
      }

    }//end for X
  }//end for Y
}//end grow times

color blended;

for(int index = 0; index < (W*H); index++){
  if(muffin.pixels[index] == RED){

    color c = muffinB.pixels[index];

    float r = red(c);
    float g = green(c);
    float b = blue(c);
    float h = hue(c);
    float s = saturation(c);
    float br = brightness(c);
    muffin.pixels[index] = color(r-15,g+30,b-10);
  }
}

for(int i = 0; i < H*W; i++){
  if(binArray[i] == 1){
    binArray[i] = 0;
  }
  else{
    binArray[i] = 1;
  }
  muffinC.pixels[i] = binArray[i];
}


muffinC.mask(binArray);

muffinB.updatePixels();
image (muffinB,0,0);

muffin.updatePixels();
image (muffin,0,H);

muffinC.updatePixels();
image (muffinC,0,H);



