
/**
 * This sketch demonstrates how to monitor the currently active audio input 
 * of the computer using an <code>AudioInput</code>. What you will actually 
 * be monitoring depends on the current settings of the machine the sketch is running on. 
 * Typically, you will be monitoring the built-in microphone, but if running on a desktop
 * its feasible that the user may have the actual audio output of the computer 
 * as the active audio input, or something else entirely.
 * <p>
 * When you run your sketch as an applet you will need to sign it in order to get an input. 
 */

import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(800, 600);

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();

  // uncomment this line to *hear* what is being monitored, in addition to seeing it
  //  in.enableMonitoring();
}

void draw()
{
  background(0);
  stroke(255);
  ellipse(width/2, height/2, 300, 400);
  fill(0);
  ellipse(330, 200, 50, 50);
  ellipse(460, 200, 50, 50);
  line(380, 200, 360, 300);
  line(400, 200, 420, 300);
  // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    //    line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    //    line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
    //    stroke(in.right.get(i)*100);
    //    fill(in.right.get(i)*100);
    line(360, 300, 420, 300);
    float lm = lerp(310, 350+ 50*in.left.get(i), random(0, 0.5));
    float rm = lerp(310, 350+ 50*in.right.get(i), random(0, 0.5));
    line(320, lm, 480, rm);
    stroke(255);
    fill(0);
    ellipse(width/2, height/2+100, 200* in.left.get(i), 200* in.right.get(i));
  }
  println(mouseX +" "+mouseY);
}

