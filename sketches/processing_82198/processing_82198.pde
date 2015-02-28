
import beads.*; // import the beads library
AudioContext ac; // create our AudioContext

// declare our unit generators
WavePlayer modulator;
Glide modulatorFrequency;
WavePlayer carrier;

// our envelope and gain objects
Envelope gainEnvelope;
Gain synthGain;

// Create an array for the circles
int[] xpos = new int[100];
int[] ypos = new int[100];


void setup() {
  size(800, 800);
  smooth();
  frameRate(20);
  background(255);

  for (int i = 0; i < xpos.length; i++) {
    xpos [1] = 0;
    ypos [1] = 0;
  }
  
  // initialize our AudioContext
  ac = new AudioContext();
  
  // create the modulator, this WavePlayer will control the frequency of the carrier
  modulatorFrequency = new Glide(ac, 20, 30);
  modulator = new WavePlayer(ac, modulatorFrequency, Buffer.SINE);

  // create a custom frequency modulation function
  Function frequencyModulation = new Function(modulator)
  {
    public float calculate() {
      // return x[0], scaled into an appropriate frequency range
      return (x[0] * 100.0) + mouseY;
    }
  };

  // create a second WavePlayer, control the frequency with the function created above
  carrier = new WavePlayer(ac, frequencyModulation, Buffer.SINE);

  gainEnvelope = new Envelope(ac, 0.0); // create the envelope object that will control the gain

  synthGain = new Gain(ac, 1, gainEnvelope); // create a Gain object, connect it to the gain envelope

  synthGain.addInput(carrier); // connect the carrier to the Gain input
  
  ac.out.addInput(synthGain); // connect the Gain output to the AudioContext
  
  ac.start(); // start audio processing
}

void draw() {
  background(255);
  
  modulatorFrequency.setValue(mouseX); // set the modulator frequency

  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = xpos [i+1];
    ypos[i] = ypos [i+1];
  }

  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY-100;

  for (int i = 0; i < xpos.length; i++) {
    stroke(i * 3);
    fill(i * 3);
    ellipse(xpos[i], ypos[i], i, i);
  }
}

void mousePressed()
{
  // when the mouse button is pressed, at a 50ms attack segment to the envelope
  // and a 300 ms decay segment to the envelope
  gainEnvelope.addSegment(0.8, 100); // over 50 ms rise to 0.8
  gainEnvelope.addSegment(0.0, 300); // over 300 ms return to 0.0
}


