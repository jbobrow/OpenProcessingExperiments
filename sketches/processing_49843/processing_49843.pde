
///// SPIDER GAME /////
/* Uses the OpenCV library from http://ubaa.net/shared/processing/opencv
and code from http://andybest.net/2009/02/processing-opencv-tutorial-2-bubbles
customized by Jennifer Kaye. Spider image from http://www.1freeaday.com/c/20034985/dolls/a/index.html?page=2 */


import hypermedia.video.*;          //  Imports the OpenCV library

OpenCV opencv;                      //  Creates a new OpenCV object
PImage movementImg;                 //  Creates a new PImage to hold the movement image
int poppedBubbles;                  //  Creates a variable to hold the total number of popped bubbles
ArrayList bubbles;                  //  Creates an ArrayList to hold the Bubble objects
PImage bubblePNG;                   //  Creates a PImage that will hold the image of the bubble
PFont font;                         //  Creates a new font object

int direction = 10;

void setup()
{
  size ( 640, 480 );                      //  Window size of 640 x 480
  opencv = new OpenCV( this );            //  Initialises the OpenCV library
  opencv.capture( 640, 480 );             //  Sets the capture size to 640 x 480
  movementImg = new PImage( 640, 480 );   //  Initialises the PImage that holds the movement image
  poppedBubbles = 0;                     
  
  bubbles = new ArrayList();              //  Initialises the ArrayList
  
  
  bubblePNG = loadImage("spider.png");    //  Load the bubble image into memory
//  bubblePNG = loadImage("Donkey-Pinata.png");    //  Load the bubble image into memory

  //font = loadFont("Serif-48.vlw");        //  Load the font file into memory
 // textFont(font, 32);      
  
  bubbles.add(new Bubble (290, -bubblePNG.height, bubblePNG.width, bubblePNG.height));   //  Adds a new bubble to the array with a random x position


}

void draw()
{

//bubbles.add(new Bubble (290, -bubblePNG.height, bubblePNG.width, bubblePNG.height));   //  Adds a new bubble to the array with a random x position


  //bubbles.add(new Bubble( (int)random( 0, width - 40), -bubblePNG.height, bubblePNG.width, bubblePNG.height));   //  Adds a new bubble to the array with a random x position
  
  opencv.read();                              //  Captures a frame from the camera    
  opencv.flip(OpenCV.FLIP_HORIZONTAL);        //  Flips the image horizontally
  image( opencv.image(), 0, 0 );              //  Draws the camera image to the screen
  opencv.absDiff();                           //  Creates a difference image
    
  opencv.convert(OpenCV.GRAY);                //  Converts to greyscale
  opencv.blur(OpenCV.BLUR, 3);                //  Blur to remove camera noise
  opencv.threshold(20);                       //  Thresholds to convert to black and white
  movementImg = opencv.image();               //  Puts the OpenCV buffer into an image object
  
  for ( int i = 0; i < bubbles.size(); i++ ){    //  For every bubble in the bubbles array
    Bubble _bubble = (Bubble) bubbles.get(i);    //  Copies the current bubble into a temporary object
    
    if(_bubble.update() == 1){                  //  If the bubble's update function returns '1' //SPIDERS BEEN TOUCHED
    
      direction = direction * -1;
    //
      //bubbles.remove(i);                        //  then remove the bubble from the array
      //_bubble = null;                           //  and make the temporary bubble object null
      //i--;                                      //  since we've removed a bubble from the array, we need to subtract 1 from i, or we'll skip the next bubble
    
  }else{                                        //  If the bubble's update function doesn't return '1'
      bubbles.set(i, _bubble);                  //  Copys the updated temporary bubble object back into the array
      _bubble = null;                           //  Makes the temporary bubble object null.
    }
  }
  
  opencv.remember(OpenCV.SOURCE, OpenCV.FLIP_HORIZONTAL);    //  Remembers the camera image so we can generate a difference image next frame. Since we've
                                                             //  flipped the image earlier, we need to flip it here too.
  //text("Bubbles popped: " + poppedBubbles, 20, 40);          //  Displays some text showing how many bubbles have been popped
  
}

class Bubble
{
  
  int bubbleX, bubbleY, bubbleWidth, bubbleHeight;    //  Some variables to hold information about the bubble
  
  Bubble ( int bX, int bY, int bW, int bH )           //  The class constructor- sets the values when a new bubble object is made
  {
    bubbleX = bX;
    bubbleY = bY;
    bubbleWidth = bW;
    bubbleHeight = bH;
  }
  
  int update()      //   The Bubble update function
  {
    int movementAmount;          //  Create and set a variable to hold the amount of white pixels detected in the area where the bubble is
    movementAmount = 0;
    
    for( int y = bubbleY; y < (bubbleY + (bubbleHeight-1)); y++ ){    //  For loop that cycles through all of the pixels in the area the bubble occupies
      for( int x = bubbleX; x < (bubbleX + (bubbleWidth-1)); x++ ){
        
        if ( x < width && x > 0 && y < height && y > 0 ){             //  If the current pixel is within the screen bondaries
          if (brightness(movementImg.pixels[x + (y * width)]) > 127)  //  and if the brightness is above 127 (in this case, if it is white)
          {
            movementAmount++;                                         //  Add 1 to the movementAmount variable.
           }
        }
      }
    }

    
    if (movementAmount > 5)               //  If more than 5 pixels of movement are detected in the bubble area
    {
      //poppedBubbles++;                    //  Add 1 to the variable that holds the number of popped bubbles
      return 1;                           //  Return 1 so that the bubble object is destroyed
   
   }
   else{                                 //  If less than 5 pixels of movement are detected,
      bubbleY += direction;                      //  increase the y position of the bubble so that it falls down
      
//      if (bubbleY > height)               //  If the bubble has dropped off of the bottom of the screen
//      {  return 1; }                      //  Return '1' so that the bubble object is destroyed
      
    }
    
      image(bubblePNG, bubbleX, bubbleY);    //  Draws the bubble to the screen
      return 0;                              //  Returns '0' so that the bubble isn't destroyed
    
  }
  
}

