
// What if words had emotions? Try moving the mouse on text to see it react!

String message = "giggle";
float x, y;
float hr, vr;

import ddf.minim.*;

Minim minim;
AudioPlayer groove;

void setup() {
  size(500, 500);
  
  PFont font = loadFont("WickendenCafeNDPBold-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
  
  minim = new Minim(this);
  groove = minim.loadFile("giggling.wav", 512);
  groove.loop();
}

void stop()
{
  groove.close();
  minim.stop();
  super.stop();
}

void draw() {
  
  fill(255);
  rect(0, 0, width, height);
  fill(0);
 
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  text("giggle", x, y);
}


