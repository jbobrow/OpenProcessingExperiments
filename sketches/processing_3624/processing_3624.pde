
/**
 * Plane Deformation Demo Effect
 * by luis2048. 
 * 
 * 2D plane deformations using lookup tables was a great
 * way to get smooth animations of complex calculations 
 * running on slower processors. These effects were very 
 * common in the 90s demoscene. 
 *
 * The idea was to take a texture and deform it using a 
 * pre-calculated math reference table. Different formulas 
 * gave different effects such as fake 3d tunnels, wormholes
 * and landscapes.
 * 
 * Press 1-9 to see different effects
 * 
 * Based on formulas by Inigo Quilez:
 * http://iquilezles.org/www/material/deform/deform.htm
 *
 */
PGraphics deformationEffect;
PImage textureImg;

int w, h;
int[] mLUT;

void setup(){
  // set canvas size
  size(600,400);

  // create off-screen buffer
  deformationEffect = createGraphics(300, 200, JAVA2D);
  w = deformationEffect.width;
  h = deformationEffect.height;

  // create math lookup table(LUT) array
  mLUT =  new int[3 * w * h];

  // load texture 
  textureImg=loadImage("tex5_512.jpg"); // use higher resolution textures if things get to pixelated

  // populate look up table with deformation effect
  createLUT(9);
}

// fill math lookup table values with crazy values
void createLUT(int effectStyle){
  // increment placeholder
  int k = 0;

  // u and v are euclidean coordinates  
  float u,v,bright = 0; 

  for( int j=0; j < h; j++ )
  {
    float y = -1.00 + 2.00*(float)j/(float)h;
    for( int i=0; i < w; i++ )
    {
      float x = -1.00 + 2.00*(float)i/(float)w;
      float d = sqrt( x*x + y*y );
      float a = atan2( y, x );
      float r = d;
      switch(effectStyle) {
      case 1:   // stereographic projection / anamorphosis 
        u = cos( a )/d;
        v = sin( a )/d;
        bright = -10 * (2/(6*r + 3*x));
        break;
      case 2:  // hypnotic rainbow spiral
        v = sin(a+cos(3*r))/(pow(r,.2));
        u = cos(a+cos(3*r))/(pow(r,.2));
        bright = 1;
        break;
      case 3:  // rotating tunnel of wonder
        v = 2/(6*r + 3*x);
        u = a*3/PI;
        bright = 15 * -v;
        break;
      case 4:  // wavy star-burst
        v = (-0.4/r)+.1*sin(8*a);
        u = .5 + .5*a/PI;
        bright=0;
        break;
      case 5:  // hyper-space travel
        u = (0.02*y+0.03)*cos(a*3)/r;
        v = (0.02*y+0.03)*sin(a*3)/r;
        bright=0;
        break;
      case 6:  // five point magnetic flare
        u = 1/(r+0.5+0.5*sin(5*a));
        v = a*3/PI;
        bright = 0;
        break;
      case 7:  // cloud like dream scroll
        u = 0.1*x/(0.11+r*0.5);
        v = 0.1*y/(0.11+r*0.5);
        bright=0;
        break;
      case 8:  // floor and ceiling with fade to dark horizon
        u = x/abs(y);
        v = 1/abs(y);
        bright = 10* -v;
        break;
      case 9:  // hot magma liquid swirl
        u = 0.5*(a)/PI;
        v = sin(2*r);
        bright = 0;
        break;
      case 10:  // clockwise flush down the toilet
        v = pow(r,0.1);
        u = (1*a/PI)+r;
        bright=0;
        break;
      case 11:  // 3D ball
        v = x*(3-sqrt(4-5*r*r))/(r*r+1);
        u = y*(3-sqrt(4-5*r*r))/(r*r+1);
        bright = 7 * -18.7*(x+y+r*r-(x+y-1)*sqrt(4-5*r*r)/3)/(r*r+1);
        break;
      default:  // show texture with no deformation or lighting
        u = x;
        v = y;
        bright = 0;
        break;
      }
      mLUT[k++] = int(textureImg.width*u) & textureImg.width-1;
      mLUT[k++] = int(textureImg.height*v) & textureImg.height-1;
      mLUT[k++] = int(bright);
    }
  }
}

void draw() {
  int timeDisplacement = frameCount;

  deformationEffect.beginDraw();
  deformationEffect.loadPixels();

  // for every frame, go through every pixel and use the reference table (mLUT) to get which pixel of the texture it should draw at the current pixel.
  for (int pixelCount = 0; pixelCount < deformationEffect.pixels.length; pixelCount++)
  {
    int o = (pixelCount << 1) + pixelCount;  // equivalent to 3 * pixelCount
    int u = mLUT[o+0] + timeDisplacement;    // to look like its animating, add timeDisplacement
    int v = mLUT[o+1] + timeDisplacement;
    int adjustBrightness = mLUT[o+2];

    // get the R,G,B values from texture
    color currentPixel = textureImg.pixels[textureImg.width * (v & textureImg.height-1) + (u & textureImg.width-1)];

    // only apply brightness if it was calculated
    if (adjustBrightness != 0) {       
      float r,g,b;

      // disassemble pixel using bit mask to remove color components for greater speed
      r = currentPixel >> 16 & 0xFF;  // equivalent to red(currentPixel);
      g = currentPixel >> 8 & 0xFF;   // equivalent to green(currentPixel);
      b = currentPixel & 0xFF;        // equivalent to blue(currentPixel);      

      // make darker or brighter
      r += adjustBrightness;
      g += adjustBrightness;
      b += adjustBrightness;

      // constrain RGB to make sure they are within 0-255 color range
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);

      // reassemble colors back into pixel
      currentPixel = color(r,g,b);
    }

    // put texture pixel on buffer screen
    deformationEffect.pixels[pixelCount] = currentPixel;
  }
  deformationEffect.updatePixels();
  deformationEffect.endDraw();

  // display the results
  image(deformationEffect, 0, 0, width, height); 
}

// pressing keyboard number keys(1-9) will switch between different effects
void keyTyped() {
  switch(key) {
  case 49: // 1 key
    textureImg=loadImage("tex4_128.jpg");
    createLUT(1);
    break;
  case 50: // 2 key
    textureImg=loadImage("tex2_256.jpg");
    createLUT(2);
    break;
  case 51: // 3 key
    textureImg=loadImage("tex1_256.jpg");
    createLUT(3);
    break;
  case 52: // 4 key
    textureImg=loadImage("tex2_512.jpg");
    createLUT(4);
    break;
  case 53: // 5 key
    textureImg=loadImage("tex3_512.jpg");
    createLUT(5);
    break;
  case 54: // 6 key
    textureImg=loadImage("tex4_128.jpg");
    createLUT(6);
    break;
  case 55: // 7 key
    textureImg=loadImage("tex2_512.jpg");
    createLUT(7);
    break;
  case 56: // 8 key
    textureImg=loadImage("tex1_128.jpg");
    createLUT(8);
    break;
  case 57: // 9 key
    textureImg=loadImage("tex5_512.jpg");
    createLUT(9);
    break;
  default: // any other key
    textureImg=loadImage("tex5_512.jpg");
    createLUT(0);
    break;
  }
}


