
void crearControles(){
  //para poder utilizar la libreria de contolP5
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(true);
  
  //Crea la ventana nueva para el controlador
  controlWindow = controlP5.addControlWindow("controlWindow",100,100,380,380);
  //Crea el fondo de la pantalla
  controlWindow.setBackground(color(40));
  
  controlP5.addSlider("tamano", 1, 47, 0, 20, 10, 100, 10).setWindow(controlWindow);
  controlP5.addToggle("cuadrado", 100, 50, 30, 30).setWindow(controlWindow);
}


void tamano(int a) {
  crece = a;
}
void cuadrado(){
  rectangulo = !rectangulo;
}

