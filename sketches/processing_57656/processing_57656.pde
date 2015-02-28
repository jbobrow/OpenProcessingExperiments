
//////////////////////////////////////////////////////////////////

void gui_setup() {
  size(800, 600, P3D);
  g3 = (PGraphics3D)g;
  smooth();
  //frameRate(3);
  if (Reset==false) {
    cam = new PeasyCam(this, 500);
    cam.setMinimumDistance(50);
  }
  // cam.setMaximumDistance(4000);
}

//////////////////////////////////////////////////////////////////

void gui_draw() {
  background(0);
  gui_mouseOver();
}

//////////////////////////////////////////////////////////////////

void gui_P5_onTop() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
  g3.camera = currCameraMatrix;
}
//////////////////////////////////////////////////////////////////

void gui_addSlider() {
  controlP5 = new ControlP5(this);

  controlP5.addSlider("Grid_Trans", 0, 255, Grid_Trans, 10, 10, 100, 10);
  controlP5.addSlider("GridLn_Trans", 0, 255, GridLn_Trans, 10, 30, 100, 10);
  controlP5.addSlider("Mover_Trans", 0, 255, Mover_Trans, 10, 50, 100, 10);
  controlP5.addSlider("Boxel_Trans", 0, 255, Boxel_Trans, 10, 70, 100, 10);

  controlP5.addSlider("RadiusMover", 0, 1255, RadiusMover, 10, 110, 100, 10);
  controlP5.addSlider("MoverHeight", -100, 200, MoverHeight, 10, 130, 100, 10);

  // controlP5.addSlider("numX", 10, 60, numX, 10, 200, 100, 10);
  // controlP5.addSlider("numY", 10, 60, numY, 10, 220, 100, 10);

  controlP5.addSlider("Starter_Size", 1, 20, Starter_Size, 10, 240, 100, 10);
  controlP5.addSlider("CountEnd", 1, 66, CountEnd, 10, 260, 100, 10);


  controlP5.addButton("Compute", 1, 10, height-60, 60, 20);
  controlP5.addButton("Reset", 1, 10, height-40, 60, 20);

  //controlP5.setControlFont(new ControlFont(createFont("Arial", 1), 11));
  //textAlign(RIGHT); 
 // myTextlabelA = controlP5.addTextlabel("label", str( BoxelS_active.size()), width-100, height-20);
  //myTextlabelA.setColorValue(0xffcccccc);

  controlP5.setAutoDraw(false);
}
public void Compute() {
  Compute=!Compute;
}
public void Reset() {
  Reset=!Reset;
}

//////////////////////////////////////////////////////////////////

public void gui_mouseOver() {
  if (controlP5.window(this).isMouseOver()) {
    cam.setActive(false);
  } 
  else {
    cam.setActive(true);
  }
}
//////////////////////////////////////////////////////////////////


