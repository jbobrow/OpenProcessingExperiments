
import beads.*;
import processing.video.*;

AudioContext ac = new AudioContext();
// Variable for capture device
Capture video;
// Previous Frame
PImage prevFrame;
// How different must a pixel be to be a "motion" pixel
float threshold = 5;
float thresh2 = 50;
float thresh3 = 150;

Envelope freqEnv = new Envelope(ac, 0);
WavePlayer wp = new WavePlayer(ac, freqEnv, new SineBuffer().getDefault());
Gain g = new Gain(ac, 1, 0.1);


void setup() {
  size(640,480);
  video = new Capture(this, width, height, 30);
  // Create an empty image the same size as the video
  prevFrame = createImage(video.width,video.height,RGB);

}

void draw() {

  // Capture video
  if (video.available()) {
    // Save previous frame for motion detection!!
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height); // Before we read the new frame, we always save the previous frame for comparison!
    prevFrame.updatePixels();
    video.read();
    g.addInput(wp);
    ac.out.addInput(g);
    ac.start();
    wp.setFrequency(0);
}

  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  float total_diff = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      freqEnv.clear();
      int loc = x + y*video.width;        // Step 1, what is the 1D pixel location
      color current = video.pixels[loc];      // Step 2, what is the current color
      color previous = prevFrame.pixels[loc]; // Step 3, what is the previous color

      // Step 4, compare colors (previous vs. current)
      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      float diffX = abs(r2-r1);
      float diffY = abs(g2-g1);
      float diffZ = abs(b2-b1);

      // Step 5, How different are the colors?
      // If the color at that pixel has changed, then there is motion at that pixel.
      if (diff > threshold ) { 

        // If motion, display black
      //  pixels[loc] = color(diffX*.314,100,2*diffY);
          pixels[loc] = color(0,0,0);
        if (diff > thresh2 ){
          pixels[loc] = color(2*diffZ,diffY*.314,300);
          if ( diff > thresh3 ){
            pixels[loc] = color(2*diffY,diffX*3.14,10*diffX);
          }
          if (x > video.width/2)
          {
            total_diff = total_diff + diff;    
          }

      //    wp.setFrequency(30*total_diff);
        }  
          wp.setFrequency(diff/2);
    }

      else {
        // If not, display white
        pixels[loc] = color(0,0,0);
        total_diff = 0;
      }



   //   freqEnv.addSegment(100*total_diff,.1);  

    }



  }

  //wp.setFrequency(0);
  updatePixels();

      
}



