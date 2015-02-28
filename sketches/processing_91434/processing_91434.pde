
//Lucy Barker
// Introduction to Digital Design, u 8196, Sem 1, Uni of Canberra 2013, MA Digital Design 103JA

// this code has been adapted from Mitchell Whitelaw's flower machine sketch

// this sketch will demonstrate: ITERATION (loops), FUNCTIONS (with arguments), MOUSE & KEYBOARD INTERACTION.

void setup() {//this function is called once when the program starts.  Used to define initial environment properties and load media such as images or fonts.
  size(1500, 1000); // must be first line of code ithin setup.  It defines the dimensions of the display window in pixels (width,height) 
  background(0);// sets the colour in the background of the processing window in terms of greyscale because there is only one number.  If there are 3 numbers the default colour mode is (Red,Green,Blue).placed here it is drawn once.
  smooth(4);//draws with anti-aliased edges and is active by default, a level, 2 , 4 or 8 can be added to increase the level of smoothness.
  strokeWeight(0.3);//thickness of the lines in pixels
  stroke(255, 150);//the stroke is specified as a shade of grey as 2 values are given (grey,alpha)
}


void draw() { // draw function is empty but required here to process mousePressed() later on
}

void spiro(int xpos, int ypos, int numellip, float angle, float spiroscale) { // here I have created my custom function to create a traitional 'spirograph-like' drawing
  // the function needs information to run - this information is given in the form of parameters or ARGUMENTS.  The arguements are declared here as 5 variables that will be established later)
  pushMatrix(); // this function saves the proceeding transform as the current co-ordinate system so rotations are all done relative to this (it 'pushes' the transform onto the 'Matrix Stack')
  translate(xpos, ypos);//this function specifies the amount an object is displaced (using x, y co-ordinates) within the display window starting from (0,0). Therefore(xpos, ypos) effectively become(0,0)
  scale(spiroscale);// scale will increase or decrease the size of our object (in this case a spirograph) and is specified in decimal percentages.

  for (int i=0; i<numellip*50; i++) {// the 'for' structure controls a sequence of repetitions or ITERATIONS. (it has 3 parts (initiate; test; update), each seperated by a semicolon,
    //It runs through each part in a loop until 'test' is determined to be false. then the loop is exited.
    fill(random(200), random(200), random(100, 255), 20);//colour each ellipse in default (R,G,B, alpha) mode. Where 255 is the maximum value.
    ellipse(50, 0, 100, 40);//draw an ellipse off centre by 50 pix to the right.  This is the element repeated in the loop. 
    rotate(angle); //each time the loop is run the ellipse element is rotated by this much around (xpos,ypos)
    scale(0.997);//each time the loop is run the ellipse element is scaled down by 99.7%
  }
  popMatrix(); // the current transform is 'popped off' the matrix stack and the co-ordinate system is reset for the next spirograph to be drawn
}


void mousePressed() {
  spiro(mouseX, mouseY, 20, TWO_PI/random(0.001), random(0.5, 3));// when the mouse is pressed call our custom function 'spiro' and specify what the ARGUMENTS will be.
  //in this case the location of the function (xpos and ypos) will be specified by the location of the mouse (mouseX and mouseY).
  // the number of ellipses will be 20 (NB. this becomes 100 when run through the loop) 
  // the angle the ellipses are rotated is 360 degrees (ie, TWO_PI) divided by 0.001 radian.  If we set the angle very small here to say TWO_PI/0.00002 and make it negative, you will have a 'shell drawing machine' instead.
  // the scale the spirographs are drawn at is a random percentage between 50%-300%
  // each of the function's agruments can be easily altered to effect the look of the pattern created or their positon
}

void keyPressed() {//the key function is called once everytime a key is pressed
  if (key == ' ') {//here it is specified that the key is the 'spacebar', note the single inverted comma and the double equals sign.
    background(100, 200, 220);// the background will change to this colour (default RGB mode) when the space bar is pressed.
    stroke(0,200); // and the stroke will be a shade of black
  }
   if (key == 'b') {//if the key is 'b'
    background(0);// the background will reuturn to black
    stroke(255,150); // and the stroke will return to a translucent white
  }
  
}



