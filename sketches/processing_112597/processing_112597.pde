
/*

 Retro CRT TV Distortion Effect 
 
 RGB Shifting for random color bleeding
 television scanlines
 random flicker of entire image
 rolling bar
 tv noise static
 turning on fades in image from black
 turning off fades image to white while shrinking it to a horizontal line
 
 */

int w=480;
int h=270;
PImage tvscreen;
PImage TVOverlay;
PImage tvnoise;

int barY1=10;
int barY2=30;


//tv noise
int[] ppx;
int[] px = new int[w];

boolean tvstate = true;


long timeIndexInfo;
long firstCountInfo;

float lerpAmount = 0;
float lerpScale = 0;
float lerpShrink = 0;

int tvheight=0;
int tvwidth=0;

void setup()
{
  size(480, 270, P2D);
  tvscreen=loadImage("obey.png");
  TVOverlay=loadImage("tv.png");

  // precalculate tv noise
  tvnoise = createImage(w,h,RGB);

  tvnoise.loadPixels();
  ppx = new int[tvnoise.pixels.length];
  for (int y = 0; y < ppx.length;)
    ppx[y++] = int(random(-32,32));
  loadPixels();


  tvwidth = w;
  tvheight = h;

  timeIndexInfo = millis();
  firstCountInfo = millis();

  noSmooth();

}

void draw() {
  background(0);
  renderDistort();
  image(TVOverlay, 0, 0);
}

int powerUpCounter = 256;

void scaleIt(float amountA, float amountB, int valueA, int valueB, int valueC, int valueD){
  if (lerpAmount < 1)
  {
    lerpAmount += amountA;
    powerUpCounter = (int)lerp(valueA,valueB,lerpAmount);
  }

  if (lerpScale < 1)
  {
    lerpScale += amountB;
    tvheight = (int)lerp(valueC,valueD,lerpScale);
  }  

  // final horiontal line shrink on power off
  if (!tvstate && tvheight < 100)
  {
    if (lerpShrink < 1)
    {
      tvwidth = (int)lerp(width,1,lerpShrink);
      lerpShrink += .09;

      
      
    }
  }
}

// RGB Distort
void renderDistort() {
  int i = 0;

  int offRed  = (int)(Math.random() * 2) * 2;
  int offGreen= (int)(Math.random() * 2) * 2;
  int offBlue = (int)(Math.random() * 2) * 2;

  if (barY2 > h) {
    barY1=10 -40;
    barY2=30 -40;
  }

  barY1 +=2;
  barY2 +=2;

  if (tvstate)
    scaleIt(0.02,0.2,156,0,2,tvscreen.height);  // turning on 
  else
    scaleIt(0.1,0.2,0,-400,tvscreen.height,1);   // turning off

  // dark vs light flicker + gradual fade in
  int flicker = (offBlue*8)+powerUpCounter; 

  for ( int y = 1; y < h; y++ ) {

    // vertically moving horizonal strip + flicker
    int colDiv = ( y < barY2 && y > barY1 ) ? 20+flicker : flicker; 

    // horizontal scanlines
    int strips=(y&1)*64 +colDiv; 

    // grab a random line of precalculated TV noise
    int noiseLine = int(random(0,height)) * width;

    for ( int x=0; x < w; x++ ) {
      int imagePixelR = tvscreen.pixels[i+offRed] >> 16 & 0xFF ;
      int imagePixelG = tvscreen.pixels[i+offGreen] >> 8 & 0xFF ;
      int imagePixelB = tvscreen.pixels[i+offBlue] & 0xFF ; 
      int processEffect = -strips-ppx[noiseLine+x];
      tvnoise.pixels[i++] =  color(imagePixelR+processEffect, imagePixelG+processEffect, imagePixelB+processEffect);      
    }
  }
  tvnoise.updatePixels();

  //  image(tvnoise,0,0,tvscreen.width,270);




  image(tvnoise,(tvscreen.width-tvwidth/2)-tvscreen.width/2,(tvscreen.height-tvheight/2)-tvscreen.height/2,tvwidth,tvheight);
}

void mousePressed(){
  lerpAmount = 0;
  lerpScale = 0;
  lerpShrink = 0;
  tvstate = !tvstate;
  //tvheight=280;
  tvwidth=width;  
  println(" tvheight: " + tvheight + " tvscreen.height: " + tvscreen.height );
}






