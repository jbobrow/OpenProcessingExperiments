
//Audio Library Import
import ddf.minim.*;
import ddf.minim.signals.*;

//Audio output and sine creation
Minim minim;         
AudioOutput out;    // create an output object
SineWave sine;      // create a sine wave object

//Audio controls
float freq = 0;
float amp = 1.0;
float samples = 512;

//Drawing controls
float feedBack = 0;
int num = 400;
float PRand = 3 + feedBack;
float sRand = 7;
float SS = 25;
float SSR = 25;
float [] Size = new float [num];
float [] xPath = new float [num];
float [] yPath = new float [num];
int [] Colors = new color [5];
int [] col = new int[num];



void setup () {

  colorMode(HSB);
  size (400, 400);
  background (255);
  smooth ();

  //Audio setup
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 150);
  sine = new SineWave(freq, amp, samples);
  out.addSignal(sine);  

  //Drawing Colors
  Colors[0] = color (220, 63, 71, 2);
  Colors[1] = color (255, 162, 83, 2);
  Colors[2] = color (227, 223, 101, 2);
  Colors[3] = color (100, 196, 169, 2);
  Colors[4] = color (34, 41, 66, 2);

  //Drawing Paths and Size Seeds; colorPicker
  for ( int i = num - 1; i > 0; i--) {
    xPath[i] = 0;
    yPath[i] = 0;
    col[i] = floor(random(0,5));
    Size[i] = floor (random(0,SS));
  }
}



void draw () {

  color myColor = get(mouseX, mouseY);

  float freq = map(int(floor(brightness(myColor))), 0, 255, 1, 150);
  sine.setFreq(freq);
  // float samples = map(int(floor(saturation(myColor))), 0, 255, 50, 800);
  float amp = map(int(floor(saturation(myColor))), 0, 255, .15, 2.00);
  sine.setAmp(amp);

  float feedBack = map(freq, 50, 880, 25, 1);

  //num +=feedBack;
  println("feedBack = " + feedBack);
  println("pRand = " + PRand);
  println(" freq = " + freq);
  println(" amp = " + amp);
  println("number of scribbles = " + num);

  blend(0, 0, width, height, 0, 0, width, height, LIGHTEST);
  translate (width/2, height/2);
  for(int i=0; i<num-1; i++) {
    Size[i]-= 0.02;  
    if (Size[i] <= -SSR) {
      Size[i] = SSR;
    }
    noStroke ();
    //stroke (0, 255);
    fill(Colors[col[i]]);
    scribble (xPath[i] += random (-PRand, PRand), yPath[i] += random (-PRand, PRand), Size[i], Size[i]);
  }
}

void mouseMoved() {
}


void keyPressed()
{
  if ( key == 'm' )
  {
    if ( out.isMuted() )
    {
      out.unmute();
    }
    else
    {
      out.mute();
    }
  }
}



void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

void scribble (float x, float y, float sx, float sy) {
  beginShape();
  curveVertex(x + (-sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
  curveVertex(x + (-sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
  curveVertex(x + (sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
  curveVertex(x + (sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
  curveVertex(x + (-sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
  curveVertex(x + (-sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
  curveVertex(x + (sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
  endShape();
}


