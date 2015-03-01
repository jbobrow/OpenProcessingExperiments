
//PhrygianCluster
//by Brian Cantrell

import beads.*;
import controlP5.*;


ControlP5 cp5; //controller context
AudioContext ac; //audio context
Glide gainGlide; //slide controller for gain
Gain mGain;

float[] notes = {
  174.61, 185, 220, 223.08, 261.63, 277.18, 311.13, 349.23, 369.99
};
float vol = 0;
float theta = 30;
float x1, y1, x2, y2, x3, y3;
int count = 0;

//declare oscillator icon arrays
final static ArrayList<SinOsc> sinOscils = new ArrayList();
final static ArrayList<SquareOsc> squareOscils = new ArrayList();
final static ArrayList<TriOsc> triOscils = new ArrayList();


void setup() {
  frameRate(30);
  ac = new AudioContext();
  cp5 = new ControlP5(this);
  cp5.addSlider("vol")
    .setPosition(50, 270)
      .setRange(0., .001)
        .setSize(10, 300)
          ;

  size(1000, 800);
  smooth();
  noFill();

  //gain variable
  gainGlide = new Glide(ac, 0.0, 50);

  //initialize master gain
  mGain = new Gain(ac, 1, gainGlide);

  //patch gain into output
  ac.out.addInput(mGain);
  //start audio context
  ac.start();
}
void draw() {
  background(180, 180, 180);

  //set control for master gain
  gainGlide.setValue(vol);

  /*-----Pallette-----*/
  noStroke();
  fill(100, 100, 100);
  rectMode(CORNER);
  rect(80, 10, width-90, height-20);
  /*---End Pallette---*/

  /*------menu--------*/
  //panel
  rectMode(CORNER);
  noStroke();
  fill(180, 180, 180);
  rect(0, 0, 80, height);

  //Sine Oscillator Icon
  stroke(255, 255, 255, 200);
  noFill();
  ellipse(40, 60, 60, 60);
  fill(255, 255, 255, 200);
  ellipse(40, 60, 20, 20);

  //Triangle Oscillator Icon
  noFill();
  ellipse(40, 130, 60, 60);
  fill(255, 255, 255, 200);
  x1 = 40+10*cos(radians(theta));
  y1 = 130+10*sin(radians(theta));
  x2 = 40+10*cos(radians(theta)+TWO_PI/3.0);
  y2 = 130+10*sin(radians(theta)+TWO_PI/3.0);
  x3 = 40+10*cos(radians(theta)+TWO_PI/1.5);
  y3 = 130+10*sin(radians(theta)+TWO_PI/1.5);
  triangle(x1, y1, x2, y2, x3, y3);

  //Square Wave Oscillator Icon
  rectMode(CENTER);
  noFill();
  ellipse(40, 200, 60, 60);
  fill(255, 255, 255, 200);
  rect(40, 200, 15, 15);
  /*------end menu--------*/

  /*-----construct oscillator icons-----*/
  for (TriOsc b: triOscils) {  
    b.run();
    b.rollover(mouseX, mouseY);
    b.drag(mouseX, mouseY);
    b.modulate();
    b.changeVol(mouseX, mouseY);
  }
  for (SquareOsc b: squareOscils) {  
    b.run();
    b.rollover(mouseX, mouseY);
    b.drag(mouseX, mouseY);
    b.modulate();
    b.changeVol(mouseX, mouseY);
  }
  for (SinOsc b: sinOscils) {  
    b.run();
    b.rollover(mouseX, mouseY);
    b.drag(mouseX, mouseY);
    b.modulate();
    b.changeVol(mouseX, mouseY);
  }
  /*--------------------------------*/

  /*-----------check distance and make connections-------------*/
  //SinOsc
  for (SinOsc b: sinOscils) {
    for (SinOsc c: sinOscils) {
      if (b!=c) {
        b.connect(c);
      }
    }
    for (TriOsc d: triOscils) {
      b.connect(d);
    }
    for (SquareOsc e: squareOscils) {
      b.connect(e);
    }
  }
  //TriOsc
  for (TriOsc b: triOscils) {
    for (TriOsc c: triOscils) {
      if (b!=c) {
        b.connect(c);
      }
    }
    for (SquareOsc d: squareOscils) {
      b.connect(d);
    }
  }
  //SquareOsc
  for (SquareOsc b: squareOscils) {
    for (SquareOsc c: squareOscils) {
      if (b!=c) {
        b.connect(c);
      }
    }
  }

//Pulse
count++;
if (count >= 120) {
    for (SinOsc b: sinOscils) {
      b.pulseNote();
    }
    for (TriOsc b: triOscils) {
      b.pulseNote();
    }
    for (SquareOsc b: squareOscils) {
      b.pulseNote();
    }
    count = 0;
  }
  /*-----------------------------------------------------------*/
}
void mousePressed() {

  //add an object to pallette when its icon is clicked
  //Limit its connections
  //attach an audio oscillator

  if (mouseX > 20 && mouseX < 80 && mouseY > 20 && mouseY < 80) {
    if (sinOscils.size() < 4) {
      sinOscils.add(new SinOsc(random(200, 900), random(200, 600)));
      for (SinOsc a: sinOscils) {
        if (!a.attached) {
          int index = int(random(notes.length));
          a.attachOsc(new WavePlayer(ac, notes[index], Buffer.SINE), mGain, new Gain(ac, 1, 1./6.), new Gain(ac, 1, 1./6.), new Envelope(ac, 0.0));
        }
      }
    }
  }
  else if (mouseX > 20 && mouseX < 80 && mouseY > 80 && mouseY < 140) {
    if (triOscils.size() < 4) {
      triOscils.add(new TriOsc(random(200, 900), random(200, 600)));
      for (TriOsc b: triOscils) {
        if (!b.attached) {
          int index = int(random(notes.length));
          b.attachOsc(new WavePlayer(ac, notes[index], Buffer.SAW), mGain, new Gain(ac, 1, 1./6.), new Gain(ac, 1, 1./6.), new Envelope(ac, 0.0));
        }
      }
    }
  } 
  else if (mouseX > 20 && mouseX < 80 && mouseY > 140 && mouseY < 220) {
    if (squareOscils.size() < 4) {
      squareOscils.add(new SquareOsc(random(200, 900), random(200, 600)));
      for (SquareOsc c: squareOscils) {
        if (!c.attached) {
          int index = int(random(notes.length));
          c.attachOsc(new WavePlayer(ac, notes[index], Buffer.SQUARE), mGain, new Gain(ac, 1, 1./6.), new Gain(ac, 1, 1./6.), new Envelope(ac, 0.0));
        }
      }
    }
  }

  for (SinOsc b: sinOscils) {
    b.clicked(mouseX, mouseY);
  }
  for (TriOsc b: triOscils) {
    b.clicked(mouseX, mouseY);
  }
  for (SquareOsc b: squareOscils) {
    b.clicked(mouseX, mouseY);
  }
}
void mouseReleased() {
  //move the objects
  for (SinOsc b: sinOscils) {
    b.stopDragging();
  }
  for (TriOsc b: triOscils) {
    b.stopDragging();
  }
  for (SquareOsc b: squareOscils) {
    b.stopDragging();
  }
  for (SinOsc b: sinOscils) {
    b.volChanged = false;
  }
  for (TriOsc b: triOscils) {
    b.volChanged = false;
  }
  for (SquareOsc b: squareOscils) {
    b.volChanged = false;
  }
}
void keyPressed() {

  //if the x key is pressed on rollover, delete the object
  //and its associated audio oscillator

  if (key == 'x') {
    for (int i=sinOscils.size()-1; i>=0; i--) {
      SinOsc osc = sinOscils.get(i);
      if (abs(dist(mouseX, mouseY, osc.oscX, osc.oscY))<10) {
        osc.destroyOsc();
        sinOscils.remove(i);
      }
    }
    for (int i=triOscils.size()-1; i>=0; i--) {
      TriOsc osc = triOscils.get(i);
      if (abs(dist(mouseX, mouseY, osc.oscX, osc.oscY))<10) {
        osc.destroyOsc();
        triOscils.remove(i);
      }
    }
    for (int i=squareOscils.size()-1; i>=0; i--) {
      SquareOsc osc = squareOscils.get(i);
      if (abs(dist(mouseX, mouseY, osc.oscX, osc.oscY))<10) {
        osc.destroyOsc();
        squareOscils.remove(i);
      }
    }
  }
  
}

