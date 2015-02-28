
/**
 * <p>'Wormhole' demo effect</p>
 * 
 * A funnel-shaped hole sucking its texture to the middle.<br/>
 * The effect is accomplished like the tunnel effect but this time with a 15 x 15 texture and static lookup table (wormhole.gif or calculated array).<br/>
 * The texture is shifted and mapped to the static lookup table. One of the most famous demos 
 * that has a worm effect is Unreal by future crew.
 * 
 * Press [1] - [9] to load new textures
 * Press arrow keys to change direction
 * [s] will stop animation
 *
 * <p>http://luis.net/projects/processing/wormhole/</p>
 *  
 */

PGraphics wormEffect,wormImg,wormTexture,wormTexture2;
int[] reg = new int[15];
int[] reg2 = new int[15];

// initial direction of wormhole spin (-5 to 5)
int directionX = 1; 

// initial direction of wormhole suck (-5 to 5)
int directionY = -1;

void setup(){
  size(640, 480);
  noSmooth();
  frameRate(30);
  colorMode(RGB);

  wormImg = createGraphics(320, 240, JAVA2D);
  wormTexture = createGraphics(15, 15, P2D);
  wormTexture2 = createGraphics(15, 15, P2D);  

  // procedurally generated reference image used to transpose texture
  int SPOKES = 2400;
  float[] spokeCalc = new float[SPOKES];
  float[] spokeCosCalc = new float[SPOKES];
  float[] spokeSinCalc = new float[SPOKES];

  float x,y,z;
  float divCalcX,divCalcY;

  // make it suck in the middle
  int XCENTER = wormImg.width/2;
  int YCENTER = wormImg.height/2 - wormImg.height/4;
  int DIVS = SPOKES/2;

  // speed up render time by using lookup tables
  for(int i=0;i<SPOKES;i++) {
    spokeCalc[i] = 2*PI*i/SPOKES;
    spokeCosCalc[i] = cos(spokeCalc[i]);
    spokeSinCalc[i] = sin(spokeCalc[i]);
  }
  wormImg.loadPixels();

  for(int j=1;j<DIVS+1;j++){
    z=-1.0+(log(2.0*j/DIVS));
    divCalcX = float(wormImg.width)*j/DIVS;
    divCalcY = float(wormImg.height)*j/DIVS;
    for(int i=0;i<SPOKES;i++) {
      x=divCalcX*spokeCosCalc[i];
      y=divCalcY*spokeSinCalc[i];

      // this creates the downward curve in the center
      y=y-25*z; 

      // start circling outwards from center
      x+=XCENTER;
      y+=YCENTER;

      // only place pixels within the range of the wormImg resolution
      if ((x>=0)&&(x<=wormImg.width)&&(y>=0)&&(y<=wormImg.height))
      {
        wormImg.pixels[int(x)+int(y)*wormImg.width] = color((i/8)%wormTexture.width)+wormTexture.width*((j/6)%wormTexture.width);
      }
    }
  }
  wormImg.updatePixels();

  // load prerendered reference image used to transpose texture - fast start (same as above)
  /*
  wormImg.beginDraw();   
   wormImg.image(loadImage("wormhole.png"),0,0);
   wormImg.endDraw();
   */

  // 15 x 15 texture image array
  wormTexture.image(loadImage("texture0.gif"),0,0);
  wormTexture2.image(loadImage("texture1.gif"),0,0);

  // buffered offscreen image for union of wormImg and wormTexture
  wormEffect = createGraphics(wormImg.width, wormImg.height,P2D);

}

// image blend steps. lower = more gradual
float stage = .05;

// Morph one colour to the other. If the start color is greater than the stop colour, start color will
// be decremented till it reaches the stop color. If it is lower, it will incremented.
float rgb(float a,float b,float i){
  if (a < b) {
    a += i;
    if(a > b) a = b; // if we have overshot our target, make it equal - or it won't stop.
  }
  else if(a > b) {
    a -= i;
    if(a < b) a = b; // ditto
  }
  return a;
}

// moves the bottom row of pixels to the top and shifting remaining pixels down
void shiftup(){
  for (int i = directionY; i < 0; i++){
    for(int k=0;k<wormTexture.height;k++)
    {
      reg[k]=wormTexture.pixels[k];
      reg2[k]=wormTexture2.pixels[k];
    }
    for(int k=15;k<15*15;k++)
    {
      wormTexture.pixels[k-15]=wormTexture.pixels[k];
      wormTexture2.pixels[k-15]=wormTexture2.pixels[k];
    }
    for(int k=0;k<15;k++)
    {
      wormTexture.pixels[k+210]=reg[k];
      wormTexture2.pixels[k+210]=reg2[k];
    }
  }
}

// moves right column of pixels to the left and shift remaining pixels 1 over to the right
void shiftright(){
  int k,i;
  for (int j = 0; j < directionX; j++){
    for(k=0;k<15;k++)
    {
      reg[k]=wormTexture.pixels[15*k+14];
      reg2[k]=wormTexture2.pixels[15*k+14];
      for(i=14;i>0;i--)
      {
        wormTexture.pixels[15*k+i]=wormTexture.pixels[15*k+(i-1)];
        wormTexture2.pixels[15*k+i]=wormTexture2.pixels[15*k+(i-1)];
      }
      wormTexture.pixels[15*k]=reg[k];
      wormTexture2.pixels[15*k]=reg2[k];
    }
  }
}

