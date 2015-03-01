
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 10 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 10 equally spaced points, then displaying those colours
 * as vertical bars on the left half of the screen.
 *
 */

PImage myImg;
color[] pixelColors;
int scanLine;  // vertical position

PFont fuente; 

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave1, wave2, wave3, wave4, wave5, wave6, wave7, wave8, wave9, wave0;

void setup() {
  size(500, 500);
  fuente = createFont("Arial", 16, true); 
  textFont(fuente, 14);
  pixelColors = new color[10];
  scanLine = 0;
  smooth(4);
  minim = new Minim(this);
  out = minim.getLineOut();
  wave1 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave1.patch( out );
  wave2 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave2.patch( out );
  wave3 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave3.patch( out );
  wave4 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave4.patch( out );
  wave5 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave5.patch( out );
  wave6 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave6.patch( out );
  wave7 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave7.patch( out );
  wave8 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave8.patch( out );
  wave9 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave9.patch( out );
  wave0 = new Oscil( 8000, 0.5f, Waves.SINE );
  wave0.patch( out );
}

void draw() {
  background(0);
  
  if( key=='1'){myImg = loadImage("nasaImage.jpg");}
  else if( key=='2'){myImg = loadImage("melbourneCity.jpg");}
  else if( key=='3'){myImg = loadImage("map01.png");}
  else if( key=='4'){myImg = loadImage("map02.png");}
  else if( key=='5'){myImg = loadImage("map03.jpg");}
  else if( key=='6'){myImg = loadImage("map04.jpg");}
  else if( key=='7'){myImg = loadImage("map05.jpg");}
  else if( key=='8'){myImg = loadImage("map06.jpg");}
  else{myImg = loadImage("map07.jpg");}

  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get(i*25, scanLine);
  }

  for (int i=0; i< 10; i++) {
    noStroke();
    fill(pixelColors[i], 30);

    arc(width/2, height/2, width-i*50, height-i*50, HALF_PI, brightness(pixelColors[i])/50);
    pushMatrix();
    String amplitud = str(map( hue(pixelColors[i]), 0, 255, 0, 1000 ));
    fill(pixelColors[i],100);
    text ("Amp channel " + str(i) + ": " + amplitud + "Hz", 10+width/2,-5+height-25*i);
    popMatrix();
    
    //audio línea 1
    float amp1 = map( brightness(pixelColors[1]), 0, 255, 0, 1 );
    wave1.setAmplitude( amp1 );
    float freq1 = map( hue(pixelColors[1]), 0, 255, 0, 1000 );
    wave1.setFrequency( freq1 );
    //audio línea 2
    float amp2 = map( brightness(pixelColors[2]), 0, 255, 0, 1 );
    wave2.setAmplitude( amp2 );
    float freq2 = map( hue(pixelColors[2]), 0, 255, 0, 1000 );
    wave2.setFrequency( freq2 );
    //audio línea 3
    float amp3 = map( brightness(pixelColors[3]), 0, 255, 0, 1 );
    wave3.setAmplitude( amp3 );
    float freq3 = map( hue(pixelColors[3]), 0, 255, 0, 1000 );
    wave3.setFrequency( freq3 );
    //audio línea 4
    float amp4 = map( brightness(pixelColors[4]), 0, 255, 0, 1 );
    wave4.setAmplitude( amp4 );
    float freq4 = map( hue(pixelColors[4]), 0, 255, 0, 1000 );
    wave4.setFrequency( freq4 );
    //audio línea 5
    float amp5 = map( brightness(pixelColors[5]), 0, 255, 0, 1 );
    wave5.setAmplitude( amp5 );
    float freq5 = map( hue(pixelColors[5]), 0, 255, 0, 1000 );
    wave5.setFrequency( freq5 );
    //audio línea 6
    float amp6 = map( brightness(pixelColors[6]), 0, 255, 0, 1 );
    wave6.setAmplitude( amp6 );
    float freq6 = map( hue(pixelColors[6]), 0, 255, 0, 1000 );
    wave6.setFrequency( freq6 );
    //audio línea 7
    float amp7 = map( brightness(pixelColors[7]), 0, 255, 0, 1 );
    wave7.setAmplitude( amp7 );
    float freq7 = map( hue(pixelColors[7]), 0, 255, 0, 1000 );
    wave7.setFrequency( freq7 );
    //audio línea 8
    float amp8 = map( brightness(pixelColors[8]), 0, 255, 0, 1 );
    wave8.setAmplitude( amp8 );
    float freq8 = map( hue(pixelColors[8]), 0, 255, 0, 1000 );
    wave8.setFrequency( freq8 );
    //audio línea 9
    float amp9 = map( brightness(pixelColors[9]), 0, 255, 0, 1 );
    wave9.setAmplitude( amp9 );
    float freq9 = map( hue(pixelColors[9]), 0, 255, 0, 1000 );
    wave9.setFrequency( freq9 );
    //audio línea 10
    float amp0 = map( brightness(pixelColors[0]), 0, 255, 0, 1 );
    wave0.setAmplitude( amp0 );
    float freq0 = map( hue(pixelColors[0]), 0, 255, 0, 1000);
    wave0.setFrequency( freq0 );


  }


  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }
}

