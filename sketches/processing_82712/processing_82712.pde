
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/25443*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Name: reem el-ballouli
// description: allows you to explore a magnified portion of an image

int factor = 2; // maginifing factor
int lens_width = 150; // lens width

void setup()
{
  size(500,400);
  smooth();
}
void draw(){}
void mouseMoved()
{
   background(255);
   // resample the image and replicate it using a method replicate
   PImage replici = replicate(factor);
   PImage origin = loadImage("night_obs.gif");
   
   PGraphics pg = createGraphics(replici.width, replici.height, P2D);
   int x = int(map(mouseX, 0, origin.width, 0, replici.width)); // store the mapping position (x,y) of magnified image
   int y = int(map(mouseY, 0, origin.height, 0, replici.height));
   
   // render the lens shape off screen and use it as an alpha mask to the replicated image
   pg.beginDraw();
   pg.background(0);
   pg.fill(255);
   pg.ellipse(x, y, lens_width, lens_width);
   pg.endDraw();
   
   replici.mask(pg);  
   // display original unmagnified image 
   image(origin, 0, 0);
   // setting and drawing lens.
   strokeWeight(2);
   stroke(0);
   noFill();
   ellipse(mouseX, mouseY, lens_width, lens_width);
   // display replici on correct position over original image
   image(replici, -mouseX * (factor-1), -mouseY * (factor-1));
}
//................................................................................replication.....................................................................................
PImage replicate(int factor)
{
   PImage origin = loadImage("night_obs.gif");
   PImage replicate = createImage(origin.width * factor, origin.height * factor, RGB);
   
   origin.loadPixels();
   replicate.loadPixels();
   for(int row = 0; row < origin.height; row++)
   {
     for(int col = 0; col < origin.width; col++)
     {
       color c = color(red(origin.pixels[row * origin.width + col]), green(origin.pixels[row * origin.width + col]), blue(origin.pixels[row * origin.width + col]));
       int ii = row * factor; // mapping of row from unreplicated image to replicated image
       int jj = col * factor; // mapping of column from unreplicated image to replicated image
       int row_limit = ii + factor; // defines the row limit of new replicated block
       int col_limit = jj + factor; // defines the column limit of new replicated block
       
       // loop over the assigned block and copy the pixel color to whole of block
       for(int i = row * factor ; i < row_limit; i++)
       {
         for(int j = col * factor; j < col_limit; j++)
         {
           replicate.pixels[i * replicate.width + j] = c;
         }
       }
     }
   } 
   origin.updatePixels();
   replicate.updatePixels();
   
   return replicate;
}
void keyPressed()
{
  if(key == 'r')
    factor++;
  else if(key == 'f')
    factor--;
  else if(key == 'e')
    lens_width += 5;
  else if(key == 'd')
    lens_width -= 5;
    
 mouseMoved();
}

