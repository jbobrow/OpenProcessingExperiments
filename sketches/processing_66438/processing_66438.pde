


/**
 * Sine Wave
 * by Daniel Shiffman.  
 * 
 * Render a simple sine wave. 
 * original sketch in Processing examples
 */
 

import controlP5.*;

PImage gear;
float imgsize;

float sliderValue1 = 100;
float sliderValue2 = 100;
float sliderValue3 = 10;


//Slider abc;

int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float c = 0;
float t = 0;
int ctback;

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 300;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(1200,700);
  frameRate(30);
  colorMode(RGB,255,255,255,100);
  smooth();
  
  gear = loadImage("gearO.png");
  
  //slider config
  //slider1, frequency
    new ControlP5(this)
     .addSlider("sliderValue1")
     .setPosition(0,25)
     .setRange(0,1)
     .setSize(width, 15)
     .setLabelVisible(false)
     .setValue(.02)
      .setColorActive(100) 
      .setColorBackground(255)
      .setColorForeground(200)

     ;
  //slider2, amplitude 
    new ControlP5(this)
     .addSlider("sliderValue2")
     .setPosition(0,50)
     .setRange(0,255)
     .setSize(width, 15)
     .setLabelVisible(false)
     .setValue(255)
      .setColorActive(100)
      .setColorBackground(255)
      .setColorForeground(200)
     ;
    //slider3, wavelength
     new ControlP5(this)
     .addSlider("sliderValue3")
     .setPosition(0,75)
     .setRange(0, 5)
     .setSize(width,15)
     .setLabelVisible(false)
     .setValue(.02)
      .setColorActive(100) 
      .setColorForeground(200)
      .setColorBackground(255)
    // ?   .setImage(gear)
     //.setNumberOfTickMarks(5)
     ;
     
    //slider4, monad size 
    new ControlP5(this).addSlider("imgsize")
     .setPosition(0 ,100)
     .setRange(10, 200)
     .setSize(width,15)
     .setLabelVisible(false)
     .setValue(200)
      .setColorActive(100) 
      .setColorBackground(255)
      .setColorForeground(200);
    
  w = width+(xspacing*2);
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  // how many ellipses each line spans
  ctback = int((period/xspacing)/2);
}

void draw() {
  
  background(255);
  calcWave();
  renderWave();
  println(dx);
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta/*frequency*/ += sliderValue1;
  amplitude = sliderValue2;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  dx = sliderValue3;
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    c = 155;
    //alternate transparencies
    if (x%2 == 0){
       t = map(x, 0, yvalues.length, 0, 100);
    }
    
    fill(c,t);
    ellipseMode(CENTER);
    tint(150, 150, 100, 125);
    image(gear, x*xspacing - (imgsize/2), height/2+yvalues[x] - (imgsize/2),imgsize, imgsize);
  //  ellipse( x*xspacing - (imgsize/2), height/2+yvalues[x] - (imgsize/2),imgsize, imgsize);
    
    stroke(c,t);
    if(x > ctback) {
    line(x*xspacing, height/2 + yvalues[x], x*xspacing-(period/2), height/2 + yvalues[x-ctback]);

    }
  }
}

/*void slider(float sliderValue) {
  period = sliderValue;
  println(sliderValue);
}
*/

