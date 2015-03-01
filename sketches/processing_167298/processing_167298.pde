
int counter;

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
// built with
//   processing 1.5 - http://www.processing.org/
//   


//-------------------------------------
class Pendulum {
  // physical params
  int index;
  float freq;      // oscilations per second

  // physical vars
  float pos;       // position of pendulum (-1...1)
  float vel;       // current velocity

  // musical params
  int pitch;      // midi note number to trigger

  // display params
  float hit;      // 0...1, how recently we 'hit' the edge

  // contructor
  Pendulum(int _index, float _freq, int _pitch) {
    index = _index;
    freq = _freq;
    pitch = _pitch;
    pos = 1;
    vel = 0;
    hit = 0;
  }

  // update position and trigger sound if nessecary
  void update(float t) {
    float oldPos = pos;     // save old position
    float oldVel = vel;     // save old direction

    pos = cos(freq * t * 2 * PI);  // calculate new position
    vel = pos - oldPos;            // calculte new direction

    if (vel * oldVel <= 0.0) {     // if pendulum has changed direction...
      playMidiNote(index, pitch, pos < 0 ? 0 : 127);
      hit = 1;
    } 
    else {
      hit *= 0.85;
    }
  }

  // draw
  void draw(float y, float size) {
    // set color
    float r = lerp(30, 255, hit);
    float g = lerp(30, 0, hit);
    float b = lerp(30, 0, hit);
    fill(r, g, b);

    // draw circle
    ellipse(map(pos, -1, 1, size/2, width-size/2), y, size, size);
  }
};


//-------------------------------------


final int numPendulums = 15;
Pendulum[] pendulums;

float startTime;

// Zirguleli Hicaz
//int musicscale[] = { 0, 1, 4, 5, 7, 8, 11 };
//int scaleNoteCount = 7;

int musicscale[] = { 
  0, 3, 5, 7, 10
};
int scaleNoteCount = 5;

//-------------------------------------
void setup() {
  size(250, 720);
  background(0);
  frameRate(60);
  noStroke();

  // create array of pendulums
  pendulums = new Pendulum[numPendulums];

  // loop through and init each pendulum
  for (int c=0; c<numPendulums; c++) {
    // first pendulum oscillates 51 times per minute
    // each successive has one more oscillation per minute
    float freq = (51.0 + c)/60.0;

    // pick the next midi note from the musicscale array, wrapping around (and increasing octave) as nessecary
    int midiNote = musicscale[c%scaleNoteCount] + (c/scaleNoteCount)*12 + 48;

    // init pendulum instance
    pendulums[c] = new Pendulum(c, freq, midiNote);
  }

  // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
//  myBus = new MidiBus(this, -1, "Java Sound Synthesizer"); 
  // UNCOMMENT FOR SOUND / MIDI
//myBus = new MidiBus(this, -1, 0); 

  // save time we have finished the setup, to ensure pendulums start at t==0
  startTime = millis() * 0.001;
}


//-------------------------------------
void draw() {
  background(0);
  
  // size to draw pendulum
  float pendulumSize = height * 1.0 / numPendulums;
  
  // seconds since we started the app (minus setup time)
  float secs = millis() * 0.001 - startTime;
  
  // loop through, update and draw pendulums
  for (int c=0; c<numPendulums; c++) {
    pendulums[c].update(secs);
    pendulums[c].draw(map(c, 0, numPendulums-1, pendulumSize/2, height - pendulumSize/2), pendulumSize);
  }
}


//-------------------------------------
void playMidiNote(int channel, int pitch, int pan) {
  int velocity = (int)random(50, 100);
  // UNCOMMENT FOR SOUND / MIDI
  //myBus.sendControllerChange(channel, 10, pan);  // set pan
  //myBus.sendNoteOff(channel, pitch, 0); // Send a Midi nodeOff
  //myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
}


//-------------------------------------
void keyPressed() {
    startTime = millis() * 0.001;
}
