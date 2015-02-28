
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int w;
PImage fade;

int hVal;
float rWidth, rHeight;

void setup()

{
size(640,480, P3D);

minim=new Minim(this);
in = minim.getLineIn(Minim.STEREO,512);
fft = new FFT(in.bufferSize(), in.sampleRate());
fft. logAverages(60,7);
stroke(255);
w=width/fft.avgSize();
strokeWeight(w);

background(0);
fade = get(0,0, width, height);
rWidth = width *0.99;
rHeight = height *0.99;
hVal = 0;
}


void draw()
{
background(0);
tint(255, 255, 255, 254);
image(fade,(width-rWidth) / 2 ,(height-rHeight)/ 2, rWidth, rHeight);
noTint();


fft.forward(in.mix);

colorMode(HSB);
stroke(hVal, 255,255);
colorMode(RGB);

for(int i = 0; i< fft.avgSize();i++)
{
  line((i * w) + (w/2), height, (i * w) + (w/2), height - fft.getAvg(i)*4);
}



stroke(255);
fade = get(0,0, width, height);

for(int i = 0; i< fft.avgSize();i++)
{
  line((i * w) + (w/2), height, (i * w) + (w/2), height - fft.getAvg(i)*4);
}


hVal +=2;
if(hVal > 255)
{
hVal = 0;
}
}