class Osc {

  float[] notes = {
    174.61, 185, 220, 223.08, 261.63, 277.18, 311.13, 349.23, 369.99
  };
  float oscX;
  float oscY;
  float w = 60;
  float h = 60;
  float rad = 20;
  float volRad = 60;
  boolean rollover = false;
  boolean dragging = false;
  boolean attached = false;
  boolean isConnected = false;
  boolean volChanged = false;
  WavePlayer osc;
  Gain g;
  Osc b;
  Gain thisGain;
  Gain envGain;
  Envelope thisEnv;
  
  Osc(float _x, float _y) {
    oscX = _x;
    oscY = _y;
  }
  void run() {
    display();
  }

  void display() {
    if (rollover) {
      fill(200);
    } 
    else { 
      fill(255);
    }
    ellipse(oscX, oscY, rad, rad);
    noFill();
    stroke(255);
    ellipse(oscX, oscY, w, h);
  }
  void rollover(int mx, int my) {
    if (mx < oscX+10 && mx > oscX-10 && my < oscY+10 && my > oscY-10) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void clicked(int mx, int my) {
    if (mx < oscX+10 && mx > oscX-10 && my < oscY+10 && my > oscY-10) {
      dragging = true;
    }
    if (mx > oscX+10 && mx < oscX+30 && my < oscY+30 && my > oscY-30) {
      volChanged = true;
    } 
    else { 
      volChanged = false;
    }
  }
  void changeVol(int mx, int my) {
    float offset = 0;
    if (volChanged) {
      offset = map(my, oscY+30, oscY-30, -1, 1);
    }
    volRad+=offset;
    if (volRad >= 60) {
      volRad = 60;
    } 
    else if (volRad <=0) {
      volRad =0;
    }
    fill(100, 200, 255, 50);
    ellipse(oscX, oscY, volRad, volRad);
    map(volRad, 0., 60., 0., .001);
    thisGain.setGain(volRad);
  }
  void drag(int mx, int my) {
    if (dragging) {
      oscX = mx;
      oscY = my;
    }
  }
  void stopDragging() {
    dragging = false;
  }
  void connect(Osc _b) {
    b = _b;
    if (abs(dist(oscX, oscY, b.oscX, b.oscY))<200) {
      isConnected = true;
      stroke(255);
      line(oscX, oscY, b.oscX, b.oscY);
    } 
    else { 
      isConnected = false;
    }
  }
  void attachOsc(WavePlayer _osc, Gain _g, Gain _thisGain, Gain _envGain, Envelope _thisEnv) {
    attached = true;
    osc = _osc;
    g = _g;
    thisGain = _thisGain;
    thisEnv = _thisEnv;
    envGain = _envGain;
    envGain.setGain(thisEnv);
    envGain.addInput(osc);
    thisGain.addInput(envGain);
    g.addInput(thisGain);
  }

  void modulate() {
    if (isConnected) {
      float prevFreq = osc.getFrequency();
      float freq;
      float dist = abs(dist(oscX, oscY, b.oscX, b.oscY));
      if (dist>180 && dist <= 200) {
        freq = notes[0];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      } 
      else if (dist < 180 && dist >= 160) {
        freq = notes[1];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      } 
      else if (dist < 160 && dist >= 140) {
        freq = notes[2];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      }
      else if (dist < 160 && dist >= 140) {
        freq = notes[3];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      }
      else if (dist < 140 && dist >= 120) {
        freq = notes[4];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      }
      else if (dist < 120 && dist >= 100) {
        freq = notes[5];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      } 
      else if (dist < 100 && dist >= 80) {
        freq = notes[6];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      } 
      else if (dist < 80 && dist >= 60) {
        freq = notes[7];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      } 
      else if (dist < 60) {
        freq = notes[8];
        osc.setFrequency(freq);
        b.osc.setFrequency(freq);
      } 


      if (oscX < b.oscX) {
        float modulator = (osc.getFrequency()*30);
        b.osc.setFrequency(modulator);
      } 
      else if (oscX > b.oscX) {
        float modulator = (osc.getFrequency()*30);
        b.osc.setFrequency(modulator);
      }
    }
  }

  void pulseNote(){
    thisEnv.addSegment(1.,2000);
    thisEnv.addSegment(0.15,2000);
  }
  void destroyOsc() {
    osc.kill();
  }
}

class SinOsc extends Osc {

