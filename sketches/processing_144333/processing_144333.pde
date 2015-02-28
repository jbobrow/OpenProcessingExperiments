
PImage img;
PImage img2;

color c; //img pixels data
color c2; //img2 pixels data

int counter = 0; //amount of cycles in total, used to stop loop1 and loop2

int drawLimit = 13000; //how many cycles will happen during loop1. 
int drawLimit2 = 20000; //how many cycles will happen during loop2. 

int linesPerCycle = 200; //pixel lines per cycle
int eraserLinesPerCycle = 45; //white or black lines per cycle

int lineMaxLength = 70; // max length of image(img1) drawn pixel line.
int glitchLineMaxlength = 70; //max length of glitchy(img2) pixel line

int whiteLineMaxLength = 200; // max length of white line;
int blackLineMaxLength = 50; //max length of black line;




void setup() {
  img = loadImage("glitch.jpg");
  img2 = loadImage("bach1.jpg");

  size(607, 700);

  background(255);
}


void draw() {

  loadPixels();
  
  img.loadPixels();
  img2.loadPixels();


  //LOOP1 //PARTIALLY DRAW IMG1
  if (counter < drawLimit ) {

    for (int i = 0; i < linesPerCycle; i++) { // draw X lines per cycle
      int lengthrand = int(random(glitchLineMaxlength)); //pick random amount of pixels that will be drawn
      int randomloc = int(random(pixels.length - lengthrand)); // pick up random pixel on the screen . 

      counter = counter + 1; // count loop1 cycles 

      for (int b = randomloc; b < randomloc + lengthrand; b++) { //second loop is used to draw pixels and to stop loop1

        c = img.pixels[b]; //get N pixels color
        pixels[b] = c; // draw N pixels
      }
    }
  } 



  //LOOP2 //PARTIALLY DRAW IMG2
  if (counter > drawLimit - 1 && counter < drawLimit2) {

    for (int z = 0; z < linesPerCycle; z++) { 
      
      int lengthrand = int(random(lineMaxLength)); //pick random amount of pixels that will be drawn
      int randomloc = int(random(pixels.length - lengthrand)); // pick up random pixel on the screen

      counter = counter + 1; // picks up counting after drawLimit1 has been reached in loop1.

      for (int u = randomloc; u < randomloc + lengthrand; u++) { //second loop is used to draw pixels and to stop loop2

        c2 = img2.pixels[u]; //pick N pixel color
        pixels[u] = c2; // draw N pixel
      }
    }
  }

  //RESET COUNTER, START OVER

  if (counter == drawLimit2) { 
    counter = 0;
  }


if (keyPressed == true) {
  //DECIDE WHETHER TO DRAW A LINE & WHETHER IT WILL BE BLACK OR WHITE
  float generalProbability = random(1);


  if (generalProbability < 0.5) { // 50% chance that lines will be drawn

  float probability = random(1); // calculates random float number between 0 and 1

    if (probability < 0.4) { // 40% probability that lines will be white

      for (int o = 0; o < eraserLinesPerCycle; o++) { 
        int lengthrand = int(random(whiteLineMaxLength));
        int randomWhiteLoc = int (random (pixels.length - lengthrand));
        for (int i = randomWhiteLoc; i < randomWhiteLoc + lengthrand; i++) {
          pixels[i] = color(255);
        }
      }
    } else {  
      for (int o = 0; o < eraserLinesPerCycle; o++) { // 60% probability that lines will be black
        int lengthrand = int(random(blackLineMaxLength));
        int randomWhiteLoc = int (random (pixels.length - lengthrand));
        for (int i = randomWhiteLoc; i < randomWhiteLoc + lengthrand; i++) {
          pixels[i] = color(0);
        }
      }
    }
  }
 }

  updatePixels();
}


