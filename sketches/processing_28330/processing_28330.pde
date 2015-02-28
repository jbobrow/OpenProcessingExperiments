
/*
Modified by Alastair Gray. (Original by Jared "BlueThen" C,  'Wavy'.)
*/

import ddf.minim.*;
import ddf.minim.signals.*;


Minim minim;
AudioOutput out;
SineWave sine;

float compression = .55;
float a;
float speed = 0.8;

void setup()
{

  size(500,500);
  colorMode(HSB, 10);

  noCursor();

  //compression = (dist(mouseX,mouseY, width/500.0,height/500.0)*compression++);


  stroke(1);

  frameRate(30);

  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, .2, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(50);
  // add the oscillator to the line out
  out.addSignal(sine);
}
void draw()
{

  speed = (width/2-dist(mouseX,mouseY, width/2,height/2)) / (width/2);

  // if (mouseX < width-100 > width-400, mouseY < height-100 > height-400){

  if ((mouseX < width -100)&&(mouseX > 100)) {


    compression = .88;
  }
  else {
    compression = .55;
  }

  compression = (width/2-dist(mouseX,mouseY, width/2,height/2))/( dist(0,0, width/2, height/2));




  //When "i" is less than "35"...



  a -= speed;

  background(6);

  for (int x = -45; x < 45; x++) {
    //if (x > - 20) {
    // compression = .88;


    for (int z = -45; z < 45; z++) {

      //for (int y = int(10 * cos(0.55 * distance(x,z,0,0) - a))); halfw+halfh >= 250; int a -= 0.5;)  {     


      int y = int(24 * cos(compression * distance(x,z,0,0) + a));





      float xm = x*17 -8.5;
      float xt = x*17 +8.5;
      float zm = z*17 -8.5;
      float zt = z*17 +8.5;

      int halfw = mouseX;
      int halfh = mouseY;


      int isox1 = int(xm - zm + halfw);
      int isoy1 = int((xm + zm) * 0.5 + halfh);
      int isox2 = int(xm - zt + halfw);
      int isoy2 = int((xm + zt) * 0.5 + halfh);
      int isox3 = int(xt - zt + halfw);
      int isoy3 = int((xt + zt) * 0.5 + halfh);
      int isox4 = int(xt - zm + halfw);
      int isoy4 = int((xt + zm) * 0.5 + halfh);

      fill (1);
      quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+40, isox2, isoy2+40);
      fill (2);
      quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+40, isox3, isoy3+40);


      fill(4 + y * 0.05);
      quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
    }
  }
}




float distance(float x,float y,float cx,float cy) {
  return sqrt(sq(cx - x) + sq(cy - y));
}

void mouseMoved()
{
  // with portamento on the frequency will change smoothly
  float freq = (width/2-dist(mouseX,mouseY, width/2,height/2));

  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = (width/2-dist(mouseX,mouseY, width/2,height/2));

  sine.setPan(pan);
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}