  SinOsc(float _x, float _y) {
    super(_x, _y);

  }

  void display() {
    if (rollover) {
      fill(200);
    } 
    else { 
      fill(255);
    }
    ellipse(oscX, oscY, rad, rad);
    noFill();
    stroke(255);
    ellipse(oscX, oscY, w, h);
  }
}

class SquareOsc extends Osc {

  SquareOsc(float _x, float _y) {
    super(_x, _y);
    
  }

  void display() {
    if (rollover) {
      fill(200);
    } 
    else { 
      fill(255);
    }
    rect(oscX, oscY, 15, 15);
    noFill();
    stroke(255);
    ellipse(oscX, oscY, w, h);
  }
}

class TriOsc extends Osc {
  TriOsc(float _x, float _y) {
    super(_x, _y);
  }

  void display() {
    noFill();
    ellipse(oscX, oscY, 60, 60);
    if (rollover) {
      fill(200);
    } 
    else { 
      fill(255);
    }
    x1 = oscX+10*cos(radians(theta));
    y1 = oscY+10*sin(radians(theta));
    x2 = oscX+10*cos(radians(theta)+TWO_PI/3.0);
    y2 = oscY+10*sin(radians(theta)+TWO_PI/3.0);
    x3 = oscX+10*cos(radians(theta)+TWO_PI/1.5);
    y3 = oscY+10*sin(radians(theta)+TWO_PI/1.5);
    triangle(x1, y1, x2, y2, x3, y3);
  }
}



