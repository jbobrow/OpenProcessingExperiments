
import controlP5.*;          // GUI
ControlP5 controlP5;
PMatrix3D currCameraMatrix;
PGraphics3D g3; 


void setupGUI () {

  g3 = (PGraphics3D)g;
  controlP5 = new ControlP5(this);
  controlP5.addSlider("Rechteck_yz", 0,255,0, 10, 10, 150, 20);
  controlP5.addSlider("Rechteck_xy", 0,255,0, 10, 40, 150, 20);
  controlP5.addSlider("Rechteck_xz", 0,255,0, 10, 70, 150, 20);
  controlP5.addSlider("Kanten", 0,255,0, 10, 130, 150, 20);
  controlP5.addSlider("Kappe_vorn", 0,255,0, 10, 190, 150, 20);
  controlP5.addSlider("Kappe_hinten", 0,255,0, 10, 220, 150, 20);
  controlP5.addSlider("Streifen_mitte",0,255,0, 10, 250, 150, 20);
  
  
}

void drawGUI() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
  g3.camera = currCameraMatrix;
}


void Rechteck_yz (float val) {
  transRyz = val;
}
void Rechteck_xy (float val) {
  transRxy = val;
}
void Rechteck_xz (float val) {
  transRxz = val;
}
void Kanten (float val) {
  transBorder = val;
}
void Kappe_vorn (float val) {
  transKv = val;
}
void Kappe_hinten (float val) {
  transKh = val;
}
void Streifen_mitte (float val) {
  transSm = val;
}


