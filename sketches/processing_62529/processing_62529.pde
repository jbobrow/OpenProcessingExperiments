
/*
 *   Sierpinski Carpet 
 *   by Martin Pasko
 */

// width of big block
int blockWidth = 600;

void setup()
{
  size(blockWidth,blockWidth);  // size of screen
  background(0);
 // stroke(255);
  noLoop();
}

/* Make Sierpinski Carpet
 * params: x - screen x coordinate
 *         y - screen y coordinate
 *         sideWidth - width of  'one' chunk
 *         level - how deep carpet must be drawn
 */
void carpet(float x, float y, float sideWidth, int level)
{
    // 1. Divide big block by 3. This variable has width of one small rectancle in big one
    float block = sideWidth / 3 ;
     
    // go through each small block...
    if ( level > 0 && level <= 6)
    { 
      for (int i = 0; i < 3; ++i)      // rows
      {
        for (int j = 0; j < 3; ++j)    // cols
        {
          // ... is it middle block?
          if (i == 1 && j == 1)        
          {
            //     stroke(0);
            //  set color to white..
            fill(255);
            // ... and draw rectangle on middle of block
            rect(x + (block * i), y + (block *j) , block, block);
            // ... and go to the next j iteration
            continue;
          }
          // ...otherwise
          else
          {
           // stroke(255);
            // ... set color to black
            fill(0);
        
          }
          // draw the rectangle...
          rect(x + (block * i), y + (block *j) , block, block);
          // and call again carpet function, but with decremented level for drawing small rectangles 
          carpet(x + (block * i), y + (block *j), block, level-1);
        }
      }
    }    
}

void draw()
{
  // draw carpet           level
  carpet(0, 0, blockWidth, 6);
  // and next colour carpet
  colour();
}

// Colour the carpet
void colour()
{
  /*
   * x - screen x coordinate
   * y - screen y coordinate
   * r - red color
   * g - green color
   * b - blue color
   * loc - is a location of pixel 
   */
  int x, y, r, g, b, loc;
  
  // loading pixels array
  loadPixels();
  for (y = 0; y < height; ++y)  // y - rows
  {
    for (x = 0; x < width; ++x)  // x - cols
    {
      // calculating the location of pixel
      // x - cols, y - rows, width - width of rows
      loc = x + y * width;
      
      // Each pixel is an 32 bit value.
      // paradigm in HEX is:
      //             0xAARRGGBB
      // where:
      //   AA - alpha channel; 00 - transparent, FF - no transparent
      //   RR - red color;   from 00 to FF   (0 - 255 in DEC)
      //   GG - green color; from 00 to FF   (0 - 255 in DEC)
      //   BB - blue color;  from 00 to FF   (0 - 255 in DEC)
      
      // if pixel is black...
      if (pixels[loc] == 0xff000000)
      {
        // calculate new color
        r = (255 * x) / (width - 1);
        g = (255 * y) / (height - 1);
        b =  255 -(255 * x * y) / (width - 1) / (height - 1);
        
        // first color scheme is:  
        //   b, g, r  for black
        //   r, b, g  for white
        // second:
        //   r, g, b  for black
        //   b, r, g  for white
          
        // ... and change the black color on new calculated color;
        pixels[loc] = (0xff << 24) | (r << 16) | (g << 8) | (b << 0);
        // if you don't understand code above you can use this:
        //   color newColor = color(r,g,b);
        //   pixels[loc] = (int)newColor;  
      }
      // .. else if color is white
      else if (pixels[loc] == 0xffffffff)
      {
        // calculate new color
        b = (255 * x) / (width - 1);
        r = (255 * y) / (height - 1);
        g = 255 -(255 * x * y) / (width - 1) / (height - 1);
        
        // ... and change the white color on new calculated color; 
        pixels[loc] = (0xff << 24) | (r << 16) | (g << 8) | (b << 0);
        // if you don't understand code above you can use this:
        //   color newColor = color(r,g,b);
        //   pixels[loc] = (int)newColor;  
      }
    }
  }
  updatePixels();  // and update pixels
  
}

