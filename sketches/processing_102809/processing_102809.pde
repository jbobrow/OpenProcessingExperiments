
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;

AudioPlayer[] backgroundplayer;
AudioSnippet[] ding;

FFT fft0;
FFT fft1;

float power = 0;
float maxpow = 0;
float glass;
float dark = 245; // Transparent is 0 opaque is 255
float brightness = 110; // Maximum brightness from lightning
PImage mainbg;

float[] dx;
float[] dy;
float[] x;
float[] y;
float rect_width = 50;
float easing = .04;
int i;
boolean[] trigger;
int shade = 0;

void setup()
{
  minim = new Minim(this);
  backgroundplayer = new AudioPlayer[2];
  backgroundplayer[0] = minim.loadFile("let_it_whip_loop_quiet.wav",512);
  backgroundplayer[0].printControls();
  backgroundplayer[0].setGain(-10);
  //backgroundplayer[0].play();
  backgroundplayer[0].loop();
  backgroundplayer[1] = minim.loadFile("small_thunder_01.wav",512);
  backgroundplayer[0].setGain(5);
  //backgroundplayer[1].play();
  backgroundplayer[1].loop(); 
 
  // This is used to generate data similar to what getAvgPower does with maxim
  fft1 = new FFT(backgroundplayer[1].bufferSize(), backgroundplayer[1].sampleRate());
  fft0 = new FFT(backgroundplayer[0].bufferSize(), backgroundplayer[0].sampleRate());

  ding = new AudioSnippet[9]; 
  ding[0] = minim.loadSnippet("e-2s.wav"); 
  ding[1] = minim.loadSnippet("a-2s.wav");
  ding[2] = minim.loadSnippet("d-2s.wav");
  ding[3] = minim.loadSnippet("a-2s.wav");
  ding[4] = minim.loadSnippet("e-2s.wav");
  ding[5] = minim.loadSnippet("e-2s.wav");
  ding[6] = minim.loadSnippet("e-2s.wav");
  ding[7] = minim.loadSnippet("d-2s.wav");
  ding[8] = minim.loadSnippet("a-2s.wav");
    
  mainbg = loadImage("bw_city_01.jpg");
 
  x = new float[9];
  y = new float[9];
  dx = new float[9];
  dy = new float[9];
  trigger = new boolean[9];
  
  for(i = 0; i < 9; i++)
    {
      x[i] = 275 + rect_width * i;
      y[i] = 400;
      trigger[i] = false;
    }
  size(1000, 500);
  strokeWeight(1);
  stroke(0,255,0);
  fill(0,255,0);
  background(mainbg);
  frameRate(60);
  glass = dark;
}

void draw()
{
  strokeWeight(1);
  // This is used to generate data similar to what getAvgPower does with maxim
  fft1.forward(backgroundplayer[1].mix);
  power = fft1.calcAvg(20,20000);
  
  // When power exceeds threshold, get transparent.
  
  /* This allows me to determine the max power level so 
  that the thunder will make things bright. 
  It prints to the console. */
  
  if(power > maxpow)
  {
    maxpow = power;
    println("maxpow = " + maxpow + "power = " + power);
  }
  println(power+"    " +maxpow);
  
  /* This chunk uses the average power to increase the transparency 
  of an almost opaque black rectangle. Higher power makes it more
  transparent. The first value sets a threshold so that everything doesn't
 affect the "night" the second set force the power to actually make the
rectangle transparent. */

  if(power > .8)
  {
    if( power > 1. ){ power = 1.; }
    glass = 255 * ( 1 - power/1. );
    if( glass < brightness ){ glass = brightness; } 
  }
  else{ glass = dark;}
  background(mainbg); // Redraw background image
  fill(0,glass);
  rect(0,0,width-1,height-1);
  
  /* This section is controlling the rectangle chimes. Easing is involved and tones
  are assigned and triggered for each "chime".*/
  
    for(i = 0; i < 9; i++)
    {
      dx[i] = mouseX - (x[i] + .5*rect_width);
      dy[i] = mouseY - y[i];

      if(abs(dx[i]) < 50 && mouseY < 400 )
        {
          y[i] = y[i] + easing * dy[i];
          
          if(!trigger[i])
            {
              ding[i].play();
              trigger[i] = true;
              ding[i].rewind();
            }
          }
      else
        {
          dy[i] = 400 - y[i];
          if( y[i] < 400)
            {
              y[i] = y[i] + easing * abs(dy[i]);
            }
           trigger[i] = false;
        }
      fill(0,255,0);
      rect( x[i] , y[i] , 50 , 50 + (400 - y[i]) );
    }
    
  // first perform a forward fft on one of song's buffers
  // I'm using the mix buffer
  //  but you can use any one you like
  fft0.forward(backgroundplayer[0].mix);
 
  // I draw the waveform by connecting 
  // neighbor values with a line. I multiply 
  // each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  strokeWeight(10); // Thickness of wave
  colorMode(HSB);
  for(int k = 0; k < backgroundplayer[0].left.size() - 1; k++)
  {
    stroke(k%255,255,255);
    //smooth();
    line(2*k, height-50 + backgroundplayer[0].left.get(k)*200, 2*k+1, height-50 + backgroundplayer[0].left.get(k+1)*200);
    line(2*k, 50 + backgroundplayer[0].right.get(k)*200, 2*k+1, 50 + backgroundplayer[0].right.get(k+1)*200);
  }

}

// We are supposed to stop these processes according to minim documentation

void stop()
{
  for(int j = 0; j<9; j++){ding[j].close();}
  backgroundplayer[0].close();
  backgroundplayer[1].close();
  minim.stop();
  super.stop();
}

