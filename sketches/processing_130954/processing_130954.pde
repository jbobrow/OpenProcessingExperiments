

float Axisx = PI/4; //For the angle of cube later
float Axisy = PI/4;

void setup() {
  size(640, 360, P3D); //Using the P3D is what enables the 3D in Processing
  fill(255);
  stroke(color(44,48,32));
  
  
}

void draw() {
  background(255, 204, 0);
  noStroke();
  ambientLight(102, 102, 102);//Changes the lighting on the cube without touch it's colour value
  pointLight(102, 102, 126, 35, 40, 36); //Shines a light on the top left of the cube, again effecting its colour
  translate(width/2.0, height/2.0, +100); //Placement of cube 
  rotateX(Axisx); //Tilts the cube on both axis so the 3D effect is more obvious
  rotateY(Axisy);
  scale(35.0);// Multiples the origial dimensions by 3500%

  beginShape(QUADS);//Given the QUADS value to tell what kind of shape it will be
  
  
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(255, 0, 0); vertex(-1, -1,  1, 0, 0);//Gives the conditions for each vertex, you can make it small and use the scale function to easily enlarge
  fill(255, 0, 0); vertex( 1, -1,  1, 1, 0);
  fill(255, 0, 0); vertex( 1,  1,  1, 1, 1);
  fill(255, 0, 0); vertex(-1,  1,  1, 0, 1);
  

  
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(255, 0, 0); vertex( 1, -1, -1, 0, 0);
  fill(255, 0, 0); vertex(-1, -1, -1, 1, 0);
  fill(255, 0, 0); vertex(-1,  1, -1, 1, 1);
  fill(255, 0, 0); vertex( 1,  1, -1, 0, 1);

  
  strokeWeight(1);
  stroke(0, 0, 0);
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(255, 0, 0); vertex(-1, -1, -1, 0, 0);
  fill(255, 0, 0); vertex( 1, -1, -1, 1, 0);
  fill(255, 0, 0); vertex( 1, -1,  1, 1, 1);
  fill(255, 0, 0); vertex(-1, -1,  1, 0, 1);

  
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(255, 0, 0); vertex( 1, -1,  1, 0, 0);
  fill(255, 0, 0); vertex( 1, -1, -1, 1, 0);
  fill(255, 0, 0); vertex( 1,  1, -1, 1, 1);
  fill(255, 0, 0); vertex( 1,  1,  1, 0, 1);

  
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(255, 0, 0); vertex(-1, -1, -1, 0, 0);
  fill(255, 0, 0); vertex(-1, -1,  1, 1, 0);
  fill(255, 0, 0); vertex(-1,  1,  1, 1, 1);
  fill(255, 0, 0); vertex(-1,  1, -1, 0, 1);

  endShape();
  
  
}

void mouseDragged() {
  float Frame = 0.01;//Sets frame count low so when dragged the cubes movement is smooth
  Axisx += (pmouseY-mouseY) * Frame;//Adds the X and Y position of the mouse to the X and Y axis, which shifts the cubes position.
  Axisy += (mouseX-pmouseX) * Frame;
}

/*Wanted to try out 3D in Processing. I originally tryed to add texture 
but could not get it to map properly*/


