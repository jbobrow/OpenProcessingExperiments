
/**
 * spxlIris
 * 2010-02-14 by subpixel
 * http://subpixels.com
 *
 * Audio reactive (using minim.getLineIn)
 * Likely will not react to audio as an applet
 *
 * Controls:
 * [MouseX] scale
 * [UP/DOWN] increase/decrease opacity
 * [f] toggle flip (quads or bow-ties)
 */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

final int numRings = 5;
final int numFilaments = 32;

Ring[] rings;
Filament[] filaments;

boolean paused = false;
boolean doFlip = true; // flip adjacent filaments (makes bow-ties)?
int opacity = 100;

void setup()
{
  size(500, 500, JAVA2D);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.linAverages(numFilaments * 2);

  filaments = new Filament[numFilaments];
  for (int i = 0; i < numFilaments; i++)
  {
    filaments[i] = new Filament();
  }
  
  int sign = 1;
  rings = new Ring[numRings];
  for (int i = 0; i < numRings; i++)
  {
    rings[i] = new Ring(30 * (i + 3), random(TWO_PI), sign * random(0.001, 0.002));
    sign = -sign;
  }
  
  noStroke();
}

void draw()
{
  fft.forward(in.mix);
  if (paused) return;
  
  background(0);
  
  translate(width/2, height / 2);

  float angleStep = TWO_PI / numFilaments;
  float thisStep;

  float r1, theta1, cos1, sin1;
  float r2, theta2, cos2, sin2;
  float xb, yb, x1, y1, x2, y2;
  float reaction;
  int flip;

  for (int ringNo = 0; ringNo < numRings; ringNo++)
  {
    Ring ring = rings[ringNo];
    
    ring.update();
    
    r1 = ring.radius * (abs(2 * mouseX - width) + 10) / width;

    beginShape(QUAD_STRIP);
    
    theta1 = ring.rotation;
    thisStep = 2 * angleStep * (ringNo + 3) / (numRings + 3);

    flip = 1;
    for(int i = 0; i <= numFilaments; i++)
    {
      // Note: repeat first filament (index 0) at the end
      int index = i % numFilaments;
      if (index == 0) theta1 = ring.rotation;
      
      Filament filament = filaments[index];
      cos1 = cos(theta1);
      sin1 = sin(theta1);
      xb = r1 * cos(theta1);
      yb = r1 * sin(theta1);
      
      if (ringNo == 0)
      {
        reaction = fft.getAvg(index) + fft.getAvg(numFilaments - 1 - index);
        reaction = sqrt(log(reaction * 10 + 1)) * 20 + 5;
        reaction = max(reaction, lerp(filament.reaction, reaction, 0.1));
        filament.reaction = reaction;
      }
      else
      {
        // Already calculated
        reaction = filament.reaction;
      }
      
      theta2 = theta1;// + reaction * 0.1;
      cos2 = cos(theta2);
      sin2 = sin(theta2);

      if (i % 2 != 0)
      {
        noFill();
      }
      else
      {
        fill(0, 100, 255 / (ringNo + 1), opacity);
      }

      r2 = -flip * reaction;
      x1 = xb + r2 * cos2;
      y1 = yb + r2 * sin2;
      vertex(x1, y1);

      r2 = + flip * reaction;
      x2 = xb + r2 * cos2;
      y2 = yb + r2 * sin2;
      vertex(x2, y2);

      if (doFlip)
        flip = -flip;

      thisStep = 2 * angleStep - thisStep;
      theta1 += thisStep;
    }
    endShape();
  }
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  in.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}

void keyPressed()
{
  if (key == CODED) switch(keyCode)
  {
    case UP:   opacity = (int)constrain(opacity * 1.1, 20, 255); break;
    case DOWN: opacity = (int)constrain(opacity * 0.9, 20, 255); break;
  }
  else switch(key)
  {
    case ' ': paused ^= true; break;
    case 'f': doFlip ^= true; break;
  }
}

class Filament
{
  float reaction  = 0;
  float baseAngle = 0;  // Not currently used
}

class Ring
{
  float radius;
  float rotation;
  float rotationSpeed;

  public Ring(float radius, float initialRotation, float rotationSpeed)
  {
    this.radius = radius;
    this.rotation = initialRotation;
    this.rotationSpeed = rotationSpeed;
  }
  
  public void update()
  {
    rotation += rotationSpeed;
  }
}


