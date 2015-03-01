
// Intro to Computational Arts
// Final Project: Bringing it All Together
// Melissa Metz
//
// Artist's statement - background:
// The theme of my piece is (once again) globalization, or 
// "bringing it all together".
//
// In a classic movie of globalization, Fievel Mousekewitz and his 
// family travel by ship (let's call it the SS Internet) to the 
// land of globalization -- along with families from Italy and 
// Ireland, among others. This is a clear analogy for students 
// across the globe learning computational arts together.
//
// In another scene, Fievel and his sister sing "Somewhere Out 
// There". With clear references to globalization, they sing that 
// "we're [...] underneath the same big sky" and "[despite] how 
// very far apart we are [...] we might be wishing on the same 
// bright star".
//
// Artist's statemeent - my piece:
// My piece is intended as a game for young pre-school fans of 
// globalization. They are each given the "same big sky" as a 
// canvas. Using the number keys and mouse, they can add "bright 
// stars" with anywhere from 4 to 9 points. They can also add 
// cats (letter 'c'). A moon can be added (letter 'm'), but only 
// one as we are all under the same "pale moonlight". This proof 
// of concept is a single-player game but could be expanded to be 
// multi-player.
//
// Summary:
// Yes, Fievel, there ARE cats in America, and there are certainly 
// cats on the Internet. 
// http://anamericantail.wikia.com/wiki/
 
// sound library
import ddf.minim.*; 


//---------Global Variables-------------
int screenShots = 1; // start with the first screenshot
boolean moonDrawn = false;

// start with 5-pointed stars (s, 5)
char drawKey = 's'; 
int points = 5; 

// I used kuler.adobe.com to choose some nice golden star colors.
color[] starPalette = { #FFF109, #E8C801, #FFC90C, #E8A201, #FF9C00 };
color nightBlue = #03057E; // background
color moonColor = #FFFFFF; // whiter than white

// smaller items at the top, sized from 10 to 50 
int minRadius = 10;
int maxRadius = 50;

// how to play
boolean userTipped = false;
String userTips = "\n\n" +
"Click to draw stars.\n" +
"Enter a number 4-9 to set the complexity of the stars.\n" +
"Use c/C to draw cats instead.\n" +
"Use m/M to draw the moon (only one allowed).\n" +
"Use s/S to save and delete/backspace to clear the canvas.\n" +
"Note: Dragging makes some nice effects.\n";

// minim package and the sound
Minim minim;
AudioSample meow;  
AudioSample moon; 
// sounds for 6 stars -- 4 through 9
AudioSample[] starSounds = new AudioSample[6];

// images from file(s)
String[] catFiles = { "pico-50.png", "milli-50.png", 
                      "pico-65.png", "milli-65.png" };
PImage[] cats = new PImage[catFiles.length];
// assume images are about 60x60
int imageCenter = 30;

//---------setup()-------------
void setup() {
  size(800,720);
  // set background and give user tips
  clearScreen(true);

  // load sound and images
  minim = new Minim(this);
  meow = minim.loadSample("meow.wav");
  moon = minim.loadSample("moon.wav");
  for (int i=0; i < starSounds.length; i++){
    int j = i+4;
    String starFile = "star" + j + ".wav";
    starSounds[i] = minim.loadSample(starFile);
  }
  for (int i=0; i < catFiles.length; i++){
    cats[i] = loadImage(catFiles[i]);
  }
}

//---------draw()--------------
// draw stars or cats or whatever
void draw() {
  if(mousePressed) {
    // if first click, remove instructions
    if (userTipped == true) {
        clearScreen(false); // clear without re-tipping
        userTipped = false;
    }
    if (drawKey == 's') {
      drawPointy();
    } else if (drawKey == 'c') {
      drawCat();
    } else if (drawKey == 'm') {
      // we can only have one moon on the screen
      if (moonDrawn) {
        clearScreen(false);
      } 
      drawMoon();
      moonDrawn = true;
    }
  }  
}


// keyboard input determines what to draw and other actions
void keyPressed () {
  if (key=='s' || key =='S') {
    saveFrame("screenshot" + screenShots + ".png");
    screenShots++; // multiple screenshots for each run of the code
    // note that we overwrite screenshots if we restart the program
  }
  
  if (key == 'c' || key == 'C') {
    meow.trigger();
    drawKey = 'c'; // draw cats
  }

  if (key == 'm' || key == 'M') {
    moon.trigger();
    drawKey = 'm'; // draw a moon
  }
  
  // change the kind of star
  if (key >= '4' && key <= '9') {
    drawKey = 's'; // draw stars
    int i = (int) key - '0';  // hack for parsing a digit
    starSounds[i-4].trigger();
    points = i; 
  }
  
  // clear the screen
  if (key==DELETE || key==BACKSPACE) {
    clearScreen(true);
  }
}

/* 
   A note about pointy stars:
   ODD STARS are a lot like drawing regular polygons (see video 4-3).  
   However, instead of drawing the points in order, we skip every 
   other point, until we hit them all.
   EVEN STARS won't work that way so we'll do asterisk-style.
 */
void drawPointy() {
  float x,y, angle;

  translate(mouseX,mouseY);
  strokeWeight(3);
  color fg = starPalette[int(random(5))];
  stroke(fg);
  fill(fg);

  // smaller stars at the top
  float radius = map(mouseY, 0,height, minRadius, maxRadius);
  float angleStep=TWO_PI/points; // divide the circle evenly
  if (points % 2 == 1) { // ODD star
    rotate(-PI/2); // put the first point at the top
    beginShape();
    for (int i = 0; i <= points; i++) {
      // this is where we skip a point
      int j = (2*i); 
      angle = angleStep*j;
      x = cos(angle) * radius;
      y = sin(angle) * radius;
      vertex(x,y);
    }
    endShape();
  } else { // EVEN star
    // each line connects two points, so we draw points/2 lines
    for (int i = 0; i <= points/2; i++) {
      beginShape();
      // rotate just a bit to make the 4-pointed stars X not +
      angle = angleStep*i + PI/4;
      x = cos(angle) * radius;
      y = sin(angle) * radius;
      vertex(x,y);
      // add PI to hit the point directly opposite
      angle += PI;
      x = cos(angle) * radius;
      y = sin(angle) * radius;
      vertex(x,y);
      endShape();
    }
  }
}

void drawCat() {
  float x,y;
  // center the image on the mouse
  translate(mouseX-imageCenter,mouseY-imageCenter);

  // choose a cat based on height (mouseY)
  int i = (int) mouseY/(height/cats.length);

  image(cats[i],0,0);
}

void drawMoon() {
  translate(mouseX, mouseY);
  float radius = map(mouseY, 0,height, minRadius*2, maxRadius*2);

  stroke(moonColor);
  fill(moonColor);
  
  ellipse(0,0,radius,radius);
}

// clear away everything and show instructions if needed
void clearScreen(boolean withHelp) {
  background(nightBlue);
  if (withHelp) {
    instructions();
  }
}

// Inspired by David Leslie Williams' code
// show the instructions or tips to the user
void instructions() {
  userTipped = true;
  textSize(25);
  // most contrast with background
  fill(starPalette[0]);
  text(userTips, 50, 50);
}


