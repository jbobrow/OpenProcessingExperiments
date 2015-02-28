

void gui_mousepressed() {
  if (mousePressed == true) { 
    if (mouseButton == RIGHT)
    {
      cam.setActive(false);
    }
  }
}

void gui_mouseOver() {
  if (controlP5.window(this).isMouseOver()) {
    cam.setActive(false);
  } 
  else {
    cam.setActive(true);
  }
}
//----------------------------------------------------
void gui_setCamera() {
  cam = new PeasyCam(this, 1500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(4000);
}
//----------------------------------------------------
void gui_P5_onTop() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
  g3.camera = currCameraMatrix;
}
//----------------------------------------------------
void gui_addSlider() {
  controlP5 = new ControlP5(this);
  controlP5.addSlider("SPRING_RESTLENGTH", 0, 100, SPRING_RESTLENGTH, 10, 10, 100, 10);
  controlP5.addSlider("SPRING_DAMPING", 0, 100, SPRING_DAMPING, 10, 30, 100, 10);
  controlP5.addSlider("Z_Height", -300, 300, Z_Height, 10, 50, 100, 10);
  controlP5.addSlider("Gravity", -2, 2, Gravity, 10, 70, 100, 10);

  controlP5.setAutoDraw(false);
}

//----------------------------------------------------
void clicked(int mx, int my) {
  for (int i=0;i<numX;i++) {  
    for (int j=0;j<numY;++j) {

      Particle newP=p_Grid[i][j];
      float theX =  screenX(newP.loc.x, newP.loc.y, newP.loc.z);
      float theY =  screenY(newP.loc.x, newP.loc.y, newP.loc.z);
      float d = dist(mx, my, theX, theY );
      if (d < 9) {
        if (newP.pFixed == true) {
          p_Grid[i][j].freeMe();
        }
        else {
          p_Grid[i][j].fixMe();
        }
      }
    }
  }
}
//----------------------------------------------------


