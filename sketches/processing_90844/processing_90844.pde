
//Valentina Pherson
//Creative Computing
//February 22, 2012
//Bounce bounce circle

int circlex = 200;
int circley = 300;
int circleXspeed = 2;
int circleYspeed = 1;
int r = 32;

void setup() {
  size(400,600);
  smooth();
}

void draw() {

  // Add the speed to the x placement.
    circlex = circlex + circleXspeed;
    circley = circley + circleYspeed;
  //confine circle to smaller box
  if ((circlex > 250) || (circlex < 150)) {
    // When the circle reaches the edge, times it by negative to switch direction
    circleXspeed = circleXspeed * -1;
    //when it changes direction, increase size
    r = 80;
  }
  //confine circle to smaller box
  if ((circley > 400) || (circley < 200)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    circleYspeed = circleYspeed * -1;
    //when it changes direction, increase size
    r= 80;
  }

  // Display circle at x place
   stroke(0);
   fill (random(0,255),random(0,255), random (0,255),60);
   ellipse(circlex,circley,r,r);
  
  //keep circle within these sizes, and regulate how fast it pops
  r = constrain(r-10,32,80);
  
  //if you click
  if(mousePressed==true) {
    //color turns red
     fill(255,0,0);
     //circle changes to ellipse
     ellipse(circlex,circley,r/4,r+50);
  }
  
}
