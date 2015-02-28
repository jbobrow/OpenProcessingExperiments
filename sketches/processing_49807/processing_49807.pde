
// load the appropriate toxiclibs libraries
import toxi.geom.*;
import toxi.color.*;

// declare three TColor variables, and some others
TColor c, c_target;
float change_rate, t;
// boolean to tell if the colour is still changing
boolean changing = false;


void setup() {
  size(400,400);
  background(0);
  noStroke();
  // determines the speed of colour change
  change_rate = 0.001;
  // create a new random colour
  c = TColor.newRandom();
}

void draw() {
  // get the complement to the current block colour
  // and set it as the background.
  TColor back = c.getComplement();
  background(back.toARGB());
  // set the fill to the colour c
  fill(c.toARGB());
  // draw a rectangle in the centre of the screen
  rect(100,100,200,200);
  // check if the colour should be changing
  if(changing) {
    // blend c with the target colour, an amount dependant
    // on the time t
    c.blend(c_target,t);
    // increment time slightly
    t += change_rate;
    // check the distance to the target colour in HSV space
    float c_dist = c.distanceToHSV(c_target);
    // when the colour is close enough stop changing.
    if(c_dist<0.01){
      changing = false;
    }
  }
}

 void keyPressed() {
   // if a key is pressed pick a new random colour to change to
  c_target = TColor.newRandom();
  // reset time to be zero
  t = 0;
  changing = true;
}

