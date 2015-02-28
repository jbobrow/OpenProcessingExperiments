
/**MODDED BY ALIVE LAB - JKO
 * Get Line In
 * by Damien Di Fede.
 *  
 * This sketch demonstrates how to use the <code>getLineIn</code> method of 
 * <code>Minim</code>. This method returns an <code>AudioInput</code> object. 
 * An <code>AudioInput</code> represents a connection to the computer's current 
 * record source (usually the line-in) and is used to monitor audio coming 
 * from an external source. There are five versions of <code>getLineIn</code>:
 * <pre>
 * getLineIn()
 * getLineIn(int type) 
 * getLineIn(int type, int bufferSize) 
 * getLineIn(int type, int bufferSize, float sampleRate) 
 * getLineIn(int type, int bufferSize, float sampleRate, int bitDepth)  
 * </pre>
 * The value you can use for <code>type</code> is either <code>Minim.MONO</code> 
 * or <code>Minim.STEREO</code>. <code>bufferSize</code> specifies how large 
 * you want the sample buffer to be, <code>sampleRate</code> specifies the 
 * sample rate you want to monitor at, and <code>bitDepth</code> specifies what 
 * bit depth you want to monitor at. <code>type</code> defaults to <code>Minim.STEREO</code>,
 * <code>bufferSize</code> defaults to 1024, <code>sampleRate</code> defaults to 
 * 44100, and <code>bitDepth</code> defaults to 16. If an <code>AudioInput</code> 
 * cannot be created with the properties you request, <code>Minim</code> will report 
 * an error and return <code>null</code>.
 * 
 * When you run your sketch as an applet you will need to sign it in order to get an input. 
 * 
 * Before you exit your sketch make sure you call the <code>close</code> method 
 * of any <code>AudioInput</code>'s you have received from <code>getLineIn</code>.
 */

import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(800, 800, P3D);
  lights();
  noStroke();
  background(0);
  fill(255);
  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("AgencyFB-Bold-48.vlw"); 
  textFont(font); 
  text("ALIVE LAB YO!",  100, 100); 
  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 800);
}

float k=0;
int j=0;
void draw()
{
  lights();
  stroke(255,0,255);
  background(0);
  fill(0);  
  pushMatrix();
  translate(width/2,height/2,200);
  k=random(1,4);
  if (j<=2000) 
  {
    j++;
    rotateY(j*0.01);
    rotateX(-j*0.02);
    fill(j*0.1+100,0,j*0.1+100);
    if ((k>1.5)&&(k<1.7))
    {
      translate(width/2,height/2,j*0.001);
      background(255);
    }
    else
    {
      background(0);
    }
  }
  else
  {
    fill(0,0,255);
    rotateY(j*0.01);
    rotateX(-j*0.02);
    translate(width/2,height/2,j*0.001);
    j=0;
  }
  box(in.left.get(10)*2000);
  delay(50);
  popMatrix();


  // draw the waveforms
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    stroke(255,0,0);
    line(i, 290 + in.left.get(i)*500, i+1,300+ in.left.get(i+1)*500);    
    stroke(0,0,255);
    line(i, 490 + in.right.get(i)*500, i+1, 500+in.right.get(i+1)*500);
  }

  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("AgencyFB-Bold-120.vlw"); 
  textFont(font); 
  fill(255,0,255);
  text("ALIVE LAB YO!", 150, 100); 
  font = loadFont("AgencyFB-Bold-48.vlw"); 
  textFont(font); 
  text("Appiccia lu microfono guagliò!",150,200);
  fill(255);
  text("turn your microphone on!",150,160);
  font = loadFont("AgencyFB-Bold-120.vlw"); 
  textFont(font); 
  text("/AV/", 260, 700); 
  font = loadFont("AgencyFB-Bold-48.vlw"); 
  textFont(font); 
  text("Fac'sentì o'SUON':",10,410);
}


void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}









