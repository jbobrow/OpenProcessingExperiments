
PImage bgImage; // reserve some memory for images

int imageNumber = 0; // the number of the current image

int numberOfImages = 34; // the total number of images

void setup()
{
  size(480,720);
  
  //load the first image into the memory
  bgImage = loadImage("Homepage.gif");
}

void draw() 
{
  //draw the image to the screen
  image(bgImage, 0, 0,width, height);
}


// the function that runs when the mouse is pressed
void mousePressed()
{
   // add 1 to the imageNumber to move onto another random image
   imageNumber = floor(random(1,35));//imageNumber + 1;
   
   // if the number goes above the total number of images
   if (imageNumber >= numberOfImages) 
   {
     // reset image number to one
     imageNumber = 1;
   }
   
   //load the new image to the memory
   bgImage = loadImage("DW" + imageNumber +".gif"); 
}

