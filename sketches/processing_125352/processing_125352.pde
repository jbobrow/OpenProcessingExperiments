
// ----------------------------------------------------------------------------------
// -----   SUNY_WK15_PRJ3_FINAL_PROJECT.Pde
// ----------------------------------------------------------------------------------
// -----   SUNY
// -----   Introduction to Computational Arts 
// -----   Week15 Final Project
// ----------------------------------------------------------------------------------
// -----   v1.0 Progr'Amador 2013.12.16
// -----   If mouse pressed/dragged:
// -----      »»» Draw circles over a picture (non destructive)
// -----          Circles size is a function of mouse movement
// -----      »»» Play sound #1.
// -----   If mouse released:
// -----      »»» Show a region of picture, simulating a 'Terminator' red light lantern
// -----          Lantern radius controlled by keyboard
// -----      »»» Play sound #2.
// -----      »»» Play with 'image(img, 0, 0)' to get differents effects.
// -----   Future Enhancements
// -----      »»» Check keyboard to change lantern light color (R/G/B).
// ----------------------------------------------------------------------------------
// Import 'Minim' Libraries.
// import ddf.minim.spi.*;
// import ddf.minim.signals.*;
import ddf.minim.*;
// import ddf.minim.analysis.*;
// import ddf.minim.ugens.*;
// import ddf.minim.effects.*;

// Declare Variables
// GFX variables
PImage img;
PImage img2;

// AUD variables
Minim minim;
AudioPlayer playerT2;
AudioPlayer playerBinaural;

// PGM variables
boolean firstTime = true;        // True if Mouse not pressed
boolean noMouse = true;        // True if Mouse not pressed
int lanternRadius = 150;       // Radius of the Lantern
boolean swDraw = true;         // Draw over picture. If false, draw on black screen


PFont f;                          // STEP 2 Declare PFont variable
  

void setup()
{
  // GFX Setup
  //img = createImage(640, 480, RGB);
  img = loadImage("Earth_02_Final.jpg");
  size(img.width, img.height+20);
  image(img, 0, 0);
  strokeWeight(3);
  
  img2 = createImage(800, 600, RGB);
  //size(640, 480);
  background(255); 

  // AUD Setup
  minim = new Minim(this);
  playerBinaural = minim.loadFile("Binaural_00.wav");
  playerBinaural.loop();
  playerBinaural.mute();
  playerT2 = minim.loadFile("T2_00.wav");
  playerT2.loop();
  
  f = createFont("Arial",16,true); // STEP 3 Create Font
  firstTime = true;

  
}   // end-setup()

// --------------------------------------
// code that happens when the mouse moves
// with the button down
// --------------------------------------
void mouseDragged()
{
  noMouse = false;

  // GFX actions.
  strokeWeight( ( (abs((pmouseX -320))/1  + abs((pmouseY -240)) % 25) + (abs((pmouseY -240))/1  + abs((pmouseX -320)) % 25) ) / 2);
  stroke(pmouseX % 255, pmouseY % 255, (5 * pmouseX + 2 * pmouseY) % 255, (5 * pmouseX + 2 * pmouseY) % 255); 
  line(pmouseX, pmouseY, mouseX, mouseY);

  // AUD actions.
  playerT2.mute();
  playerBinaural.unmute();
}   // end-mouseDragged()

// --------------------------------
// code that happens when the mouse 
// button is pressed
// --------------------------------
void mousePressed()
{
  noMouse = false;

  // GFX actions.
  strokeWeight( ( (abs((pmouseX -320))/1  + abs((pmouseY -240)) % 25) + (abs((pmouseY -240))/1  + abs((pmouseX -320)) % 25) ) / 2);
  stroke(pmouseX % 255, pmouseY % 255, (5 * pmouseX + 2 * pmouseY) % 255, (5 * pmouseX + 2 * pmouseY) % 255); 
  line(pmouseX, pmouseY, mouseX, mouseY);

  // AUD actions.
  playerT2.mute();
  playerBinaural.unmute();
}   // end-mousePressed()

// --------------------------------
// code that happens when the mouse 
// button is released
// --------------------------------
void mouseReleased()
{
  noMouse = true;

  // AUD actions.
  //playerT2.stop();
  playerT2.unmute();
  playerBinaural.mute();
}   // end-mouseReleased()


void draw()
{
  image(img2, 800, 600);
  if (noMouse)
  {
    image(img, 0, 0); //jugar con image antes y después de fLantern().  
    fLantern();
  }
  else {
    if (swDraw) {
      image(img, 0, 0); //jugar con image antes y después de fLantern().
    } // end-if-swDraw
  } // end-if-noMouse
  
  textFont(f,18);                 // STEP 4 Specify font to be used
  text("  [MENU]     ~    [X] Exit  ~  [UP] Increment Lantern Radius  ~  [DOWN] Decrement Lantern Radius", 10, img.height+20-10);
}  // end-draw()

void fLantern()
{
  loadPixels();

  // For every pixel in image, calculate distance to mouse position and adjust pixel brightness.
  for (int x = 0; x < width; x++ ) {
    for (int y = 0; y < height; y++ ) {

      // Calculate pixel location
      int pixIdx = x + y*width;

      // Get the R,G,B components of picture
      float r = red (pixels[pixIdx]);
      float g = green (pixels[pixIdx]);
      float b = blue (pixels[pixIdx]);

      // Calculate distance between pixel and mouse
      float pixMouseDist = dist(x, y, mouseX, mouseY);

      // The closer the pixel is to the mouse, brighter the pixel 
      // If pixel is too far, it will not be showed (darkness) 
      float brightness = (lanternRadius-pixMouseDist)/lanternRadius;
      r *= brightness;
      g *= brightness;
      b *= brightness;

      // Adjust RGB to 0-255 interval
      // g = constrain(g,0,255);
      // b = constrain(b,0,255);
      // v1.1
      // Adjust only RED component to 0-255 (T2 style)
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 0);
      b = constrain(b, 0, 0);

      // Make a new color and set pixel in the image
      color c = color(r, g, b);
      pixels[pixIdx] = c;
    }
  }  

  updatePixels();
}  // end-fLantern()

// --------------------------------
// code that happens when the a key 
// is pressed on the keyboard
// --------------------------------
void keyPressed() 
{
  // Control size of the Lantern.
  if (key == CODED) {
    if (keyCode == UP) {
      lanternRadius += 5;
    } 
    else if (keyCode == DOWN) {
      lanternRadius -= 5;
    }
  }  // end-if-else-CODED
  lanternRadius = constrain(lanternRadius, 25, width / 4);
  
  if (key == 'x' || key == 'X') {
    exit();
  } // end-if

  if (key == 'z' || key == 'Z') {
    //image(img2, 0, 0);
    //swDraw = !swDraw;
    textFont(f,16);                 // STEP 4 Specify font to be used
    //fill(0);                        // STEP 5 Specify font color 
    //background(255); 
    text("Has pulsado la tecla Z", 10, img.height+100-3);  // STEP 6 Display Text
  } // end-if
 
  //if (key == 'z' || key == 'Z') {
  //  image(img2, 0, 0);
  //  swDraw = !swDraw;
  //  textFont(f,16);                 // STEP 4 Specify font to be used
  //  fill(0);                        // STEP 5 Specify font color 
  //  background(255); 
  //  text("Has pulsado la tecla Z", 10, 100);  // STEP 6 Display Text
  //} // end-if
}  // end-keyPressed() 


