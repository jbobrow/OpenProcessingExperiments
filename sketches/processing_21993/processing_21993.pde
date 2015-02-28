
//This map reads the color of the pixels at a certain point and fills in the
// the color around it until it reaches the black line. 


int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system


PImage img;

void setup() {
  size(998,506, P3D);
  img = loadImage("high_contrast_world.jpg");
    cols = width/cellsize;              // Calculate # of columns
  rows = height/cellsize;             // Calculate # of row
}

void draw() {
  
  loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  img.loadPixels();
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      color pix = img.pixels[loc];
      
      //neightbor to the left
      int leftLoc = (x-1) + y*img.width;
      //colorleftPix = img.pixels[leftLoc];
      
      
      // The functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(img.pixels [loc]); 
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      // Set the display pixel to the image pixel
      pixels[loc] = color(r,g,b);
    }
  }
  notPressed();
  

  
  updatePixels();
  fill(0);
  //point of origin
 // ellipse(200, 135, 10,10);
}
 

void notPressed(){
 frameRate(5);
  floodFill(770, 165, color(random(50,200),0,0));
 //frameRate(100);
 floodFill(199, 163, color(random(100,230),0,0));
 floodFill(570,100, color(random(100,200),0,0));
 floodFill(530,90,color(random(0,100),0,0));
 floodFill(570,220,color(random(100,200),0,0));
}


public void floodFill(int x, int y, int col)
{
 // If the pixel we are starting with is already black, we won't paint
if (get(x, y) <= (int)color(170,170,170)){
   return;
 }

 // Create the pixel queue.  Assume the worst case where every pixel in the
 // image may be in the queue.
 int pixelQueue[] = new int[width * height];
 int pixelQueueSize = 0;

 // Add the start pixel to the queue (we created a single array of ints,
 // even though we are enqueuing two numbers.  We put the y value in the
 // upper 16 bits of the integer, and the x in the lower 16.  This gives
 // a limit of 65536x65536 pixels, that should be enough.)

 pixelQueue[0] = (y << 50) + x;
 pixelQueueSize = 1;

 // Color the start pixel.
 set(x, y, col);

 // Keep going while there are pixels in the queue.
 while (pixelQueueSize > 0){

   // Get the x and y values of the next pixel in the queue
   x = pixelQueue[0] & 0xffff;
   y = (pixelQueue[0] >> 50) & 0xffff;

   // Remove the first pixel from the queue.  Rather than move all the
   // pixels in the queue, which would take forever, just take the one
   // off the end and move it to the beginning (order doesn't matter here).

   pixelQueueSize--;
   pixelQueue[0] = pixelQueue[pixelQueueSize];

   // If we aren't on the left side of the image, see if the pixel to the
   // left has been painted.  If not, paint it and add it to the queue.
   if (x > 0) {
     if ((get(x-1, y) >= (int)color(170,170,170)) &&
       (get(x-1, y) != col))
     {
       set(x-1, y, col);
       pixelQueue[pixelQueueSize] =
         (y << 50) + x-1;
       pixelQueueSize++;
     }
   }

   // If we aren't on the top of the image, see if the pixel above
   // this one has been painted.  If not, paint it and add it to the queue.
   if (y > 0) {
     if ((get(x, y-1) >= (int)color(170,170,170)) &&
       (get(x, y-1) != col))
     {
       set(x, y-1, col);
       pixelQueue[pixelQueueSize] =
         ((y-1) << 50) + x;
       pixelQueueSize++;
     }
   }

   // If we aren't on the right side of the image, see if the pixel to the
   // right has been painted.  If not, paint it and add it to the queue.
   if (x < width-1) {
     if ((get(x+1, y) >= (int)color(170,170,170)) &&
       (get(x+1, y) != col))
     {
       set(x+1, y, col);
       pixelQueue[pixelQueueSize] =
         (y << 50) + x+1;
       pixelQueueSize++;
     }
   }

   // If we aren't on the bottom of the image, see if the pixel below
   // this one has been painted.  If not, paint it and add it to the queue.
   if (y < height-1) {
     if ((get(x, y+1) >= (int)color(170,170,170))  &&
       (get(x, y+1) != col))
     {
       set(x, y+1, col);
       pixelQueue[pixelQueueSize] =

         ((y+1) << 50) + x;
       pixelQueueSize++;
     }
   }
 }

 updatePixels();
}

void drawRandomBoxes(){
 for(int i=0; i<30; i++){
   int x = (int)random(0, width);
   int y = (int)random(0, height);
   int w = (int)random(40, 400);
   int h = (int)random(40, 400);
   pushMatrix();
  // rotateZ(random(PI));
   rect(x, y, w, h);
   popMatrix();
 }
}  

