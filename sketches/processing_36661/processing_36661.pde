
//Generative art has been defined as 
//“any art practice where the artist creates a process, 
//such as a set of natural language rules, a computer program, a machine, or other mechanism, 
//which is then set to motion with some degree of autonomy contributing to or resulting in a complete work of art.”
//(Philip Galanter).



//Sean M Gillespie

//Generative Art (Work 1)

//Walker collision


void setup() {
  size(500,500);
  background(0);
  smooth();
}

int yRand = 70;                             //changing how far each pattern will vary above and below its starting point
float sizeRand;                             //impacts the size of only the pattern dependent ellipses
int patternRand = floor(random(50,100));    //determines what rate the random lines will appear at 

int count = 0;                              //represents the rate number the pattern is based on
int countRate = floor(random(0,4));         //the speed at which count continues

void draw() {
  if (count % patternRand == 0) {           //pattern coding creating black ellipses that depend on patternRand for their pattern
    stroke(0);                              //black ellipse with no opacity
    strokeWeight(.5);
    fill(0);
    sizeRand = random(5,15);                //the size of ellipse changes for black ellipses
  }
  else {                                    //coding for the standard white ellipses
    noStroke();
    fill(255,25);
    sizeRand = 0;                           //semi-opaque ellipses with no variant in size
  }
  ellipse(count, (height/2+40) + random(-yRand, yRand), 20 + sizeRand, 20 + sizeRand);             //the first of two ellipse rows begins from the left and leads to the right of the canvas
  ellipse(width-count, (height/2-40) + random(-yRand, yRand), 20 + sizeRand, 20 + sizeRand);       //the second row begins at the right of the canvas and is set above instead of below the midpoint. both overlap to create a greater density
  count += countRate;                       //the count increments at random amount times the frame rate
  if (count > width) {
    count = 0;
  }
}

//reset code borrowed from Alejandro González

void keyPressed() {                         //when the 's' key is pressed, the program is set back to the setup stage of the script
  if (key == 's') {
    count = 0;                              //the count variable is reset, so that each row begins again from either side of the canvas
    setup();
  }
}


