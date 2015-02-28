
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
//AudioInput in;
//AudioRecorder recorder;

float upLimit = 200;
float T=0;
float numBalls = 40;
float Multiplier = 4;
Ball[] balls = new Ball[(int)numBalls * 2];
float speed = 0.014;
boolean doubleSpin = true;

void setup() 
{
  size(640, 400);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  // in = minim.getLineIn(Minim.STEREO, 512);
  //  recorder = minim.createRecorder(out, "myrecording.wav", true);
  noStroke();
  smooth();
  for (int i = 0; i < (numBalls * 2); i++) {
    balls[i] = new Ball(((i) *((width) /(numBalls * 2))) + 10, (i *((height-20) /(numBalls ))) + 10, (width) /(numBalls), i);
  }
}

void draw() 
{
  background(128);
  fill(128);
  stroke(1);
  rect(0, ((height/2)-upLimit), width, upLimit * 2);
  noStroke();
  T+=speed;
  for (int i = 0; i < numBalls * 2; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }
}

class Ball {
  float x, y;
  float diameter;
  float dif;
  float vy = 0;
  int id;
  color ballColor;

 SineWave sine;

  Ball(float xin, float yin, float din, int idin)
  {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;

  sine = new SineWave((pow(2.0, (numBalls-id)/12.0)*220.0), 0.0, out.sampleRate());
    sine.setAmp(0);
    out.addSignal(sine);
  }

  void collide()
  {
  }

  void move()
  {
    vy = y;
    if(id % 2 == 0 && doubleSpin)
      y = (cos(T + PI+(((float)id / (float)(numBalls/(PI*Multiplier) )))) * ((height )/ 2) +( height / 2));
    else
       y = (cos(T  + (((float)id / (float)(numBalls/(PI*Multiplier) )))) * ((height )/ 2) +( height / 2)) ;
    vy = vy - y;
    if (vy > 0 && y > ((height/2)-upLimit) && y < ((height/2)+upLimit) )
    {
      sine.setAmp((min(abs((y - (height / 2)) -upLimit), abs((y - (height / 2)) +upLimit)) / upLimit)/numBalls );
      ballColor =  color(min(abs((y - (height / 2)) -upLimit), abs((y - (height / 2)) +upLimit)) * 255 / upLimit, 0, 0);
      dif = min(abs((y - (height / 2)) -upLimit), abs((y - (height / 2)) +upLimit)) * 10 / upLimit;
    }
    else
    {
      sine.setAmp(0);
      dif = -min(abs((y - (height / 2)) -upLimit), abs((y - (height / 2)) +upLimit)) * 5 / upLimit;
      if (y > ((height/2)-upLimit) && y < ((height/2)+upLimit) )
        ballColor =  color(0, 0, 0, 12);
      else
        ballColor =  color(64, 64, 64);
    }
  }

  void display() 
  {
    fill(ballColor);
    ellipse(x, y, diameter+dif, diameter +dif);
  }
}

void keyPressed()
{
  /*
  if ( key == 'r' )
   {
   if ( recorder.isRecording() )
   {
   recorder.endRecord();
   }
   else
   {
   recorder.beginRecord();
   }
   }
   if ( key == 'e' )
   {
   recorder.save();
   println("Done saving.");
   }
   */

  if (key == 'b' || key == 'B') 
  {
    Multiplier += 1;
  }
  if (key == 'v' || key == 'V') 
  {
    Multiplier -= 1;
  } 
  if (Multiplier == 0)
    Multiplier = 1;

  if (key == 'd' || key == 'D') 
  {
    upLimit += 10;
  }
  if (key == 'f' || key == 'F') 
  {
    upLimit -= 10;
  } 

  if (upLimit > height / 2)
    upLimit = height / 2;
  if (upLimit < 10)
    upLimit = 10;

  if (key == 'S' || key == 's')
    speed *= -1;
  if (key == 'q' || key == 'Q')
    doubleSpin = !doubleSpin;
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}


