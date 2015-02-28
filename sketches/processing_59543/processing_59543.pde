
// Garrison LeMasters
// Lo-Res landscape builder
// April 16 2012

// nb there's lots of extra, time-consuming computation in
// here because I wanted to make each step of the process
// transparent.  It could be radically reduced in size.

float realX,cloudX;
float pixelSize,noiseScale;
color mountainColor, skyColor;
color distantColor, farColor;

void setup() {
  size(800,600);
  //n will = 5; n is the y-component of noise location.
       // Arbitrary, but should remain constant.
       // m is the x-component of noise location:
       // it will move forward or back as we
       // move forward or back.
  pixelSize=10; // size of block that represents a pixel
  noiseScale=0.0275;
  // the noiseScale ideally needs to be related to pixelSize, otherwise
  // the mountains will be, e.g., too flat.  But that's for later.
  mountainColor=#E38437;
  distantColor=#F09C16;
  farColor=#E8CE8C;
  skyColor=#6ADAF5;
}

void draw() {
  background(255);
  makeSky();
  // calls:  (noise row #, parallax speed, max mountain height, color)
  buildMountains(0,0.2,500,farColor);   
  buildMountains(1,0.4,400,distantColor); 
  buildMountains(2,1.0,300,mountainColor);   
  // see buildMountains function for explanation.
  realX=sin(frameCount*0.0010)*200;
  // realX is basically a pendulum-like value that swings back + forth
  // between, for all intents and purposes, about -200 and 200.
}



  // (noise row #, parallax speed, max mountain height, color)
void buildMountains(float n, float levelM, float groundMax, color renderColor) {
  // n is our y-constant across the noise plane (Perlin noise)
  // by having it as a constant, we can always rewind or fast-forward
  // the landscape, and have it be the same when we return to that
  // point of origin.
  float loResWidth=width/pixelSize;
  // we're going to count from 0 to loResWidth
  // loResWidth is the imaginary width of our screen
  // at low resolution.
  float loResHeight=groundMax/pixelSize;
  // same thing, but for a low-res version of the maximum
  // height of the mountains.  
  for (float smallX=0;smallX<loResWidth;smallX++) {
    // smallX is actually X, but on a tiny scale.
    // so let's blow it up.
    float x=smallX*pixelSize;
    float actualX=(realX*levelM)+smallX;
    // realX+smallX essentially is the camera position.
    // realX*level yields parallax: The back moves less than front
    float m=actualX*noiseScale; // now scale for noise needs
    float mountainHeight=noise(m,n);
    // computes mountainHeight based on noise, but the result
    // is between 0 and 1.0, so we have to expand it.
    float smallY=mountainHeight*loResHeight;
    // smallY is the compressed height of our block
    float y=floor(smallY);
    // now we round it down and that's the number of blocks high
    // nb "floor" works better than int in this case.
    // the numbers are more consistent.
    y=y*pixelSize;
    // now make it chunky by multiplying by size of pixel block.    
    y=(height-y);
    // flip it upside down because top of screen=0,0
    drawMountainFiller(x,y,renderColor);
    //fill in the space.
  }
}




void drawMountainFiller(float sX, float sY, color objColor) {
  fill(objColor);
  noStroke();
  rect(sX,sY,pixelSize,height-sY);
  // nb instead of just drawing the top of the mountain, this draws a
  // rectangle that fills in the mountain entirely.  To better understand,
  // use this variant instead of the one above:
  //rect(sX,sY,pixelSize-1,height-sY+1);
  
}

void makeSky() {
  fill(skyColor);
  noStroke();
  rect(0,0,width,height);
}