// moves left column of pixels to the right and shift remaining pixels 1 over to the left
void shiftleft(){
  int k,i;
  for (int j = directionX; j < 0; j++){
    for(k=0;k<15;k++)
    {
      reg[k]=wormTexture.pixels[15*k];
      reg2[k]=wormTexture2.pixels[15*k];
      for(i=0;i<14;i++)
      {
        wormTexture.pixels[15*k+i]=wormTexture.pixels[15*k+(i+1)];
        wormTexture2.pixels[15*k+i]=wormTexture2.pixels[15*k+(i+1)];
      }
      wormTexture.pixels[15*k+14]=reg[k];
      wormTexture2.pixels[15*k+14]=reg2[k];
    }
  }
}

// moves the top row of pixels to the bottom and shift remaining pixels up
void shiftdown(){
  int k;
  for (int i = 0; i < directionY; i++){
    for(k=0;k<wormTexture.height;k++)
    {
      reg[k]=wormTexture.pixels[k+210];
      reg2[k]=wormTexture2.pixels[k+210];
    }
    for(k=209;k>=0;k--)
    {
      wormTexture.pixels[k+15]=wormTexture.pixels[k];
      wormTexture2.pixels[k+15]=wormTexture2.pixels[k];
    }
    for(k=0;k<15;k++)
    {
      wormTexture.pixels[k]=reg[k];
      wormTexture2.pixels[k]=reg2[k];
    }
  }
}

void draw()
{
  // transition into other texture.
  if (stage <20) // this skips transition blend after texture has already morphed into destination texture
  {
    for(int i=0;i<wormTexture.pixels.length;i++)
    {
      color pixelFrom = wormTexture.pixels[i];
      color pixelTo = wormTexture2.pixels[i];
      wormTexture.pixels[i]=color( rgb(red(pixelFrom),  red(pixelTo), stage),  rgb( green(pixelFrom),  green(pixelTo), stage), rgb( blue(pixelFrom),  blue(pixelTo), stage) );    
    }
    stage=stage+0.5;
  }

  // load pixel data array
  wormEffect.loadPixels();

  // loop through all pixels
  for (int i = 0; i < wormEffect.pixels.length; i++){
    // map texture to wormhole in a bit shift blue 
    wormEffect.pixels[i] = wormTexture.pixels[wormImg.pixels[i] & 0xFF];

    // this will show the reference image
    // wormEffect.pixels[i] = wormImg.pixels[i];  

  }  
  wormEffect.updatePixels();

  shiftdown();
  shiftup();
  shiftright();
  shiftleft();

  // display the results
  image(wormEffect,0,0,width,height); 

  // show texture being mapped to wormhole
  // image(wormTexture,10,10,wormTexture.width*3,wormTexture.height*3); 
}

// pressing keyboard arrow keys will make wormhole do tricks 
void keyPressed() { 
  switch(keyCode) { 
  case UP:
    directionY++;
    break; 
  case DOWN:
    directionY--;
    break; 
  case LEFT:
    directionX--;
    break; 
  case RIGHT:
    directionX++;
    break; 
  case KeyEvent.VK_S:  // stop animating texture with "S" key
    directionX=0;
    directionY=0;
    break; 
  case KeyEvent.VK_1:  // load different texture using number keys 1-6
    stage = .05;
    wormTexture2.image(loadImage("texture1.gif"),0,0);
    break; 
  case KeyEvent.VK_2:  
    stage = .05;
    wormTexture2.image(loadImage("texture2.gif"),0,0);
    break; 
  case KeyEvent.VK_3:  
    stage = .05;
    wormTexture2.image(loadImage("texture3.gif"),0,0);
    break; 
  case KeyEvent.VK_4:  
    stage = .05;
    wormTexture2.image(loadImage("texture4.gif"),0,0);
    break; 
  case KeyEvent.VK_5:  
    stage = .05;
    wormTexture2.image(loadImage("texture5.gif"),0,0);
    break; 
  case KeyEvent.VK_6:  
    stage = .05;
    wormTexture2.image(loadImage("texture6.gif"),0,0);
    break; 
  case KeyEvent.VK_7:  
    stage = .05;
    wormTexture2.image(loadImage("texture7.gif"),0,0);
    break; 
  case KeyEvent.VK_8:  
    stage = .05;
    wormTexture2.image(loadImage("texture8.gif"),0,0);
    break; 
  case KeyEvent.VK_9:  
    stage = .05;
    wormTexture2.image(loadImage("texture9.png"),0,0); // fade to white
    break; 
  case KeyEvent.VK_0:  
    stage = .05;
    wormTexture2.image(loadImage("texture0.gif"),0,0); // fade to black
    break; 
  default: // any other key 
    break; 
  }

  // prevent from going too fast
  directionY = constrain(directionY,-5,5);
  directionX = constrain(directionX,-5,5);
} 





