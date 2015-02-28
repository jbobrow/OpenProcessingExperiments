
/*

 Name      :  Fire /w Perlin Noise
 Notes     :  Flames rising up the screen
 
 The fire effect has been used quite often for oldskool demos.
 First you create a palette of 256 colors ranging from red to
 yellow (including black). For every frame, calculate each row
 of pixels based on the two rows below it: The value of each pixel,
 becomes the sum of the 3 pixels below it (one directly below, one
 to the left, and one to the right), and one pixel directly two
 rows below it. Then divide the sum so that the fire dies out
 as it rises.
 
 */

// size of fire effect
int w=960/2;
int h=540/2;

int[] fire_buffer;  // effect goes here
int[] flame_palette; // flame colors
int[] tile;    // perlin noise lookup table

int widthLeft;
int widthRight;
int fire_length;

PImage img;
PGraphics effect;

private void copyArea(PGraphics from, PGraphics to,int x,int y, int width3, int height3,int dx,int dy)
{
  PImage cp = from.get(x,y,width3,height3);
  to.image(cp,x+dx,y+dy);
}

void setup() {

  size (480, 270);  
  effect = createGraphics(w,h,P2D);

  //frameRate(80);


  flame_palette = new int[256];

  widthLeft = w-1;
  widthRight = w+1;

  fire_length = w*h;
  fire_buffer = new int[fire_length+widthRight];

  // generate flame color palette in RGB. need 256 bytes available memory
  for (int i=0; i<64; i++)
  {
    flame_palette[i]  = color(i<<2, 0, 0,i<<3);      // Black to red
    flame_palette[i+64]  = color(255, i<<2, 0); // Red to yellow
    flame_palette[i+128]  = color(255, 255, i<<2); // Yellow to white, 
    flame_palette[i+192]  = color(255, 255, 255);   // White
  }

  //  tile = loadInts("perline_fire_480_256.dat"); 
  tile = makeTile(w,4096); 
  //  saveInts("perline_fire_480_256.dat", tile);
  noSmooth();
  Arrays.fill(fire_buffer,0,fire_length,32);   
}


/**
 * Saves an int array as raw data (Big Endian order)
 * to a file in the sketch folder.
 *
 * @param fname file name
 * @param data int array
 */
void saveInts(String fname, int[] data) {
  try {
    DataOutputStream ds = new DataOutputStream(new FileOutputStream(sketchPath(fname)));
    for(int i=0; i<data.length; i++) ds.writeInt(data[i]);
    ds.flush();
    ds.close();
  } 
  catch(Exception e) {
    e.printStackTrace();
  }
}

/**
 * Loads an int array from a raw data file (Big Endian order)
 * in the sketch folder.
 *
 * @param fname file name
 * @return an int array
 */
int[] loadInts(String fname) {
  int[] data=null;
  try {
    FileInputStream fs = new FileInputStream(sketchPath(fname));
    DataInputStream ds = new DataInputStream(fs);
    data = new int[(int)(fs.getChannel().size()/4)];
    for (int i = 0; i < data.length; i++) data[i] = ds.readInt();
    ds.close();
    fs.close();
  } 
  catch(Exception e) {
    e.printStackTrace();
  }
  return data;
} 

void draw() {

  // look up table - should be fastest
  arrayCopy(tile, (frameCount&0xfff)*w, fire_buffer, fire_length,w);  

  // Do the fire calculations for every pixel, from top to bottom
  effect.beginDraw();
  //  effect.loadPixels();

  int currentPixel=0;

  for (int currentPixelIndex =0; currentPixelIndex < fire_length; currentPixelIndex++) {
    // Add pixel values around current pixel
    // Output everything to screen using our palette colors      
    fire_buffer[currentPixelIndex] = currentPixel=
      (((fire_buffer[currentPixelIndex]
      + fire_buffer[currentPixelIndex+widthLeft]
      + fire_buffer[currentPixelIndex+w]
      + fire_buffer[currentPixelIndex+widthRight]))>>2)-1;

    if (currentPixel > 0)
      effect.pixels[currentPixelIndex] = flame_palette[currentPixel];
  }
  effect.endDraw();

  background(0);
  image(effect,0,0);
}

float ns = 0.015;  //increase this to get higher density
float tt = 0; 

// make a seamless tile
int[] makeTile (int w, int h) { 
  //color[] tile = new color[w*h]; 
  int[] tile = new int[w*h]; 

  for (int x = 0; x < w; x++) { 
    int counterr=0;
    for (int y = 0; y < h; y++) { 
      float u = (float) x / w; 
      float v = (float) y / h; 

      double noise00 = noise((x*ns), (y*ns),0); 
      double noise01 = noise(x*ns, (y+h)*ns,tt); 
      double noise10 = noise((x+w)*ns, y*ns,tt); 
      double noise11 = noise((x+w)*ns, (y+h)*ns,tt); 

      double noisea = u*v*noise00 + u*(1-v)*noise01 + (1-u)*v*noise10 + (1-u)*(1-v)*noise11;   

      int value = (int) (255* noisea) &0xFF; 
      // value = ((int) (255* noise((float)(x*ns), (float)(counterr++*ns),0)));// (int)random(255);    

      int r = value;
      int g = value;
      int b = value;


      if (r > 255) r = 255;
      if (r < 0) r = 0;

      if (g > 255) g = 255;
      if (g < 0) g = 0;

      if (b > 255) b = 255;
      if (b < 0) b = 0;
      tile[x + y*w] = value;//color(r&0xFF,g&0xFF,b&0xFF); 
    } 
  } 
  return tile; 
} 


