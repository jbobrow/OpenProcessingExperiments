
//FM Curves takes user input with a simple FM patch 
//and manipulates a series of Bezier curves with 
//trig functions.

//declare audio elements
import beads.*;
AudioContext ac; 
float gainset = 0.3;
Gain g = new Gain(ac, 1, gainset);

WavePlayer modulator; 
Glide modFreq; 
WavePlayer carrier; 

KeyMap keys;

//declare sliders
Slider carslide, modslide, pointslide, volumeslide, scaleslide;
String carinfo, modinfo, pointinfo;

//declare font
PFont helvetica;

//initial variables
int pointnum = 250;
float rad = 50;
float cfreq = 220.0;
float mfreq = 1.0;

//declare signal visualizer and initialize
Fm3D visualizer;

//slider colors
color slidebg;
color slide;

//incrementers
float a = 0;
float b = 0;

//x, y, z coordinate arrays
float[] x = new float[pointnum];
float[] y = new float[pointnum];
float[] z = new float[pointnum];

//bezier intermediate points
float x1, y1, z1;

void setup() {
  size(640, 480, P3D);
  colorMode(HSB, 100);
  
  //initialize keymap
  keys = new KeyMap();
  
  // initialize beads audio parameters
  ac = new AudioContext(); 
  modFreq = new Glide(ac, 20, 30); 
  modulator = new WavePlayer(ac, modFreq, Buffer.SINE); 
  Function frequencyModulation = new Function(modulator) { 
    public float calculate() { 
      //link carrier frequency variable to audio generator (carrier freq is the offset)
      return (x[0] * 200.0) + cfreq;
    }
  };
  carrier = new WavePlayer(ac, frequencyModulation, Buffer.SINE); 
  
  // set gain level to a gainset variable controled by the volume slider
  g = new Gain(ac, 1, gainset);
  g.addInput(carrier); 
  ac.out.addInput(g); 
  ac.start();

  //initializing frequency modulation visualizer
  // params: (increment, carrier frequency, modulation frequency, amplitude/radius)
  visualizer = new Fm3D(a, cfreq, mfreq, rad);

  //font
  helvetica = loadFont("helvetica.vlw");

  //set slider colors
  slide = #BED8BF;
  slidebg = #3D463D;
  
  //x, y, w, h, bgcolor, slider color
  carslide = new Slider(25, 35, 90, 25, slidebg, slide);
  modslide = new Slider(25, 85, 90, 25, slidebg, slide);
  pointslide = new Slider(25, 135, 90, 25, slidebg, slide);
  volumeslide = new Slider(width - 50, 35, 25, 100, slidebg, slide);
  scaleslide = new Slider(width - 50, 200, 25, 100, slidebg, slide); 
}

void draw() {
  background(100, 0, 95);
  lights();
  //change volume with slider using gainset variable
  g.setGain(gainset);
  //link audio generator to mfreq variable  
  modFreq.setValue(mfreq);
  
  //display data
  carinfo = "carrier frequency: " + nf(cfreq, 1, 2);
  modinfo = "modulation frequency: " + nf(mfreq, 1, 2);
  pointinfo = "curves: " + pointnum;
  pushStyle();
  textFont(helvetica);
  textSize(12);
  fill(100, 0, 0);

  carslide.makeH();
  carslide.checkH();
  carslide.labelH(carinfo);

  modslide.makeH();
  modslide.checkH();
  modslide.labelH(modinfo);

  pointslide.makeH();
  pointslide.checkH();
  pointslide.labelH(pointinfo);
  
  volumeslide.makeV();
  volumeslide.checkV();
  volumeslide.labelV("vol:");
  
  scaleslide.makeV();
  scaleslide.checkV();
  scaleslide.labelV("scale:");
  
  popStyle();

  //line slider values to frequencies and point number
  //set range
  cfreq = carslide.getH(220, 2200);
  mfreq = modslide.getH(1, 1000);
  pointnum = int(pointslide.getH(2, 250));
  gainset = volumeslide.getV(0, 0.5);
  float scaleval = scaleslide.getV(0, 2);
  
  //map keyboard keys to events
  float keyScaleA = map(keys.updateRowA(), 1, 9, 1, 3);
  float keyScaleZ = map(keys.updateRowZ(), 1, 7, 1, 10);
  if(keyPressed){
  cfreq = cfreq*keyScaleA;
  mfreq = mfreq*keyScaleZ;
    switch(key){
    case 'q': mfreq = keys.sine('q', b, mfreq/4) + mfreq;
    break;
    case 'w': cfreq = keys.sine('w', a, cfreq/10) + cfreq;
    break;
    case 'e': mfreq = keys.noisy('e', a, b, 25) + mfreq;
    break;
    case 'r': cfreq = keys.noisy('r', a, b, 25) + cfreq;
    break;
    case 't': cfreq = 220;
    break;
    case 'y': cfreq = 440;
    break;
    case 'u': cfreq = 660;
    break;
    case 'i': cfreq = 880;
    break;
    case 'o': cfreq = keys.noisy('o', a, b, cfreq);
    break;
    case 'p': mfreq = keys.noisy('p', a, b, mfreq);
    }
   a+= 0.05;
   b+= 0.03;
  }
  //display keyboard viewer
  keys.makeRowQ(50, height-25, 15, 15, slidebg, slide);
  keys.makeRowA(215, height-25, 15, 15, slidebg, slide);
  keys.makeRowZ(365, height-25, 15, 15, slidebg, slide);
    
//set point coordinates
  for (int i = 0; i < pointnum; i++) {
      x[i] = visualizer.calcX(i, cfreq, mfreq, rad);
      y[i] = visualizer.calcY(i, cfreq, mfreq, rad);
      z[i] = visualizer.calcZ(i, cfreq, mfreq, rad);   
  }

  pushMatrix();
  translate(width/2, height/2);
    scale(scaleval);
  rotateY(radians(frameCount));

//draw 3D wave point sphere
  //alter colors based on input
 float amp = map(cfreq, 220, 1200, -2, 2);
 float hueMap = map(mfreq, 1, 1000, 0, 100);
 float satMap = map(cfreq, 200, 1200, 50, 100);
 float briMap = map(pointnum, 0, pointnum, 80, 100);
 fill(hueMap, satMap, briMap, 75);
 noStroke();
  for (int i = 0; i < pointnum; i++ ) {
    bezier(x1, y1, z1, 
    amp*x1*cos(i), y1*sin(i), amp*z1*cos(i),
    x1*sin(i), amp*y1*cos(i), z1*sin(i), 
    x[i], y[i], z[i]);
    
    x1 = visualizer.calcX(i, cfreq, mfreq, rad);
    y1 = visualizer.calcY(i, cfreq, mfreq, rad);
    z1 = visualizer.calcZ(i, cfreq, mfreq, rad);
  }
  popMatrix();
}

