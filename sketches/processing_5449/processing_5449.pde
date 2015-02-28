
int[][] tex = new int[256][256];

float[][] ftex = new float[256][256];

int noiseWidth = 128;
int noiseHeight = 128;

int[][] distanceTable;
int[][] angleTable;
int[][] buffer;
int w = 320;
int h = 200;
   
void setup()
{
    size(w,h,P2D);

    smooth();
    distanceTable = new int[width*2][height*2];
    angleTable= new int[width*2][height*2];
    
     
    
    //generate texture
    for(int x = 0; x < 256; x++)
    for(int y = 0; y < 256; y++)
    {
      // turbulenced texture
        tex[x][y] = (int)(turbulence(x, y, 64));
       
        // nasty smooth noise generated texture  
        //  tex[x][y] = (int)(256 * smoothNoise(x / 8.0, y / 8.0));
       
       // simple XOR texture
       // tex[x][y] = (x * 256 / 256) ^ (y * 256 / 256);
       
    }
    
  
    //generate non-linear transformation table
    for(int x = 0; x < w * 2; x++)
    for(int y = 0; y < h * 2; y++)
    {
        int angle, distance;
        float ratio = 32.0;
        distance = int(ratio * 256 / sqrt(float((x - width) * (x - width) + (y - height) * (y - height)))) % 256;
        angle = (int)(0.4 * 256 * atan2(float(y - height), float(x - width)) / PI);
  
        distanceTable[x][y] = distance;
        angleTable[x][y] = angle;
    }
   
}



void draw()
{
  	loadPixels();


        //animation = getTime() / 1000.0;
        float anim = millis() / 1000.0;
      
        //int shiftX = int(256 * 1.0 * (mouseX * 0.001));
        // int shiftY = int(256 * 0.25 * (mouseY * 0.001));        
       int shiftX = int(256 * 1.0 * anim);
       int shiftY = int(256 * 0.25 *  anim);        
       
        //int shiftLookX = w / 2 + int(w / 2 * sin(mouseX*0.01));
        //int shiftLookY = h / 2 + int(h / 2 * sin(mouseY * 0.01 * 2.0));
        
        int shiftLookX = w / 2 + int(w / 2 * sin(anim));
        int shiftLookY = h / 2 + int(h / 2 * sin(anim * 2.0));
       
        
        for(int x = 0; x < w; x++)
        for(int y = 0; y < h; y++)
        {        
           int cx = (int)(distanceTable[x + shiftLookX][y + shiftLookY] + shiftX)  % 256;
           int cy = (int)(angleTable[x + shiftLookX][y + shiftLookY] + shiftY) % 256;
           if (cy<0) cy = cy * -1; //quick fix!
           
           pixels[x+y*width] = color(tex[cx][cy], tex[cx][cy] * ( mouseX *0.001) , tex[cx][cy] * ( mouseY * 0.001));
        
       //    pixels[x+y*width] = tex[cx][cy];  
        }
      
     
        updatePixels();      
         
}

// we make the texture smoooooother with bilinear interpolation
float smoothNoise(float x, float y)
{  
   //get fractional part of x and y
   float fractX = x - int(x);
   float fractY = y - int(y);
   
   
   //wrap around
   int xx = int(x);
   int yy = int(y);
   int x1 = (xx + noiseWidth) % noiseWidth;
   int y1 = (yy + noiseHeight) % noiseHeight;
   
   //neighbor values
   int x2 = (x1 + noiseWidth - 1) % noiseWidth;
   int y2 = (y1 + noiseHeight - 1) % noiseHeight;

   //smooth the noise with bilinear interpolation
   float value = 0.0;
   value += fractX       * fractY       * noise(x1,y1);
   value += fractX       * (1 - fractY) * noise(x1,y2);
   value += (1 - fractX) * fractY       * noise(x2,y1);
   value += (1 - fractX) * (1 - fractY) * noise(x2,y2);

   return value;
}

float turbulence(float x, float y, float size)
{
    float value = 0.0, initialSize = size;
    
    while(size >= 1)
    {
        value += smoothNoise(x / size, y / size) * size;
        size /= 2.0;
    }
    
    return(128.0 * value / initialSize);
}


