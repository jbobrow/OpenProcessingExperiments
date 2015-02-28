
/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage a, b, c;  // Declare variable "a" of type PImage

int i = 0;
boolean isBlack = true;
long currentMillis;
long interval = 1000;  // Duration of black screen (also of image screen)

void setup() {
  size(1000, 700);
  // The file "jelly.jpg" must be in the data folder
  // of the current sketch to load successfully
  background(0);
  a = loadImage("1.jpg");  // Load the image into the program  
  b = loadImage("2.jpg");  // Load the image into the program  
  c = loadImage("3.jpg");  // Load the image into the program  
  //noLoop();  // Makes draw() only run once
  currentMillis = millis();
}

void draw() {
  // Displays the image at its actual size at point (0,0)

  //  if (millis() >= (i * 1000) )
  if (millis() - currentMillis > interval)
  {

    //i = i%6;

    //delay(500);
    background(0);

    if (i%6 == 0)
      image(a, width/2, height/2); 
    else if (i%6 == 2)
      image(b, width/2, height/2); 
    else if (i%6 == 4)
      image(c, width/2, height/2); 

    //delay(1000);

    i++;
    i = i%6;
    currentMillis = millis();
  }
}

void mousePressed() {
  if (i%6 == 1)
  {
    println("WellDone");
    currentMillis = millis();
    background(0);
    i+=1;
  }
  if (i%6 == 3)
  {
    println("IDIOT!");
    currentMillis = millis();
    background(0);
    i-=1;
  }
  if (i%6 == 5)
  {
    println("IDIOT!");
    currentMillis = millis();
    background(0);
    i-=1;
  }
}

// DONE   Replay the same image again if he touches IDIOT
// DONE   RESET the clock
// DONE   Reset the clock if he touches in the black
// Random image order
// Images to fit on the bloody screen


