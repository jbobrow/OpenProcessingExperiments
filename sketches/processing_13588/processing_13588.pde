
int counter;
var webcamPixels;

void setup() {  //setup function called initially, only once
  //for some reason, pixels from flash provided in 320x240
  //changing the sketch size brakes the video.
  size(320, 240); 
  loadPixels();
}

void draw() {  //draw function loops 
  try {
      //grab pixels from flash
      //grabWebcamPixels() is a js function on the page, connecting Flash 
      //via ExternalInterface, and grabbing a huge String of pixels
      //u can download: 
       webcamPixels = grabWebcamPixels().split(',',width*height); 
       //update processingjs pixels
          for (int i = 0; i < width*height; i++) {
              //for some reason, pixels[] include negative values
              //therefore we need to subtract 16million (256*256*256)
              //mouseX addition adds some interaction to play w/ colors
              pixels[i] =int(webcamPixels[i])-16581373+mouseX-width/2;
              }
          updatePixels();
          
     }
  catch(e) { background(frameCount%255); } //if flash file can't be found..
}

                
                                                                                                                                
