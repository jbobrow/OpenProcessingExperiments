
// Utilise la webcam du MacBook Pro en 1280x720

import processing.video.*;

Capture camera;

void setup() {
  size(1280, 720);
  background(0);

  //String[] devices = Capture.list();
  //println(devices);

  camera = new Capture(this);
  //camera = new Capture(this, devices[0]); // Activer à la palce de la ligne précédente
  // lorsque les deux lignes commentées ci-dessus sont actives
  // Sert à récupérer les infos sur la webcam de l'ordi.
  
  camera.start();
}

void draw() {
  if (camera.available()) {
    camera.read();
  }
  
  image(camera, 0, 0);
}

//void captureEvent(Capture cam) {
//  cam.read();
//}


