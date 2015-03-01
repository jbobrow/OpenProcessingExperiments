
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput input;

float amp;
float negAmp;

void setup()
{
  size(500, 500);
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO, 500);
}

void draw()
{
  background(0);
  amp = (input.left.get(0))*700;
  negAmp = -amp;
  
  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  
  fill(255, 100);
  ellipse(amp, negAmp, 100+negAmp, 100+negAmp);
  fill(random(0, 255), random(0, 255), random(0, 255), 220);
  ellipse(negAmp, amp, 100+amp, 100+amp);
  
  fill(255, 100);
  ellipse(-amp, negAmp, 100-negAmp, 100-negAmp);
  fill(random(0, 255), random(0, 255), random(0, 255), 220);
  ellipse(negAmp, -amp, 100-amp, 100-amp);
 
  
  popMatrix();


}



