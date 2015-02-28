
//CREDITS
//Song: Harder Better Faster Stronger
//Artist: Daft Punk

//INSTRUCTIONS
//The background beat loops (.wav file looped smoother than .mp3)
//Keypresses 1-8 play "Work it", "Make It", "Do It"...
//Keypresses Q,R plays vocal runs (half-loop size)
//Keypress E plays vocal run (full-loop size)

import ddf.minim.*;
import ddf.minim.signals.*;

//load minim, audio player, and metadata 
Minim minim;
AudioPlayer mysound;
AudioMetaData meta;

//audio samples
AudioSample one;
AudioSample two;
AudioSample three;
AudioSample four;
AudioSample five;
AudioSample six;
AudioSample seven;
AudioSample eight;
AudioSample nine;
AudioSample ten;
AudioSample eleven;

//vars
color bgColor = 0;
float mapIt;
float mapIt300;
int position;
int x = 0;
int beat;
float colorValue;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(800, 600, P2D);

  //load audio files
  minim = new Minim(this); 
  mysound = minim.loadFile("beat1.wav");
  one = minim.loadSample("1.mp3");
  two = minim.loadSample("2.mp3");
  three = minim.loadSample("3.mp3");
  four = minim.loadSample("4.mp3");
  five = minim.loadSample("5.mp3");
  six = minim.loadSample("6.mp3");
  seven = minim.loadSample("7.mp3");
  eight = minim.loadSample("8.mp3");
  nine = minim.loadSample("9.mp3");
  ten = minim.loadSample("10.mp3");
  eleven = minim.loadSample("11.mp3");

  //load meta and loop
  meta = mysound.getMetaData();   // load the MP3
  mysound.loop();
}

void draw() {  
  //set music position
  position = mysound.position();

  //meta length of song and half the length
  float metaLength = meta.length();
  float secondHalf = meta.length() * 0.5;
  
  //beat detector, adds to HSB brightness value on beats
  if ( mysound.left.level() > 0.35 ) {
    beat = 15;
  } else {
    beat = 0;
  }

  //if playing the second half of the loop
  if (position > secondHalf) {
    //map song position to different ranges
    mapIt = map(position, secondHalf, metaLength, 0, 360);
    mapIt300 = map(position, secondHalf, metaLength, 0, 300);
    
    //background hue changes based on position in 2nd half of loop, with beat detection on brightness
    background(mapIt, 80, 60 + beat);
    //stroke hue changes based on position in 2nd half of loop
    stroke(mapIt, 90, 90);

    //draw soundwaves - y position changes +-300 based on position in 2nd half of loop
    for (int i = 0; i < mysound.bufferSize() - 1; i++) { 
      line(i, 150 + mapIt300 + mysound.left.get(i)*100, i+1, 150 + mapIt300 + mysound.left.get(i+1)*100);
      line(i, 450 - mapIt300 + mysound.right.get(i)*100, i+1, 450 - mapIt300 + mysound.right.get(i+1)*100);
    }
  } 
  //if playing the first half of the loop
  else {
    //hue (colorValue) relies on samples triggered by user, plus beat detection on brightness
    background(colorValue, 80, 60+beat);
    stroke(255);
    //draw soundwaves
    for (int i = 0; i < mysound.bufferSize() - 1; i++) {
      line(i, 150 + mysound.left.get(i)*100, i+1, 150 + mysound.left.get(i+1)*100);
      line(i, 450 + mysound.right.get(i)*100, i+1, 450 + mysound.right.get(i+1)*100);
    }
  }
  
  //stroke characteristics
  strokeWeight(2);
  stroke(255);

  //WORK IT - center waveform when played
  for (int i = 0; i < one.bufferSize() - 1; i++) {
    line(i, 300 + one.left.get(i)*100, i+1, 300 + one.left.get(i+1)*100);
  }

  //MAKE IT - center waveform when played
  for (int i = 0; i < two.bufferSize() - 1; i++) {
    line(i, 300 + two.left.get(i)*100, i+1, 300 + two.left.get(i+1)*100);
  }

  //DO IT - center waveform when played
  for (int i = 0; i < three.bufferSize() - 1; i++) {
    line(i, 300 + three.left.get(i)*100, i+1, 300 + three.left.get(i+1)*100);
  }

  //MAKES US - center waveform when played
  for (int i = 0; i < four.bufferSize() - 1; i++) {
    line(i, 300 + four.left.get(i)*100, i+1, 300 + four.left.get(i+1)*100);
  }
  
  //HARDER - center waveform when played
  for (int i = 0; i < five.bufferSize() - 1; i++) {
    line(i, 300 + five.left.get(i)*100, i+1, 300 + five.left.get(i+1)*100);
  }
  
  //BETTER - center waveform when played
  for (int i = 0; i < six.bufferSize() - 1; i++) {
    line(i, 300 + six.left.get(i)*100, i+1, 300 + six.left.get(i+1)*100);
  }
  
  //FASTER - center waveform when played
  for (int i = 0; i < seven.bufferSize() - 1; i++) {
    line(i, 300 + seven.left.get(i)*100, i+1, 300 + seven.left.get(i+1)*100);
  }
  
  //STRONGER - center waveform when played
  for (int i = 0; i < eight.bufferSize() - 1; i++) {
    line(i, 300 + eight.left.get(i)*100, i+1, 300 + eight.left.get(i+1)*100);
  }
  
  //SIMPLE RUN 1 - center waveform when played
  for (int i = 0; i < nine.bufferSize() - 1; i++) {
    line(i, 300 + nine.left.get(i)*100, i+1, 300 + nine.left.get(i+1)*100);
  }
  
  //SIMPLE RUN 2 - center waveform when played
  for (int i = 0; i < ten.bufferSize() - 1; i++) {
    line(i, 300 + ten.left.get(i)*100, i+1, 300 + ten.left.get(i+1)*100);
  }
  
  //CHOPPY RUN - center waveform when played
  for (int i = 0; i < eleven.bufferSize() - 1; i++) {
    line(i, 300 + eleven.left.get(i)*100, i+1, 300 + eleven.left.get(i+1)*100);
  }
  
}//end draw function

void keyPressed() {
  
  //SAMPLES VIA KEYPRESSED 1-8, Q, W, E
  
  if (key == '1') {
    one.trigger();
    colorValue = 0;
  }  
  else if (key == '2') {
    two.trigger();
    colorValue = 45;
  }
  else if (key == '3') {
    three.trigger();
    colorValue = 60;
  }
  else if (key == '4') {
    four.trigger();
    colorValue = 90;
  }
  else if (key == '5') {
    five.trigger();
    colorValue = 120;
  } 
  else if (key == '6') {
    six.trigger();
    colorValue = 150;
  } 
  else if (key == '7') {
    seven.trigger();
    colorValue = 180;
  } 
  else if (key == '8') {
    eight.trigger();
    colorValue = 210;
  } 
  else if (key == 'q') {
    nine.trigger();
    colorValue = random(0, 180);
  } 
  else if (key == 'w') {
    ten.trigger();
    colorValue = random(180, 360);
  } 
  else if (key == 'e') {
    eleven.trigger();
    colorValue = random(0, 360);
  }
}

// this function gets called when you close out of your app
void stop()
{
  // always close Minim audio classes when you finish with them
  mysound.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}


