
// Suprematic generator
/*
The MIT License (MIT)
 Copyright (c) 2014 Mykola Leonovych
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

// I want to play around suprematism abstract paintings.
// Although I know, that computer-generative art can not replace
// a live human being emotions, I found it very interesting and inspiring.

//I generate the pallette using kuler from a suprematic pictue by Olga Rozanova
//(reference: http://goo.gl/ylGPPZ)

// --- how to use the S-generator ---
//     click to generate piece of art, s to save,
//     backspace to clear canvas

// global variables
color[] palette = { 
 #E1DED9, #2A2B30, #2A231D, #2B252F, #3E3731
};
color clr; // current figure color
float posX; // coordinates for the system
float posY;


// setup block
void setup() {
  size(4000, 2000);
  background(palette[0]);
}
// draw block
void draw() {
  if (mousePressed) {

    background(palette[0]);
    int quantity = (int)random(15);
    for (int i = 1; i < quantity; i++) {
      clr = (int)random(5);
      posX = random(width);
      posY = random(height);

      suprematism (posX, posY, palette[clr]);
    }
  }
}
// keyPressed block: saving and erasing the pictures
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("suprematism-##.png");
  } 
  else if (key == DELETE || key == BACKSPACE) { 
    background(palette[0]);
  }
}

// object generator
void suprematism (float x, float y, color c) {


  int dice = (int)random(6)+1;

  switch (dice) {
  case 1: //cicle
    noStroke();
    fill(c);
    float r = random((width+height)/4);
    ellipseMode (CENTER);
    ellipse (x, y, r, r);

  case 2: // triangle
    noStroke();
    fill(c);
    pushMatrix();
    translate(x, y);
    float x21 = random(x-(width+height)/4);
    float y21 = random(y-(width+height)/4);
    float x22 = random(x+(width+height)/4);
    float y22 = random(y+(width+height)/4);
    float x23 = random(x+(width+height)/4);
    float y23 = random(y+(width+height)/4);


    triangle (x21, y21, x22, y22, x23, y23);
    popMatrix();

  case 3: // line
    strokeWeight(random(10));
    strokeCap(SQUARE);
    stroke(c);

    float x31 = random(width);
    float y31 = random(height);
    float x32 = random(width);
    float y32 = random(height);

    line (x31, y31, x32, y32);

  case 4: // arc
    noFill();
    strokeWeight(random(10));
    strokeCap(SQUARE);
    stroke(c);
    pushMatrix();
    translate(x, y);

    float r44 = random ((width+height)/2);
    float l44 = random(PI);
    arc(x, y, r44, r44, l44, OPEN);
    popMatrix();

  case 5: // rect
    noStroke();
    fill(c);
    pushMatrix();
    translate(x, y);
    rotate(random(TWO_PI));
    rectMode(CENTER);
    rect(x, y, random(width/3), random(width/3));
    popMatrix();

  case 6: // rhytm seria
    noStroke();
    fill(c);
    pushMatrix();
    translate(x, y);
    rotate(random(TWO_PI));
    rectMode(CENTER);
    float x66 = 0;
    float y66 = 0;
    for (int i = 1; i < 7; i++) {
      rect(x66, y66, random(width/10), random(width/5));
      x66 += width/15;
    }
    popMatrix();
  }
}
