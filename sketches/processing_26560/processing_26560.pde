
/**
 * Assignment 1
 * by Timothy Watt
 * SOMA 2607 - Intro to Interactive Media
 * Bachelor of Digital Media, COFA
 *
 * Code borrowed from "Simple_digitalCalligraphy" by
 * Petra Gemeinboeck and Rob Saunders (2009)
 *
 * Code borrowed from multiple 'minum' manual sketches at 
 * http://code.compartmental.net/tools/minim/
 *
 * EXPLAINATION *
 * This sketch is a 'broken', visualisation based audio player. Moving the mouse up
 * and down the y-axis controls a low-pass audio filter while pressing the transport
 * controls reveals that the time will skip forwards and backwards on its own accord.
 * Try and get to the end of the song!
 
 * Colour palette from << http://www.colourlovers.com/palette/1468646/SAM-side >>
 */

import ddf.minim.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer groove;
HighPassSP lpf;

PFont font;

float penX;
float penY;
float ppenX;
float ppenY;
float penStrokeWeight;

// For a differnt effect related to the brush stroke weight,
// play with these parameters:

// deltaXY controls how closely the pen tracks the mouse
float deltaXY = 0.05;
// deltaSW controls how quickly the stroke weight adapts
float deltaSW = 0.3;


void setup () {
  size(720, 420, P2D);
  smooth();

  minim = new Minim(this);
  groove = minim.loadFile("072 - Darwin Deez - Radar Detector.mp3");
  groove.loop();
  // make a low pass filter with a cutoff frequency of 100 Hz
  // the second argument is the sample rate of the audio that will be filtered
  // it is required to correctly compute values used by the filter
  lpf = new HighPassSP(100, groove.sampleRate());
  groove.addEffect(lpf);

  font = loadFont ("AngsanaNew-Bold-48.vlw");

  penX = width/2;
  penY = height/2;
  ppenX = width/2;
  ppenY = height/2;
  penStrokeWeight = 2;

  textFont(font, 40);
}


