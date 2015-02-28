
import controlP5.*;          // GUI
ControlP5 controlP5;
PMatrix3D currCameraMatrix;
PGraphics3D g3; 


void setupGUI () {

  g3 = (PGraphics3D)g;
  controlP5 = new ControlP5(this);
  controlP5.addSlider("Breite", 0, 50, 10, 10, 10, 150, 20);
  controlP5.addSlider("Laenge", 0, 50, 20, 10, 40, 150, 20);
}

void drawGUI() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
  g3.camera = currCameraMatrix;
}


void Breite (float val) {
  bre = val;
}
void Laenge (float val) {
  lae = val;
}


