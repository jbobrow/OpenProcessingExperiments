
// rotoreliefs
//
// Need to:
// 1: figure out a way to make this faster.
//    Maybe the variable should be the 0.02 constant used as the multiplier - get rid of the delay()
//    Would using the framerate command help here?
// 2: figure out a way to make the text look better.
//    PImage buttonimage;
//    buttonimage = loadImage("buttonimage.png");
//    (figure out how to not translate these)
//


PImage[] images = new PImage[12]; //image array
PImage rotoreliefimage;


float rot = 0;
int delvalue = 10;
int dir = 1;
float distance;
PFont buttonfont;   // this is the font used for the buttons
int imageno = 0;

void setup() {
  size(450,500);
//  frameRate(24);
  smooth();
  textMode(SCREEN);
  background(0);
  buttonfont = loadFont("futurastd-book-24.vlw");
  textFont(buttonfont); 
  textAlign(CENTER, CENTER);
  
  images[0] = loadImage("rotorelief1carolles.png");
  images[1] = loadImage("rotorelief2oeufalacoque.png");
  images[2] = loadImage("rotorelief3lanternechinoise.png");
  images[3] = loadImage("rotorelief4lampe.png");
  images[4] = loadImage("rotorelief5poissonjaponais.png");
  images[5] = loadImage("rotorelief6escargot.png");
  images[6] = loadImage("rotorelief7montgolfiere.png");
  images[7] = loadImage("rotorelief8cerceaux.png");
  images[8] = loadImage("rotorelief9verredeboheme.png");
  images[9] = loadImage("rotorelief10cage.png");
  images[10] = loadImage("rotorelief11eclipsetotale.png");
  images[11] = loadImage("rotorelief12spiraleblanche.png");
  
  rotoreliefimage = images[0];
}

void draw() {
  translate(225, 225); // center for image on screen
  rotate(rot);
  image(rotoreliefimage,-275,-275); // these values are image width,height/2
//  makebuttons();
  rot= rot + (dir * 0.02); 
  delay(delvalue);
}

void mouseClicked() {
  int oldval;
  
  // clicking further from center slows things down.
  if(mouseY > 450) {
    if(mouseX < 225) {
      imageno = imageno - 1;
      if(imageno == -1) {
        imageno = 11;
      }
    } else {
      imageno = imageno + 1;
      if(imageno == 12) {
        imageno = 0;
      }
    }
    rotoreliefimage = images[imageno];
  } 
  else {
    oldval = delvalue;
    delvalue = floor(sqrt(pow(mouseX-(width/2),2)+pow(mouseY-(width/2),2))/8);
//    println(delvalue);  // use this if you want to see what the value is
    if(delvalue > 29) {   // (= outside the area of the circle)
      dir = -dir;         // flips rotation direction
      delvalue = oldval; // keeps the old value for rotation speed
    }
  }
}

void makebuttons() {
  fill(255);
  text("·    ·    ·    ·    ·    ·    ·    ·    ·    ·    ·    ·    ·", 0, 460, 450, 40);
}



