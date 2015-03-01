
/* This is a quick spectral analyzer that has a bckground image, v3.2
 by Ventsislav Ivanov 2014
 */


//here we import the needed library - minim, if you don't have it, 
//in order to run the sketch you ll need to install it.

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

boolean buttonOver = false;
//boolean buttonOver2 = false; wont be using 2nd button for now
color currentColor;
String EQ1 = "EQ";
int rectX = 800;
int rectY = 650;

int rectColor, baseColor;
int rectSize = 45;
int rectHighlight;


PImage sketch; //the sketch behind is also made by me
void setup()
{
  rectColor = color(0);
  rectHighlight = color(51);
  ellipseMode(CENTER);
  size(960, 720, P3D);
  frameRate(25);
  sketch = loadImage("sketch.png");
  minim = new Minim(this);
  // minim read the input of your computer, if u have none,
  // you could install Soundflower and make the audio that is
  // runned by the system to be the input
  in = minim.getLineIn(Minim.STEREO, 1024);
  fft = new FFT(in.bufferSize(), in.sampleRate());
}
void draw()
{  
  fill(0, 122);
  //i'll scan for these frequencies and convert their amplitudes to variables
  float gF = fft.getFreq(100);
  float gF2 = fft.getFreq(80);
  float gS = fft.getFreq(300);
  //println (gS);
  noStroke();
  if (buttonOver) { //if the the mouse is over the button, the code will run these.
    // NB, check the boolean buttonOver below.
    if (gF > 15);
    {
      ellipse((960-840), 90, 1+(gF), 1+(gF));
    }
    if (gS >10 && gS < 22);
    {
      ellipse(840, (90), gS*4, gS*4);
    }
    //EQ like analyzer
    for (int i = 0; i < fft.specSize (); i+=3)
    {
      stroke(0);
      line(i, height - fft.getBand(i), i, height - fft.getBand(i)*32);
    }
  }
  update(mouseX, mouseY);
  image(sketch, 0, 0, 960, 720);
  fft.forward(in.mix);
  if (buttonOver) { // this changes the button color when hovering it.
    fill(#D8D8D8);
  } else {
    fill(#B9B9B9);
  }
  strokeWeight(1);
  rectMode(CENTER);
  stroke(3);
  text("EQ", 800, 650); // dont mind this wholed "block"
  strokeWeight(0.5);
  rect(rectX, rectY, rectSize, rectSize-15);
  stroke(255, 0, 0, 128);
  stroke(255);
  strokeWeight(1.2);
  for (int i = 0; i < in.left.size () - 1; i++)
  {
    line(i, 300 + in.left.get(i)*200, i+1, 300 + in.left.get(i+1)*200);
    line(i, 400 + in.right.get(i)*200, i+1, 400 + in.right.get(i+1)*200);
    constrain (i, 0, height);
  }
  if (mousePressed == true && buttonOver != false) {
    //two eclipses that get the frequnecies for their size,
    fill(0, 122);
    println (gS);
    noStroke();
    if (gF > 15 || gF2 > 10);
    {
      // constrain (gF,0,30);
      ellipse((960-840), 90, 1+(gF), 1+(gF));
    }
    if (gS >10 && gS < 22);
    {
      ellipse(840, (90), gS*4, gS*4);
    }
  }
}
void update(int x, int y) {
  rectX = 800;
  rectY = 650;
  rectSize = 45;

  if (overRect(rectX-18, rectY-11, rectSize, rectSize-11)) {
    buttonOver = true;
  } else {
    buttonOver = false;
  }
}
void mousePressed() {
  if (buttonOver) {
    //EQ like analizer
    for (int i = 0; i < fft.specSize (); i+=3)
    {
      stroke(0);
      line(i, height - fft.getBand(i), i, height - fft.getBand(i)*32);
    }
  }
}
boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}



