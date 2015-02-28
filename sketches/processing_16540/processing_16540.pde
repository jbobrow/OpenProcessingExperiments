
// by ben van citters
import ddf.minim.analysis.*;
import ddf.minim.*;
float[] lastFFTArray;
float [][] bezControlPts = {{0.0,    0.0,   255.0,  255.0},
                            {0.0,  255.0,   255.0,    0.0},
                            {255.0,    0.0,     0.0,    0.0}};

Minim minim;
AudioInput in;
FFT fft;
void setup()
{
  size(1200, 700);
 
  background(0);
  minim = new Minim(this);

  // get a stereo line-in: sample buffer length of 2048
  // default sample rate is 44100, default bit depth is 16
  in = minim.getLineIn(Minim.MONO, 1024);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  lastFFTArray = new float[fft.specSize()];
}

void shiftScreenLeft(int pixSpd)
{
  //direct pixel editing is only allowed within a 
  // loadPixels and updatePixels probably for threading reasons
  loadPixels();
  for(int i = 0; i < height; i++)
  {
    for(int j = 0; j < width; j++)
    {
      int index = i*width+j;
      if(j < (width - pixSpd))
      {     
        pixels[index] =  pixels[index+ pixSpd];
      }else
        pixels[index] = color(0);
    }
  }
  updatePixels();
}

//fill valu
float[] getCurrentFFTArray()
{
  float[] tmp = new float[fft.specSize()];  
  for(int i =0; i < tmp.length; i++)
  {
    tmp[i] = fft.getBand(i);
  }
  return tmp;
}

void draw()
{
  int screenShift = 3;
   shiftScreenLeft(screenShift);
  //fast-fourier-transform this packet of numbers
  fft.forward(in.left);

  // the number of avg'd section of the spectrum to show
  int numOfFreqBars = fft.specSize(); //height;
  
  //determine number of bars to collect data from  
  float nfreqW = (float)(fft.specSize()/numOfFreqBars);

  //the freq volume to scale by
  float peakSoundMagnitude = 1000;//getPeakBandVol(nfreqW);
  //used as the scaling to apply to each set of frequencies 
  // to keep them within constrained values (0-1.0)
  float freqscale;  
  float sectW = (1.0)*width/numOfFreqBars; //width of each freq rect
  float sectH = (1.0)*height/numOfFreqBars; //height of each freq rect

  //draw frequency bars
  for(int i =0;i < numOfFreqBars; i++)
  {         
    //get the avg'd amplitude of this particular bar   
    float h = 0.0;
    for(int j = 0; j < nfreqW; j++)
    {
      h += fft.getBand((int)(i*nfreqW) + j);
    }
    h = h/nfreqW;
    // apply a logaritm to the value to keep all values in a good range
    freqscale = min(log(h+1)/log(peakSoundMagnitude),1.0); 
    //freqscale = min(h /peakSoundMagnitude,1.0);
    float[] ret = getBezierPointVec3(bezControlPts,freqscale);

    //draw fill of values along right edge 
    //the amplitude of this frequency determines the color
    stroke(ret[0],ret[1],ret[2]);
    fill(ret[0],ret[1],ret[2]);
    
    rect(width - screenShift,i*sectH, screenShift, sectH); 

  }
}


  //i help get color!
  float[] getBezierPointVec3(float[][] x, float t)
  {
    if(x.length != 3 || x[0].length != 4)
      return new float[] {0.0};
    return new float[] {getBezPtSingleAxis(x[0],t),
                        getBezPtSingleAxis(x[1],t),
                        getBezPtSingleAxis(x[2],t) };
  }
  float getBezPtSingleAxis(float[] x, float t)
  {
    if(x.length < 4 || t < 0.0 || t > 1.0)
      return -1.0;
    float tmp = 1-t;
    return x[0]*pow(tmp,3) + 
         3*(x[1]*t*pow(tmp,2)+
         x[2]*t*t*(tmp))+
         x[3]*pow(t,3);

  }

