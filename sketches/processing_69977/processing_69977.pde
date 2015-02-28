
int x, y, radius, l;
PGraphics tunnelEffect;
PImage textureImg;
 
// build lookup table
int[][] distanceTable;
int[][] angleTable;
int[][] shadeTable;
int w, h;
PFont f;
 
 
void setup() {
  size(351, 216, P3D);
   
   
  // Load texture 351 x 216
  textureImg = loadImage("image2.jpg");
  textureImg.loadPixels();
  
   
   
  // Create buffer screen
  tunnelEffect = createGraphics(320, 200, P3D);
  w = tunnelEffect.width;
  h = tunnelEffect.height;
 
  float ratio = 32.0;
  int angle;
  int depth;
  int shade = 0;
 
  // Make the tables twice as big as the screen.
  // The center of the buffers is now the position (w,h).
  distanceTable= new int[2 * w][2 * h];
  angleTable= new int[2 * w][2 * h];
 
  for (int x = 0; x < w*2; x++)
  {
    for (int y = 0; y < h*2; y++)
    {
      depth = int(ratio * textureImg.height
                  / sqrt(float((x - w) * (x - w) + (y - h) * (y - h)))) ;
      angle = int(0.5 * textureImg.width * atan2(float(y - h),
                  float(x - w)) / PI) ;
 
      // The distance table contains for every pixel of the
      // screen, the inverse of the distance to the center of
      // the screen this pixel has.
      distanceTable[x][y] = depth ;
 
      // The angle table contains the angle of every pixel of the screen,
      // where the center of the screen represents the origin.
      angleTable[x][y] = angle ;
    }
  }  
}
 
 
void draw() {
 
  tunnelEffect.beginDraw();
  tunnelEffect.loadPixels();
 
 
  float timeDisplacement = millis() / 1000.0;
 
  // Calculate the shift values out of the time value
  int shiftX = int(textureImg.width * .2 * timeDisplacement+300); // speed of zoom
  int shiftY = int(textureImg.height * .15 * timeDisplacement+300); //speed of spin
 
  // Calculate the look values out of the time value
  // by using sine functions, it'll alternate between
  // looking left/right and up/down
  int shiftLookX = w / 2 + int(w / 4 * sin(timeDisplacement));
  int shiftLookY = h / 2 + int(h / 4 * sin(timeDisplacement * 1.5));
 
  for (int y = 0; y < h; y++)  {
    for (int x = 0; x < w; x++)      {
       
      // Make sure that x + shiftLookX never goes outside
      // the dimensions of the table
      int texture_x = constrain((distanceTable[x + shiftLookX][y + shiftLookY]
                                 + shiftX) % textureImg.width ,0, textureImg.width);
       
      int texture_y = (angleTable[x + shiftLookX][y + shiftLookY]
                       + shiftY) % textureImg.height;
       
      tunnelEffect.pixels[x+y*w] = textureImg.pixels[texture_y
                         * textureImg.width + texture_x];
 
      // Test lookuptables
      // tunnelEffect.pixels[x+y*w] = color( 0,texture_x,texture_y);
    }
  }
 
  tunnelEffect.updatePixels();
  tunnelEffect.endDraw();
 
  // Display the results
  image(tunnelEffect, 0, 0, width, height);
   
 
}


