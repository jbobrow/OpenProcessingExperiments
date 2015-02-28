
//import ddf.minim.*;
//Minim minim;
//AudioPlayer player;


import ddf.minim.*;

Minim minim;
AudioInput in;
AudioOutput out;
WaveformRenderer waveform;

//void setup() {
  //size(1000,400);
  //minim = new Minim(this);
  //player = minim.loadFile("dictator.mp3");
  //player.play();
//}
void setup()
{
  size(1400,700);

  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
  out = minim.getLineOut(Minim.STEREO, 512);

  waveform = new WaveformRenderer();
  in.addListener(waveform);


  // adds the signal to the output
  out.addSignal(waveform);

}





class WaveformRenderer implements AudioListener, AudioSignal
{

  private float[] left;
  private float[] right;

  WaveformRenderer()
  {
    //    left = null; 
    //    right = null;
  }

  synchronized void samples(float[] samp)
  {
    left = samp;
  }

  synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }


  void generate(float[] samp)
  {
    System.arraycopy(right, 0, samp, 0, samp.length);

  }

  // this is a stricly mono signal
  void generate(float[] sampL, float[] sampR)
  {
    if (left!=null && right!=null){
      System.arraycopy(left, 0, sampL, 0, sampL.length);
      System.arraycopy(right, 0, sampR, 0, sampR.length);
    }
  }


}







void stop() 
{
  in.close();
  minim.stop();
  super.stop();
}
void draw() {
  PImage p = get();
  tint(250, 100, 10, 100);
  image(p, -2, -2, 1400, 700);
  stroke(255);

  strokeWeight(1.0);
  float a = 0;
  float angle = (7*PI) / 700;
  int step = in.bufferSize() / 200;
  for(int i=0; i < in.bufferSize() - step; i+=step) {
    float x = 700 + cos(a) * (200 * in.mix.get(i) + 200);
    float y = 350 + sin(a) * (200 * in.mix.get(i) + 200);
    float x2 = 700 + cos(a + angle) * (350 * in.mix.get(i+step) + 200);
    float y2 = 350 + sin(a + angle) * (350 * in.mix.get(i+step) + 200);
    line(x,y,x2,y2);
    a += angle;
  }
}


