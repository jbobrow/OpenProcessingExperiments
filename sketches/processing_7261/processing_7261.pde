
// camera_agent
// (c) Alasdair Turner 2008-10
// A moving agent in a scene
// Click the mouse to toggle between a fixed camera and a camera attached to the agent
// Press a key to reset

boolean attached = false;
// matrix records the agent's location
PMatrix3D matrix;

void setup()
{
  size(400,400,P3D);
  matrix = new PMatrix3D();
  // this is a hack for 1.0.9
  ((PGraphics3D)g).cameraNear = -8;
}

void draw()
{
  background(204);
  lights();
  noStroke();

  // scene location -- note the z is the camera offset
  translate(width/2,height*3/5,(height/2)/tan(PI/6));

  // move a step (-1 in Z = into the scene)
  matrix.translate(0,0,-1);
  // rotate according to the current mouse position
  matrix.rotateY( 0.0002 * (width/2-mouseX) );

  if (!attached) {
    translate(0,height/5,-height/2);
    // if the camera is not attached to the agent,
    // move to the agent location and draw the agent
    pushMatrix();
    applyMatrix(matrix);
    fill(0,192,0);
    box(10,40,10);
    popMatrix();
  }
  else {
    // if the camera is attached to the agent, apply the inverse
    // of the agent movement to the scene: 
    PMatrix3D inv = new PMatrix3D(matrix);
    inv.invert();
    applyMatrix(inv);
  }
  
  // some context
  translate(0,10,0);
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      pushMatrix();
      translate(40*(i-5), 0, -100-(40*j)); 
      fill(255);
      box(20,20,20); 
      popMatrix();
    }
  }
}

void mousePressed()
{
  attached = !attached;
}

void keyPressed()
{
  matrix = new PMatrix3D();
}


