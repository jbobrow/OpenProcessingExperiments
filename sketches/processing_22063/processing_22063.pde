
import hypermedia.video.*;
import java.awt.Rectangle;

//import sound
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
//


OpenCV opencv;

// contrast/brightness values
int contrast_value    = 0;
int brightness_value  = 0;



void setup() {

    size( 320, 240 );

    opencv = new OpenCV( this );
    opencv.capture( width, height );                   // open video stream
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"


    // print usage
    println( "Drag mouse on X-axis inside this sketch window to change contrast" );
    println( "Drag mouse on Y-axis inside this sketch window to change brightness" );


    // sounds
    
    minim = new Minim(this);
      // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
  
  
}


public void stop() {
    opencv.stop();
    super.stop();
}



void draw() {

    // grab a new frame
    // and convert to gray
    opencv.read();
    opencv.convert( GRAY );
    opencv.contrast( contrast_value );
    opencv.brightness( brightness_value );

    // proceed detection
    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

        
        
    // display the image
    image( opencv.image(), 0, 0 );

    // draw face area(s)
    noFill();
    stroke(255,0,0);
    for( int i=0; i<faces.length; i++ ) {
        rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
        // variable for distance of face
        float closeness = ( faces[i].x + faces[i].y + faces[i].width + faces[i].height )*2;
    
    //create sound
      float freq = closeness;
        sine.setFreq(freq);
        
  }
    
    // float closeness = ( faces[i].x + faces[i].y + faces[i].width + faces[i].height );
    // create sound based on size of face
    
    
  
        
        
        //
}



/**
 * Changes contrast/brigthness values
 */
void mouseDragged() {
    contrast_value   = (int) map( mouseX, 0, width, -128, 128 );
    brightness_value = (int) map( mouseY, 0, width, -128, 128 );
}



