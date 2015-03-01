
/**
 * This sketch demonstrates how to monitor the currently active audio input 
 * of the computer using an AudioInput. What you will actually 
 * be monitoring depends on the current settings of the machine the sketch is running on. 
 * Typically, you will be monitoring the built-in microphone, but if running on a desktop
 * it's feasible that the user may have the actual audio output of the computer 
 * as the active audio input, or something else entirely.
 * <p>
 * Press 'm' to toggle monitoring on and off.
 * <p>
 * When you run your sketch as an applet you will need to sign it in order to get an input.
 * <p>
 * For more information about Minim and additional features, 
 * visit http://code.compartmental.net/minim/ 
 */

import ddf.minim.*;

Minim minim;
AudioInput in;
 float promedio = 0;
 int pums = 0;
 boolean arriba=false;
void setup()
{
  size(512, 200, P3D);

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
 
}

void draw()
{
  background(0);
  stroke(255);

  // draw the waveforms so we can see what we are monitoring
  /*  for(int i = 0; i < in.bufferSize() - 1; i++)
   {
   line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
   line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
   }*/
  float amplitud = in.mix.get(0);
  rect(0,amplitud*500,10,10);
  promedio = (promedio*0.99)+(amplitud*0.01);
   rect(100,promedio*500,10,10);
//  println(amplitud);
//println(abs(amplitud-promedio));
if(abs(amplitud-promedio)>0.09){
  pums++;
  
  fill(255,0,0);
}else{
   fill(255);
   if(pums>0){
    // pums--;
   }
   println(pums);
   if(pums>20){
     pums=0;
   }
}
  String monitoringState = in.isMonitoring() ? "enabled" : "disabled";
  text( "Input monitoring iscurrently " + monitoringState + ".", 5, 15 );
}

void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    } else
    {
      in.enableMonitoring();
    }
  }
}



