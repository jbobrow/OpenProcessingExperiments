
import ddf.minim.*;

Minim minim;
AudioInput in;
AudioRecorder recorder;

void setup() {

  size(600, 600, P2D);
  smooth();

  frameRate(15);
  textMode(SCREEN); 

  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 600);

  recorder = minim.createRecorder(in, "myrecording.wav", true);
  textFont(createFont("Helvetica", 12));
}

void draw()
{
  background(0);

  // draw the waveforms
  for (int i = 0; i < in.bufferSize()-1 ; i++)
  {
    stroke(255);
    //horizontal
    line(i+400, 300+ in.left.get(i)*50, i+400, 280 + in.left.get(i+1)*50);
    line(i-418, 300+ in.left.get(i)*50, i-418, 280 + in.left.get(i+1)*50);

    //vertical
    line(200+ in.left.get(i)*50, i, 180 + in.left.get(i+1)*50, i+1);
    line(400+ in.left.get(i)*50, i, 380 + in.left.get(i+1)*50, i+1);
  }

  if ( recorder.isRecording() )
  {
    text("Currently recording...", 5, 15);
  }
  else
  {
    text("Not recording.", 5, 15);
  }
}

void keyReleased()
{
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
  if ( key == 's' )
  {

    recorder.save();
    println("Done saving.");
  }
}


void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}


