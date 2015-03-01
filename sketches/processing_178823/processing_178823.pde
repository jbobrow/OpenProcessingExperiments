
/**
 * The idea of my work is to comply with the conditions the Assignment 3 
 * and leave a message of conscience, the work is entitled 
 * 'Consumption efficient'.
 * Instructions:
 * If you press the letter key 'a, z' and 'A, Z' appears a rectangle in various colors each time you press a letter key.
 * If not so, the screen goes blank slide.
 * If you keep the mouse pressed in rotation 'x, y'; you may draw shapes of flowers and transparent ellipses.
 * To hear a sound, you can press 'b' key
 * Finally the image is saved.
 
/** Keyboard Input.
 */
// Import 'Minin' library files
import ddf.minim.*;

// Declare global variables
Minim minim;
AudioSample Sound;
// Load audio file from HDD

int rectWidth;

void setup() {
  size(900, 600);
  noStroke();
  background(0);
  rectWidth = width/4;
  minim = new Minim(this);
  Sound = minim.loadSample("Nature Motion.mp3");
}

// keep draw() here to continue looping while waiting for keys

void keyPressed() {
  int keyIndex = -1;
  // If it's not a letter key, clear the screen
  if ( key == 'b' ) Sound.trigger();
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } 
  else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }

  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen

    background(0);
  } 
  else { 
    // It's a letter key, fill a rectangle
    fill(millis() % 0255, 168, 97, 70);
    float x = map(keyIndex, 0, 25, 0, width - rectWidth);
    rect(x, 0, rectWidth, height);
    point(x, 0, height);
    textSize(32);
    text("Hello world", 350, 150); 
    fill(0, 102, 153);
    text("Hello world", 350, 180);
    fill(0, 102, 153, 51);
    text("Hello world", 350, 210); 
    textSize(20);
    fill(8, 142, 1, 0255);
    text("The Earth needs Our Consumption of Efficient Energy!", 200, 450);
  }

  for (int i = 10; i < width; i += 10) { 
    // If 'i' divides by 20 with no remainder draw the first line
    // else draw the second line
    if (i%20 == 0) {
      stroke(0, 0, 255, 0255);
      line(0, 450, i, height/2);
    }
  }
}

/** Mouse Input.
 */
int angle = 0;

void draw() {
  // Draw only when mouse is pressed
  if (mousePressed == true) {
    angle += 5;
    float val = cos(radians(angle)) * 12.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(0, 255, 40, 0255);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(0, 255, 40, 0255);
    ellipse(mouseX, mouseY, 2, 2);

    // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0

    float sd = 20;                  // Define a standard deviation
    float mean = width/2;           // Define a mean value (middle of the screen along the x-axis)
    float x = ( val * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean

      noStroke();
    fill(255, 20);
    noStroke();
    ellipse(x, height/2, 32, 32);   // Draw an ellipse at our "normal" random location
    ellipse(x, height/6, 32, 32);   // Draw an ellipse at our "normal" random location
    ellipse(x, height/1, 32, 32);   // Draw an ellipse at our "normal" random location

    /** Screenshot Saving Capability
     */
    // Draw the second renderer into the window, so we can see something 
    save("Consumption_efficient.png"); 
    println("Consumption_efficient.png saved.");
  }
}


