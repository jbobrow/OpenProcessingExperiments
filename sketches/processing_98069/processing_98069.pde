

void setup() 
{
  size(700, 700, P3D); // set up the size of the 3D ball
  background(0); // This makes the background colour black
  colorMode(HSB, 1); // Sets the colour mode
  frameRate(1000); // Makes the framerate the fastest possilbe 
}

void draw() 
{             
  translate(350, 350, 0); // This causes the 3D ball to be moved to the centre of the void
  rotateY(mouseX*0.01); // This causes the 3D ball to spin when the mouse is moved
  rotateX(mouseY*0.01); // This causes the 3D ball to spin when the mouse is moved
  sphere(200); // This draws the 3D ball
 
 // Code makes the ball change colour
  float hue_incr = frameCount * .0002 + .5;
  float hue = hue_incr;
  hue -= Math.floor(hue);
  fill(hue, 1, 1);  
}


