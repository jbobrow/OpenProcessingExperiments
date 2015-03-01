
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer myPlayer;
FFT fftL;
FFT fftR;

float[][] _spectrumArr;
int _barInterval;
int _barWidth;
int _barLayoutMargin;
int _barScaling;
color _barColorL;
color _barColorR;
color _barColorL2;
color _barColorR2;
color _bgColor;

void setup()
{
  size(640, 360);
  frameRate(60);
  colorMode(HSB, 360, 100, 100, 100);

  minim = new Minim(this);
  myPlayer = minim.loadFile("groove.mp3", 1024);
  myPlayer.loop();
  fftL = new FFT( myPlayer.bufferSize(), myPlayer.sampleRate() );
  fftR = new FFT( myPlayer.bufferSize(), myPlayer.sampleRate() );

  _spectrumArr = new float[2][9];
  _barInterval = 34;
  _barWidth = 31;
  _barScaling = 55;
  _barLayoutMargin=8;
  _barColorL = color(47, 100, 100);
  _barColorR = color(188, 87, 87);
  _barColorL2 = color(47, 90, 60);
  _barColorR2 = color(200, 87, 60);
  _bgColor = color(0, 0, 100, 100);
}

void draw()
{
  background(_bgColor);

  //L channel
  fftL.forward( myPlayer.left );
  for (int i = 0; pow(2,i+1)-1 < fftL.specSize(); i++)
  {
    int bandWidth = int(pow(2, i));
    int stBand = int(pow(2, i)-1);
    _spectrumArr[0][i] = 0;
    for (int v = 0; v < bandWidth; v++)
    {
      _spectrumArr[0][i] += fftL.getBand(stBand+v);
    }
    drawbar(0, i, _barColorL, _barColorL2);
  }

  // R channel
  fftR.forward( myPlayer.right );
  for (int i = 0; pow(2,i+1)-1 < fftR.specSize(); i++)
  {
    int bandWidth = int(pow(2, i));
    int stBand = int(pow(2, i)-1);
    _spectrumArr[1][i] = 0;
    for (int v = 0; v < bandWidth; v++)
    {
      _spectrumArr[1][i] += fftR.getBand(stBand+v);
    }
    drawbar(1, i, _barColorR, _barColorR2);
  }
}

void stop()
{
  myPlayer.close();
  minim.stop();
  super.stop();
}

void drawbar(int LR, int i, color barColor, color barColor2) {
  noStroke();
  int barX = i*_barInterval+ LR*width/2 +_barLayoutMargin;
  for (int t=0; t<_spectrumArr[LR][i]*_barScaling; t+=10) {
    fill(barColor, constrain(100-t*0.3, 60, 100));
    float barY = height-log(_spectrumArr[LR][i]+1)*_barScaling+t;
    rect(barX, barY, _barWidth, 10);
  }
  fill(barColor2);
  rect(barX, height-log(_spectrumArr[LR][i]+1)*_barScaling, _barWidth, -6);
}


