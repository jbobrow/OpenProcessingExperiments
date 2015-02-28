
PMatrix3D pos = new PMatrix3D();
boolean firstView = true;

void setup()
{
  size(400, 400, P3D);
}

void draw() 
{
  background(190);
  // global screen setup
  translate(width/2, height-50, 0); // make the world lower === make the camera higher
  // move camera

  pos.rotateY(0.01 * PI * (width/2 - mouseX)/width);

  PMatrix3D inv = new PMatrix3D(pos);
  inv.invert();

  if (!firstView) {
    rotateX(-PI/6);
    pushMatrix();
    applyMatrix(pos);
    robot();
    popMatrix();
  }
  else {
    translate(0, 0, (height/2.0/tan(PI*60.0/360.0))); // translate to out of the screen with 60 degree for v
    robot();
    applyMatrix(inv);
    translate(0, 0, -(height/2.0/tan(PI*60.0/360.0))); // back
  }
  fill(40,200,100,30);
  for (int i = -5; i < 5; i++) {
    for (int j = 0; j< 10; j++) {
      pushMatrix();
      translate(i*1000, 0, -j*1000);
      box(100, 800, 100);
      popMatrix();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)   pos.translate(0, 0, -10);
    if (keyCode == DOWN) pos.translate(0, 0, 10);
    if (keyCode == LEFT) pos.translate(-10, 0, 0);
    if (keyCode == RIGHT) pos.translate(10, 0, 0);
    if (keyCode == SHIFT)   firstView = !firstView;
  }
}


void robot() 
{
  fill(200,30,60,10);
  translate(0, -150, 0); // eyes height is 150 cm
  box(60, 60, 20);
  fill(200,30,60,10);
  translate(0, 0, -10);
  box(40, 10, 10);
}










