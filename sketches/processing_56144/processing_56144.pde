
float theta;   
float d;
int s;
import ddf.minim.*;
Minim minim;
AudioInput in;

void setup() {

  size(840, 460);
  smooth();

  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  
  float s;
  s = random(0,45);
  background(30, 90);
  
  strokeWeight(random(0,2));
  noFill();
  ellipse(width/2, height/2 + 60, s, s); 
  
  strokeWeight(random(0,1.4));
  //stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (random(500, 2070) / (float) PI) * 10f;



  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2, height);
  stroke(255);
  // Draw a line 120 pixels
  line(sin(a)*8, sin(a)*64, 0, -100);
  line(sin(a)/8, sin(a)/64, 0, 100);

 // Move to the end of that line
  translate(0, -120);
  // Start the recursive branching!
  branch(1200);
}


void branch(int h) {

  h *= in.right.get(90) * 40;

  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 0) {
    //pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(PI+sin(360));   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    //translate(45, height/8); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    //popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, h);
    translate(100, h);
    branch(h);
    popMatrix();
  }
}


