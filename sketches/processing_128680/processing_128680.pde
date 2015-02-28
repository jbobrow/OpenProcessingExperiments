
/*

 Name      :  Twister
 Notes     :  Twister effects were common in Amiga demos in the late 90s.
              This one features shaded textured sides and a dropshadow.
 */

PImage textureImg[];

int sintab[];
int costab[];

void setup(){
  size(512,512);

  sintab = new int[512];
  costab = new int[512];

  textureImg = new PImage[4];

  textureImg[0]=loadImage("chrome.png");
  textureImg[1]=loadImage("ff.png");
  textureImg[2]=loadImage("ie.png");
  textureImg[3]=loadImage("opera.png");

  for (int i=0; i<512; i++) {
    sintab[i] = (int)(Math.sin(i/512.0*Math.PI*2 )*255+255);
    costab[i] = (int)(Math.cos(i/512.0*Math.PI*2 )*255+255);
  } 
}

void draw() {      
  background(128);

  loadPixels();
  for(int y = 0; y < height; y++)
  {
    int i = (y*width) + (width >> 1)-64 ;
    //int a = frameCount + y & 0x1ff;    
        int a = sintab[frameCount + (y>>2) & 0x1ff];

    for(int n = 0; n < 4; n++)
    {
      int a2 = (a+128)&0x1ff;
      int x1 = sintab[a] >>2;  //increasing number makes twister skinnier
      int x2 = costab[a] >>2;

      int l = x2 - x1;
      if(l > 0)
      {
        x1 += i;
        int u = 0;
        int ui = 0x3FFF / l; // texture pixel length in hex % l

        /* this is for the shadowed edges */
        boolean leftSide = x2 < 109;
        boolean rightSide = (x2 > 107 && l >1);
          for(int x = 11; x > 0; x--){
            int shade =  x*x;

            int pixelL=x1+x-12;   // left side
            int pixelL1=l+x1-x+11; //right side

            if (leftSide)
              pixels[pixelL] = adjustBright(pixels[pixelL],-shade);

             if (rightSide )
              pixels[pixelL1] = adjustBright(pixels[pixelL1],-shade);       
          }

        for(int x = 0; x < l; x++)
        {
         pixels[x1 + x] = adjustBright(textureImg[n].pixels[((x+u>>7)+y*128) & 0x3FFF ],2*l-196);
          u += ui;
        }
      }
      a = a2;
    }
  }
  updatePixels();
}

int adjustBright (int texture, int bright) {
  // disassemble pixel using bit mask to remove color components for greater speed
  int rr = texture >> 16 & 0xFF;  // equivalent to red(currentPixel);
  int gg = texture >> 8 & 0xFF;   // equivalent to green(currentPixel);
  int bb = texture & 0xFF;        // equivalent to blue(currentPixel);                                 

  // make darker or brighter
  rr += bright;
  gg += bright;
  bb += bright;

  // reassemble colors back into pixel
  return color(rr,gg,bb);
}

void keyPressed() {
  println("FPS: " + frameRate);
}


