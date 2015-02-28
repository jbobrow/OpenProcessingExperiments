
// Glitched-up Canvas
// Not only do I create randomly assigned, randomly sized shapes,
// but I also constantly change the canvas size!
// Additionally, the frame rate also changes dynamically and randomly.
// Click on the active canvas to change the shape.
// Dan Jovanov, 30 Jan 2013

float mode = 1; // click to change mode--Anthony Wojnar, 30 Jan 2013

// Dan Jovanov, 29 Jan 2013
void setup() {
  
  // Change the color mode to HSB for easier cycling.
  // Set Hue 0->360, Saturation, Brightness and Alpha to 0->100
  // Devon Scott Tunkin, 23 Jan 2013
  colorMode(HSB, 360, 100, 100, 100);
  
} // setup()



// recycle drawQuad(...) from previous project and make it 
// do something else, like drawing a random square anchored 
// at (0,0).
// Does not take arguments.
// Dan Jovanov, 29 Jan 2013
void drawRect() {
  //int randRed = int(random(255)); // "random" red
  //int randGreen = int(random(255)); // "random" green
  //int randBlue = int(random(255)); // "random" blue
  float randHue = random(360); // "random" hue
  float randPoly = random(500); // based on size of canvas.
  
  fill(randHue, randHue, randHue); // random color
  //quad(0,0,randPoly,0,randPoly,randPoly,0,randPoly); // now draw.
  rect(0,0,randPoly,randPoly);
} // drawQuad();


// recycle drawEllipse(...) and make it do something else
// Dan Jovanov, 30 Jan 2013
void drawEllipse() {
  float randHue = random(360);
  float randPoly = random(500);
  
  // draw on center of canvas and change size
  fill(randHue, randHue, randHue);
  ellipse(250, 250, randPoly, randPoly);
} // drawEllipse()


// recycle drawTriangle(...) and make it do something else
// Dan Jovanov, 30 Jan 2013
void drawTriangle() {
  float randHue = random(360);
  float randPoly = random(500);
  
  // draw along bottom of canvas and change the "top" point
  fill(randHue, randHue, randHue);
  triangle(0,500,500,500,randPoly,randPoly);
} // drawTriangle()


// recycle drawLine(...).....you get the idea
// Dan Jovanov, 30 Jan 2013
void drawQuad(int x, int y) { // user-defined "anchor point"
  float randHue = random(360);
  float randPoly = random(375);
  
  // draw from upper-right corner
  fill(randHue, randHue, randHue);
  quad(x,y,randPoly,0,randPoly,y,randPoly,x);
} // drawQuad()




void mouseClicked() {
  // change mode
  // Anthony Wojnar, 30 Jan 2013
  if (mode < 5) {
    mode += 1;
  }
  else { mode = 1; }
} // mouseClicked()




// Dan Jovanov, 30 Jan 2012
void draw() {
  //background(255);
  size (random(200,500),random(200,500));
  noStroke();
  
  for (int i = 1; i < 600; i++) {
    frameRate(int(random(05,20))); // I think this is unique as far
                                   // as glitches go.
    if (mode < 2) {
      drawRect(); // doing this is a little cleaner than in Anthony's work 
    }
    if (mode < 3 && mode > 1) {
      drawEllipse();
    }
    if (mode < 4 && mode > 2) {
      drawTriangle();
    }
    if (mode < 5 && mode > 3) {
      drawQuad(500,250); // right side of canvas
    }
    if (mode > 4) {
      drawQuad(250,250);
    }
  }
} // draw()

// end of file


