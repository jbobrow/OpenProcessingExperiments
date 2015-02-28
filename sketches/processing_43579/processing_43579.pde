
/*Joseph Kotay. Practice Comp. Methods. Prof N. Senske. Project 2. Systems and Simulations.
 
 * Adapted from imgWalker (author unknown).
 * Image source is a grafiti rendering by Daim, http://daim.org/site/en.
 * Notes by J. Kotay
 
 
 Digital Grafiti- The Remix
 
 *  Left click to clear screen and reset to the background.
 
 *  Right click to clear screen and reveal the image source.*/

PImage daimGrafiti; // rename my image source outside of setup
int num = 20;
int blurSize = int(random(5,20)); // I changed this function so that the "trail" size varies.
sprayStroke [] sprayStrokes = new sprayStroke[num];

void setup() {
  size(600, 300); //  I realize that the handout specified a 500 x 500, but my image source is 600 * 300
  frameRate(10);
  daimGrafiti = loadImage("3d_graffiti1.jpg");
//background(daimGrafiti);  I left this step commented just to show process.
  background(40);

  daimGrafiti.loadPixels(); //this converts the pixel data from the rendering into my processing sketch.

  // creates a conditional loop that selects random coordinates for x and y.  I added some conditions
  // so the the spray strokes react diiferently to certain colors from the rendering.

  for (int i=0;i<num;i++) {
    float x = random(width);
    float y = random(height);
    if (daimGrafiti.get(int(x), int(y)) == color(200, 0, 0)) {
      i--;
      if (daimGrafiti.get(int(x), int(y)) == color(140, 120, 100)) {
        i++;
        if (daimGrafiti.get(int(x), int(y)) != color(230)) {
          i--;
        }
      }
    }
    else {
      sprayStrokes[i] = new sprayStroke(x, y);
    }
  }
}

// set up display functions inside of draw.
void draw() {
  for (int i=0; i<num; i++) {
    sprayStrokes[i].spray();
    sprayStrokes[i].display();
  }
}

// start a class for the spray strokes.

class sprayStroke {
  float x;
  float y;
  float xv = random(4);
  float yv = random(8);

  sprayStroke(float x_, float y_) {
    x=x_;
    y=y_;
  }

  void spray() {
    x+=2 * xv;
    y+=2 * yv;
    // more conditional statements that regulate the coordinate settings.

    if (x>width) x = 5;
    if (x<0) x = width;
    if (y>height) y = 20;
    if (y<0) y = height;

    if (daimGrafiti.get(int(x), int(y)) != color(0)) {
      if (random(2)>1) {      
        yv = 4 * yv;
      }
      else {
        xv = -xv;
      }
    }
  }

  // this draws the brush strokes. after several test, I decided that the rotated effect gave the most
  // interesting composition. This is consistent in most of my sketches.

  void display() {

    int x = int(random(10,daimGrafiti.width));    // take a random x coordinate from myPic
    int y = int(random(10,daimGrafiti.height)); 

    color grafColor = daimGrafiti.get(x,y);      // use the random coordinate to get a color from myPic
    stroke(grafColor,70);
    noFill();
    pushMatrix();
    translate(x,y);
    rotate(frameCount * radians(10));
    ellipse(x, y, blurSize, 2 * blurSize);
    popMatrix();
  }
}
// our professor instructed us to not make this project too interactive, so I just used a couple of reset options
// to update the sketch to two options of background settings.

void mousePressed() {
  if (mouseButton == LEFT) {
    background(0);
  } 
  else if (mouseButton == RIGHT) {
    background(daimGrafiti);
  }
}


