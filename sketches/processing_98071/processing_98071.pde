

void setup() 
{
  size(700, 700, P3D);
  colorMode(HSB, 1); // Sets the colour mode
  frameRate(1000); // Makes the framerate the fastest possilbe 
}

void draw() 
{
  background(0); // This makes the background colour black
  translate(350, 350, 0); // This causes the cube to be moved to the centre of the void
  rotateY(mouseX*0.01); // This causes the cube to spin when the mouse is moved
  rotateX(mouseY*0.01); // This causes the cube to spin when the mouse is moved
  box(300); // This draws the 3D cube

 // Code makes the cube change colour
  float hue_incr = frameCount * .0002 + .5;
  float hue = hue_incr;
  hue -= Math.floor(hue);
  fill(hue, 1, 1);  
}


