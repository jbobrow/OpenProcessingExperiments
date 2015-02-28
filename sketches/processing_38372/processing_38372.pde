
import hypermedia.video.*;
import java.awt.Rectangle;
import ddf.minim.*;
import ddf.minim.signals.*;


OpenCV opencv;
Minim minim;
AudioOutput out;
SineWave sine;

void setup() {

    size( 320, 240 );

    opencv = new OpenCV(this);
    opencv.capture( width, height );
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );    // load the FRONTALFACE description file

    minim = new Minim(this);
    out = minim.getLineOut(Minim.STEREO);
    sine = new SineWave(440, 0.5, out.sampleRate());
    sine.portamento(200);
    out.addSignal(sine);
}


void draw() {
    
    opencv.read();
    image( opencv.image(), 0, 0 );
    
    // detect anything ressembling a FRONTALFACE
    Rectangle[] faces = opencv.detect();
    
    // draw detected face area(s)
    

    
    
     for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  
  
  
  
      fill(255,0,0);
    noStroke();
    for( int i=0; i<faces.length; i++ ) {
        //rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
        ellipse(faces[i].x+faces[i].width/2, faces[i].y+faces[i].height/2, 10, 10);
    
  
  
  float freq = map(faces[i].y, 0, height, 1500, 60);
  sine.setFreq(freq);
  
  float pan = map(faces[i].x, 0, width, -1, 1);
  sine.setPan(pan);
    
 }   
    
}


void stop()
{
  out.close();
  minim.stop();
 
  super.stop();
}


