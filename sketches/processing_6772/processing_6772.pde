
//import processing.video.*;

//MovieMaker mm;

// Pendulum properties
int lengthOfPendulum = 160;
float swingAngle = 90.0;
float frequency = 10;

// The frame range of the animation
int frameRange = 360;

void setup()
{
  size(360, 360);
  background(0);
  smooth();
  frameRate(25);

  //mm = new MovieMaker(this, width, height, "BasicPendulum.mov",
  //        12, MovieMaker.ANIMATION, MovieMaker.HIGH);
}

float frame = 0.0;
float direction = 0.0;
float decay = 0.0;
float angle = 0.0;

void draw()
{
  // Motion blur using alpha-blending
  fill(0, 120);
  rect(0, 0, width, height);

  // Translate the pendulum to the center of screen
  translate(width/2, height/2);

  // Current frame of animation
  frame = frameCount%frameRange;

  // The direction [-1, 1] in which the pendulum should swing 
  direction = sin(radians(frame*frequency));
  
  // Slow down the pendulum by adding a linear decay
  decay = direction*lerp(1, 0, frame/frameRange);
  
  // Calculate the instantaneous angle of the swing after considering decay
  angle = decay*swingAngle;
  
  // Rotate and draw the pendulum
  rotate(radians(angle)+HALF_PI);
  drawPendulum();

  //mm.addFrame();
}

void drawPendulum()
{
  // draw line
  stroke(255);
  strokeWeight(3);
  line(0, 0, lengthOfPendulum, 0);

  // draw circle
  fill(255, 0, 0);
  stroke(255, 255, 0);
  strokeWeight(2);
  ellipse(lengthOfPendulum, 0, 25, 25);
}

void keyPressed() {
  if (key == ' ') {
    // Finish the movie if space bar is pressed
    // mm.finish();
    // Quit running the sketch once the file is written
    exit();
  }
}





