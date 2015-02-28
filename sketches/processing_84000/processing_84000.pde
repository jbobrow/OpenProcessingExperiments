
void crearControles()
{
  //para poder utilizar la libreria de contolP5
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(true);
  
  controlWindow = controlP5.addControlWindow("controlwindows",1300,200,200,100);
  controlWindow.setBackground(color(50));
  
  controlP5.addSlider("ChangeSize", 1, 100, 0, 20, 10, 100, 10).setWindow(controlWindow);
  controlP5.addToggle("ChangeForm", 100, 50, 30, 30).setWindow(controlWindow);
}


void ChangeSize(int a) {
  crece = a;
}
void ChangeForm(){
  rectangulo = !rectangulo;
}

