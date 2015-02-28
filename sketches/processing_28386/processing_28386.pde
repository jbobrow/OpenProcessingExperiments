
//Form And Image
//Added sound oscillator, video capture, defined new color, size and shape, added basic shape with added mouse rollover.
//Oscillator creates fractured appearance of image when mouse rollover is performed
//Imported Video Library
//Removed original lines of code conflicting with Minim/Video
import processing.video.*;


//Imported Minim Library
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
//Declare new objects
MovieMaker mm;

Minim minim;
AudioOutput out;
SineWave sine;
 
//Several adjustments to values below to recreate image. Increased canvas size. Added P3D to the canvas parameters, this mode is helpful when using a large number of images in the processing sketch, or video or audio playback. 
// used Oscillator code begins here. Added a repetitive, constant signal, a sinewave. Adding oscillator allows experiments with volume ("amplitude"), pitch, and portamento.

void setup() {
    size(1280, 720, P3D);//adjust size of canvas; P3D is a different renderer then the default, best for images, video, 3d, etc.
      smooth();
//minim code begins here
minim = new Minim(this);
   // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // creating a sine wave Oscillator: 440 is Hz, 0.5 defines amplitude
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);

 //**movie code
  // Created MovieMaker object here: defines size, filename, compression codec and quality, framerate
  mm = new MovieMaker(this, 1280, 720, "drawing.mov",
                       12, MovieMaker.H263, MovieMaker.HIGH);

}
 
public void draw() {
  //**movie code
  mm.addFrame();  // adds frames to the movie file    
  loadPixels();
    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
 
            float u, v, zoom, c_real, c_imaginary, julia_u, julia_v;
 
 //these values define the fractal shape
            zoom = 1.84f + (mouseY - width/2)*0.0008;
            c_real = -0.25f - (mouseY - width/2)*0.0009;
            c_imaginary = - (mouseX - width/2)*0.001;
 
            u = ((float) x / (float) width - 0.5f) * zoom;
            v = ((float) y / (float) height - 0.5f) * zoom;
 julia_u = (u * u - v * v + c_real + 0.5f) * width;
 julia_v = (2 * u * v + c_imaginary + 0.5f) * height;
 
            VectorType complex_squared = new VectorType(julia_u, julia_v);
            int col = getColor(complex_squared, pixels);
            set(x, y, col);
        }
    }
//Added rollover shapes for increased interactivity - rect could be replaced with other shapes, such as ellipse, etc.
    rect(mouseX, mouseY, 50, 25);
}
 
public int getColor(VectorType subPixelPosition, int[] sourcePixels) {
    int x = floor(subPixelPosition.x);
    int y = floor(subPixelPosition.y);
    float u = subPixelPosition.x - x;
    float v = subPixelPosition.y - y;
 
    if (x < 0 || y < 0 || x >= width - 1 || y >= height - 1) {
        return color(245);//alter return color
    }
 
    int indexTopLeft = x + y * width;
    int indexTopRight = x + 1 + y * width;
    int indexBottomLeft = x + (y + 1) * width;
    int indexBottomRight = x + 1 + (y + 1) * width;
 
    try {
        int col = lerpColor(lerpColor(sourcePixels[indexTopLeft],
                sourcePixels[indexTopRight], u), lerpColor(
                sourcePixels[indexBottomLeft],
                sourcePixels[indexBottomRight], u), v);
        float r = red(col);
        float g = green(col);
        float b = blue(col);
 
        r = constrain(r - 7, 0, 335); // adjusted settings here to change color fade/decay
        g = constrain(g - 6, 0, 255);
        b = constrain(b - 7, 0, 245);
 
        return color(r, g, b);
    } catch (Exception e) {
        System.out.println("getBufferColor: " + x + " | " + y);
    }
    return color(0);
}
 
public class VectorType {
    float x, y;
 
    public VectorType() {
        x = 0;
        y = 0;
    }
 
    public VectorType(float x, float y) {
        this.x = x;
        this.y = y;
    }
 

}
//**movie code
void keyPressed() {
  if (key == ' ') {
    mm.finish();
  }

}
//*Minim code
void stop()
{
  out.close();
  minim.stop();
  super.stop();
}


 //Source: Processing.org, Video Library, Minim Library, F Wotzel.
 //Experiments with fractal animation (series 1).

