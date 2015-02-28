
/**
 * This sketch demonstrates how to play a file with Minim using an AudioPlayer. <br />
 * It's also a good example of how to draw the waveform of the audio.
 */

import ddf.minim.*;

Minim minim;
AudioPlayer player;
float increment = 0.01;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.02; 

PImage img;
PFont font;


void setup()
{
  size(512, 400, P3D);
  frameRate(25);
  font = loadFont("ACaslonPro-Regular-48.vlw");

  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("Home.mp3");

  // play the file
  player.play();
  // background(255, 255, 0);
}

void draw()
{ 
  //background(255, 255, 0);

  loadPixels();

  float xoff = 0.0; // Start xoff at 0

    // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff

      // Calculate noise and scale by 255
      float bright = noise(xoff, yoff, zoff)*255;
      // Try using this line instead
      //float bright = random(0,255);

      // Set each pixel onscreen to a grayscale value
      //for (int i = 0; i < player.bufferSize() - 1; i++)
      pixels[x+y*width] = color(bright+x, bright-x, bright-y);
    }
  }
  updatePixels();

  zoff += zincrement; // Increment zoff
  //{
  //if (frameRate % 60 == 1) {
  //background(255, 255, 0);
  //}



  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for (int i = 0; i < player.bufferSize() - 1; i++)
  {
    textFont(font);
    //textSize(100);
    fill(255, 100, 100, 10);
    text("∑", width*7/8, height*7/8);

    float x1 = map( i, 0, player.bufferSize()/2, 0, width );
    float x2 = map( i+1, 0, player.bufferSize()/2, 0, width );
    // line( x1, 150 + player.left.get(i)*50, x2, 150 + player.left.get(i+1)*50 );
    //line( x1, 250 + player.right.get(i)*50, x2, 250 + player.right.get(i+1)*50 );
    if (i % 100 == 5) {
      //noFill ();
    }
    // rect( x1-200, 200 + player.left.get(i)*100, width, player.left.get(i+1)*100, x1, 250 + player.right.get(i)*50, x2, 250 + player.right.get(i+1)*50);
    if (player.left.get(i)*200 > 100)
    {
      //stroke(random(150, 255), random(150, 255), random(150, 255));
    } 

    if (player.left.get(i)*200 > 140)
    {
      //stroke(random(150, 255), random(150, 255), random(150, 255));
      rectMode(CENTER);
      rect(x1*2, 200, player.left.get(i)*300, player.right.get(i)*300, 100*player.left.get(i));
    } 
    else {
      stroke(250, 250, 0, 50);
    }
    noFill();
    smooth();
    ellipse(x1*2, 200, player.left.get(i)*300, player.right.get(i)*300);
    //image(img,( player.right.get(i)*10)+256, 100);
  }

  saveFrame("frame-´####.tif");
    if (frameCount > 6000)
  {
  noLoop();
  }
}



