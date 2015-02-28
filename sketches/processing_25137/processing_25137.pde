
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer audioPlayer;
FFT fft;
int iNumAverages = 32;

void setup()
{
  size(512,512,P3D);
  minim = new Minim(this);
  audioPlayer = minim.loadFile("Velocity.mp3", 512);
  audioPlayer.loop();
  fft = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());
  fft.linAverages(iNumAverages);
}

class FftVar
{
  FftVar(int iFreq)
  {
    m_iFreq = iFreq;
    m_fValue = 0;
  }
  
  void Update()
  {
    m_fValue = m_fValue * 0.8 + fft.getAvg(m_iFreq) * 0.2;
  }
  
  float GetValue()
  {
    return m_fValue;
  }
  
  int m_iFreq;
  float m_fValue;
}

FftVar fftTotalScale = new FftVar(2);
FftVar fftArms = new FftVar(1);
FftVar fftTwist = new FftVar(5);
FftVar fftLength = new FftVar(20);


void draw()
{
  fft.forward(audioPlayer.mix);
  fftTotalScale.Update();
  fftArms.Update();
  fftTwist.Update();
  fftLength.Update();

  background(152);
  noStroke();
  fill(0);
  rectMode(CENTER);
  float fTotalScale = constrain(fftTotalScale.GetValue() * 0.75, 0.01, 2);
  int iNumArms = (int)constrain(fftArms.GetValue() * 3, 3, 10);
  for (float fTwistDir = -1; fTwistDir <= +1; fTwistDir += 2)
  {
    for (int i = 0; i < iNumArms; i++)
    {
      pushMatrix();
      translate(width/2, height/2);
      scale(fTotalScale);
      rotateZ((float)i * PI*2.0/(float)iNumArms - PI/2);
      int iLength = (int)constrain(fftLength.GetValue() * 50, 3, 20);
      for (int j = 0; j < iLength; j++)
      {
        float fRGBAlpha = (float)j / (float)iLength;
        translate((iLength-j+5)*3,0,0);
        rotateZ(fftTwist.GetValue() * 0.5 * fTwistDir);
        rect(0, 0, (iLength-j)*2, (iLength-j)*2);
      }
      popMatrix();
    }
  }
}



