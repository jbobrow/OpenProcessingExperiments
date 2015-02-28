
import processing.video.*;
Capture myCapture;
PImage buffer; 
int anchoVideo =640;
int altoVideo = 480;
float distancia; 
 
void setup()  {
  size(640, 480);
  String[] cameras = Capture.list();
  myCapture = new Capture (this, cameras[0]);
  myCapture.start();
}
 
void captureEvent(Capture myCapture) {
  myCapture.read();
}
void draw() {
  noStroke();
  float resolucion = map(distancia, 0,427,1,30);/////(valor recibido, valorminimo recibido, valor maximo recibido, valor minimo esperado, valor maximo resolucion)
  int res = int(resolucion);
  buffer = myCapture;
  for(int i= 0; i<buffer.width; i+= res){
    for(int j= 0;j<buffer.height; j+= res){
      color miColor = buffer.get(i,j);
      fill(miColor);
      rect(i,j, res, res);
    }
  }
}
void mouseMoved() {
  PVector centro = new PVector(width/2, height/2);
  PVector posMouse = new PVector(mouseX, mouseY); 
  distancia = centro.dist(posMouse);
}
