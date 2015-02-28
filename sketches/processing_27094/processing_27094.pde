
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

Circle [] circles = new Circle[10];

void setup()
{
  size(500,500);
  smooth();

  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);

  for (int i = 0; i < circles.length; i++)
  {
    circles[i] = new Circle();
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < circles.length; i++)
  {
    circles[i].display();
    for (int j = 0; j < circles.length; j++)
    {


      if(i != j && (circles[i]).intersect(circles[j])) {
        
  // with portamento on the frequency will change smoothly
  float freq = map(circles[i].ypos, 0, circles[i].xpos, circles[j].xpos, circles[j].ypos);
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
 // float pan = map(circles[i].xpos, 0, width, -1, 1);
  //sine.setPan(pan);
      } 
    }
  }
}

void mouseDragged()
{
  for (int i = 0; i < circles.length; i++)
  {
    circles[i].move();
  }
}

class Circle
{
  float r;
  float xpos;
  float ypos;

  Circle()
  {
    xpos = random(width);
    ypos = random(height);
    r = 35;
  }
  void display()
  {
    noStroke();
    fill(0,80);
    ellipse(xpos,ypos,r*2,r*2);
  }

  void move()
  {
    if(dist(mouseX,mouseY,xpos,ypos)<r)
    {
      xpos = xpos +  mouseX-pmouseX;
      ypos = ypos + mouseY-pmouseY;
      if (xpos>width+r || ypos>height+r || xpos<0-r || ypos<0-r) {
        xpos = 0;
        ypos = 0;
      }
    }
  }

  boolean intersect (Circle c){
    float distance = dist(xpos,ypos,c.xpos,c.ypos);
    if(distance < r+c.r)
    {
      return true;
    }
    else {
      return false;
    }
  }
}


void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}


