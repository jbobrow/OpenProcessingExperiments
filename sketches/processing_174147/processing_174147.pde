
//Instrucciones: mover el mouse para definir el tamaño de la camara, para detener la camara y salvar la imagen se debe presionar el mouse ( las imagenes se
//guardan en la carpeta de data, al dejar de presionar el mouse la camara vuelve a iniciar.

import processing.video.*;

Capture cam;

void setup() {
  background(#18EDAF);
  size(640, 480); 
 
  String[] cameras = Capture.list(); 
  
  if (cameras.length == 0) {
    println("La camara no esta disponible.");
    exit();
  } else {
    println("Camaras Disponibles:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0, mouseX, mouseY);
}

void mousePressed() {
  
   cam.stop();
   saveFrame("data/Capture-#####.jpg");
}

void mouseReleased(){
  
  cam.start();
}




