
import arb.soundcipher.*;

SoundCipher sound1 = new SoundCipher(this);
SoundCipher sound2 = new SoundCipher(this);

float[] notes = {
  57, 60, 60, 62, 64, 67, 69, 72, 72, 74, 76
};

float[] inst = {
  112, 113, 114, 115, 116, 117, 118, 119
};

float root = 0;

//this variable (1,2 or 3) controls whether the program 
//draws rectangles, ellipses or lines
int shapes = 1;

//rather than being totally random, the colur is determined using a Perlin 
//noise function
float col = 0.0;

void setup() {
  size(400, 500);
  frameRate(8);
  //the colours came out more consistently when I used Hue, Sat, Brightness, 
  //rather than RGB colorMode
  colorMode(HSB, 100);
  sound1.instrument(inst[(int)random(inst.length)]);
  //sound 2 is a gunshot sound that you hear when the screen is cleared
  //when the user clicks
  sound2.instrument(127);
}

void draw() {
  col = col + 0.01;
  float n = noise(col) * random(100);
  //it looked better with a line around the shapes
  stroke(color(n, random (70, 100), random(70, 100)));
  strokeWeight(random(10));
  sound1.instrument(inst[(int)random(inst.length)]);
 //if the notes play on ever frame, it is noisy and boring, adding a little
 //randomness makes it a bit more interesting
  if (random(2) < 1) {
    sound1.playNote(notes[(int)random(notes.length)/4] + root, random(50, 100), random(2, 8));

    if (shapes < 2) {
//when you hear the big japanese taiko drum, it the background appears to change colour
//but it is actually an overlay that is not completely opaque
      if (sound1.instrument == 116) {
        fill(color(n, random (70, 100), random(70, 100), random(50, 80)));

        //   fill(color(random(100), random (70, 100), random(70, 100), random(50, 80)));
        rect(0, 0, width, height);
      } 
      else {
        fill(color(n, random (70, 100), random(70, 100)));
        //   fill(color(random(100), random (70, 100), random(70, 100)));
        rect(random(width), random(height), random(80), random(80));
      }
    }

    if (shapes > 1 && shapes < 3) {

      if (sound1.instrument == 116) {
        fill(color(n, random (70, 100), random(70, 100), random(50, 80)));
        rect(0, 0, width, height);
      } 
      else {
        //change to ellipses with a mouse click or keypress
        fill(color(n, random (70, 100), random(70, 100)));
        ellipse(random(width), random(height), random(80), random(80));
      }
    }

    if (shapes > 2 && shapes < 4) {

      if (sound1.instrument == 116) {
        fill(color(n, random (70, 100), random(70, 100), random(50, 80)));
        rect(0, 0, width, height);
      } 
      else {
          //change to lines with a mouse click or keypress
        float lineX = random(width);
        float lineY = random(height);
        float q = random(2);
        if (q < 1) {
          line(lineX, 0, lineX, height);
        } 
        else {
          line(0, lineY, height, lineY);
        }
      }
    }
//if the mouse is clicked or a key is pressed, you hear a gunshot sound,
    if ((mousePressed == true) || (keyPressed == true)) {
      sound2.playNote(100, 100, 100);
      //the screen is cleared to a white background
      fill(100);
      rect(0, 0, width, height);
      //this changes the variable so you get rectangles, ellipses or lines
      if (shapes == 3) {
        shapes = 0;
      }
      shapes++;   
      float r = random(2);
      if (r < 1) {
        root = root + 7;
      } 
      else { 
        root = root - 7;
      }
    }
  }
}