void draw() {
  /* Color Palette */
  color c1 = #0B0E13;
  color c2 = #061A23;
  color c3 = #245059;
  color c4 = #8CFFFF;
  color c5 = #E7FDFA;

  /* For timecode */
  int mil = groove.position()%1000;
  int s = (groove.position()/1000)%60;
  int m = (groove.position()/60000)%60;

  int mode = 0; /* eg/ play,pause,skip, etc. */

  /* For timeline */
  float position = map(groove.position(), 0, groove.length(), 0, width);

  // Fade the background every 20 frames
  if (frameCount % 20 == 0) {
    // Draw a transparent white rectangle
    println("TEst");
    noStroke();
    fill(c3, 16);
    rect(0, 0, width, height);
  }

  /* Design */
  noStroke();
  fill(c3);

  /* Digital Calligraphy */
  // Record the previous pen position for drawing next line
  ppenX = penX;
  ppenY = penY;
  // Adjust the current pen position towards the current mouse
  // position using easing method by the fraction deltaXY
  penX = penX + deltaXY * (mouseX - penX);
  penY = penY + deltaXY * (mouseY - penY);


  colorMode(RGB);
  // Caculate speed of mouse by calculating distance between
  // previous and current mouse positions (using "cityblock" distance)
  float mouseSpeed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);
  // Use the map function to calculate what the current stroke
  // weight should be based on speed
  float mouseStrokeWeight = map(mouseSpeed, 0, 150, 2, 40);
  // Adjust the current stroke weight towards what it should be
  // using easing method by the fraction deltaSW
  penStrokeWeight = penStrokeWeight + deltaSW * (mouseStrokeWeight - penStrokeWeight);

  // Set the stroke weight
  strokeWeight(penStrokeWeight);
  // Draw a black line
  stroke(0);
  noFill();
  line(ppenX, ppenY, penX, penY);

  /* Frequency follower */
  stroke(c4);
  strokeWeight(.5);
  line(0,0.8*mouseY+40,width,0.8*mouseY+40);

  /* Waveform */
  // we multiply the values returned by get by 50 so we can see the waveform
  for ( int i = 0; i < groove.bufferSize() - 1; i++ )
  {
    float x1 = map(i, 0, groove.bufferSize(), 0, width);
    float x2 = map(i+1, 0, groove.bufferSize(), 0, width);
    stroke(c4);
    strokeWeight(.5);
    line(x1, 3*height/4+30 - groove.left.get(i)*380, x2, 3*height/4+30 - groove.left.get(i+1)*380);
    strokeWeight(3);
    if (mousePressed == true) {
      stroke(#FF0000);
    } 
    else {
      stroke(255);
    }
    line(x1, 0.9*height/2 - groove.left.get(i)*130, x2, 0.9*height/2 - groove.left.get(i+1)*130);
  }

  /* timeline */
  stroke(c1);
  fill(c5);
  rect(1, height-25, width-3, 22);
  /* -- progress bar */
  noStroke();
  if (mousePressed == true) {
    fill(#FF0000);
  } 
  else {
    fill(c4);
  }
  rect(3, height-24, position,20);
  stroke(c2);
  strokeWeight(2);
  line(position+2, height-24, position+2, height-3);
  strokeWeight(1);
  
  /* -- counter + mode icon container */
  noStroke();
  fill(c2);
  rect(2, height-75, width-4, 50);
  fill(c1);
  rect(2, height-75, width-4, 5);
  rect(2, height-30, width-4, 5);
  stroke(c1);
  line(2, height-69, width-4, height-69);
  line(2, height-32, width-4, height-32);
  pushMatrix();
  stroke(c1);
  translate(2, height-75);
  for (int x=0; x<width; x+=15) {
    line(x,0,x+15,50);
  }
  popMatrix();
  
  /* -- counter */
  fill(c1);
  rect(4,height-67, 120, 33);
  noFill();
  stroke(c2);
  rect(5,height-66, 118, 31);
  pushMatrix();
  translate(15, height-43);
  fill(c5);
  text(m + ":" + s + ":" + mil, 0,0);
  popMatrix();

  /* MOUSE CLICKED RANDOM EVENTS */
  mode = int(random(1,5));
  int change = int(false);
  if (mousePressed == true || ((groove.position()/300)%50) >= 30) {

    if ((mouseX>681) & (mouseX<703) & (mouseY>356) & (mouseY<382)) {
      groove.pause();
      groove.cue(0);
    } 
    else if (mode == 1 & (groove.position()<=groove.length()-10000)) {
      groove.skip(1500+int(random(1,8500)));
      groove.play();
    } 
    else if (mode == 2 & (groove.position()>=10000)) {
      groove.skip(-1500-int(random(1,8500)));
      groove.play();
    } 
    else if (mode == 3) {
      groove.play();
    } 
    else if ((mode == 4) & (mouseX>621) &(mouseX<643) & (mouseY>356) & (mouseY<382)) {
      groove.pause();
    }
    change = int(true);
  }

  /* ICONS */
  pushMatrix();
  translate(width-155, height-61);
  /* -- mode icon RWD */
  if ((mousePressed == true || change == int(true)) & mode == 2) {
    fill(#FF0000);
  } 
  else {
    fill(c5);
  }
  rect(-4,-3,22,26);
  fill(c1);
  triangle(5,20,5,0,-2,10);
  triangle(15,20,15,0,8,10);
  /* -- mode icon PLAY */
  translate(30, 0);
  if ((mousePressed == true || change == int(true)) & mode == 3) {
    fill(#FF0000);
  } 
  else {
    fill(c5);
  }
  rect(-4,-3,22,26);
  fill(c1);
  triangle(0,20,0,0,16,10);
  /* -- mode icon PAUSE */
  translate(30, 0);
  if ((mousePressed == true || change == int(true)) &mode == 4) {
    fill(#FF0000);
  } 
  else {
    fill(c5);
  }
  rect(-4,-3,22,26);
  fill(c1);
  rect(0,2,6,16);
  rect(8,2,6,16);
  /* -- mode icon FFW */
  translate(30, 0);
  if ((mousePressed == true || change == int(true)) & mode == 1) {
    fill(#FF0000);
  } 
  else {
    fill(c5);
  }
  rect(-4,-3,22,26);
  fill(c1);
  triangle(0,20,0,0,7,10);
  triangle(10,20,10,0,17,10);
  /* -- mode icon STOP */
  translate(30, 0);
  if (mousePressed == true & (mouseX>-4) & (mouseX<22) & (mouseY>-3) & (mouseY<26)) {
    fill(#FF0000);
  } 
  else {
    fill(c5);
  }
  fill(c5);
  rect(-4,-3,22,26);
  fill(c1);
  rect(0,2,14,16);
  popMatrix();

  /* mini color palette
   pushMatrix();
   translate(1, mouseY/2+50);
   //stroke(0);
   noStroke();
   noFill();
   rect(-1,-1,21,101);
   noStroke();
   fill(c1);
   rect(0,0,20,20);
   translate(0,20);
   fill(c2);
   rect(0,0,20,20);
   translate(0,20);
   fill(c3);
   rect(0,0,20,20);
   translate(0,20);
   fill(c4);
   rect(0,0,20,20);
   translate(0,20);
   fill(c5);
   rect(0,0,20,20);
   translate(0,20);
   popMatrix();
   */
  /* TOOOLS */
  println("Mouse X - " + mouseX);
  println("Mouse Y - " + mouseY);
  println("MouseStrokeWEIGHT" + mouseStrokeWeight);
}

void mouseMoved()
{
  // map the mouse position to the range [20, 1000], an arbitrary range of cutoff frequencies
  float cutoff = map(mouseY, 0, height, 20, 5000);
  lpf.setFreq(cutoff);
}

void keyPressed()
{
  if ( key == '+' )
  {
    groove.play();
  }
  if ( key == 'p' )
  {
    groove.pause();
  }
  if ( key == 's' )
  {
    groove.cue(0);
  }
  if ( key == 'r' ) 
  {
    groove.rewind();
  }
  if ( key == ']' )
  {
    groove.skip(500);
  }
  if ( key == '[' )
  {
    groove.skip(-500);
  }
}

void stop()
{
  // always close Minim audio classes when you finish with them
  groove.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}


