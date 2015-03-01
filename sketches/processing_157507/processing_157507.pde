
//getLineIn()
//getLineIn(int type)
//getLineIn(int type, int bufferSize)
//getLineIn(int type, int bufferSize, float sampleRate)
//getLineIn(int type, int bufferSize, float sampleRate, int bitDepth)

int gap = 10;
float posX = 0;
float posY = 0;

float[] amp = new float[2000];
ArrayList<Float> list = new ArrayList<Float>();

import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(1080, 400, P3D);

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  background(0);
}

void draw()
{
  //background(0);
  //fill(0, 10) here the opacity 10 give people a fading effect
  fill(20, 10);
  rect(0, 0, width, height); 
  //rect(100, 50, width, height);

  float prevY = 0;
  float prevX = 0;
  for (int i = 0; i < in.bufferSize (); i++) {
    posX = i * 5;
    //y = A * sin (kx) + B
    //change 0.1 to adjust how delay you want it to be
    amp[i] += (in.left.get(i) * 50 - amp[i]) * 1.75;
    posY = (amp[i] + 5) * sin(0.05 * (posX + frameCount)) + 100; //add frame count to (posX) Only the Y coordinate changes
    //stroke(48, 171, 250, 200);
    noStroke();
    fill(48, 171, 250, 200);
    //line(posX, posY, posX, height);
    amp[i] += (in.left.get(i) * 50 - amp[i]) * 1.75;
    posY = (amp[i] + 5) * sin(0.05 * (posX + frameCount)) + 100;
    quad(posX, posY, posX, height/2, prevX, height/2, prevX, prevY);
     amp[i] += (in.right.get(i) * 50 - amp[i]) * 1.75;
    posY = (amp[i] + 10) * sin(0.05 * (posX + frameCount)) + 100;
    fill(0, 20, 175, 50);
    quad(posX*2, posY*2, posX, height, prevX, height, prevX, prevY);
    prevX = posX;
    prevY = posY;
//    sphere(1);
//    noStroke();
//    lights();
//    translate(40, 48, 29);
//    sphere(28);
    fill(230, 250, 250);
    ellipse(50, 70, 60, 60);
    //rect(posX, posY, 2, 2);
  }
  //String monitoringState = in.isMonitoring() ? "enabled" : "disabled";
  //text( "Input monitoring is currently " + monitoringState + ".", 5, 15 );
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



