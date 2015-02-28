
import ddf.minim.analysis.*;
import ddf.minim.*;
  
Minim       minim;
FFT         fft;
ArrayList<Float> poop = new ArrayList();
int bufferSize=512;
int highest=0;
float[] sample;
void setup()
{
  size(800, 300, JAVA2D);
  minim = new Minim(this);
  fft = new FFT( bufferSize,50000); //  FFT(int timeSize,float sampleRate)
}
  
void draw()
{
  background(0);
  stroke(#FF0000);
  sample = new float[poop.size()];
  for (int i=0;i<poop.size();i++) {
    Float f = (float) poop.get(i);
    sample[i] = f;
  }
  if (poop.size()< bufferSize) {
    float t = map(mouseX, 0, width, 0, bufferSize);
    poop.add(t);
  }
  else poop.remove(0);
  
  stroke(#009BFF);
  line(width/2, 20, mouseX, 20);
  if (sample.length==bufferSize) {
    fft.window(FFT.HAMMING);
    fft.forward(sample);
    for (int i = 0; i < fft.specSize(); i++)
    {
      stroke(0, 255, 0);
      float x = map(i, 0, fft.specSize(), 0, width);
      line( x, height, x, height - fft.getBand(i)/50.0);
      //-----------------For getting the highest frequency ----
//      if (fft.getFreq(i) >= fft.getFreq(highest)) {
//        highest=i;
//        float freq = fft.getFreq(highest);
//        println( " Band" + fft.getBand(i) +  " freq" + freq );
//      }
      //-----------------For getting the highest frequency ----
    }
  }
  else   println(poop.size());
}


