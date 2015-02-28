
void setupGUI() {
  ControlP5 cp5 = new ControlP5(this);
  ControlWindow cwindow = cp5.addControlWindow("window",0,0,400,200);
  Slider threshSlide = cp5.addSlider("threshold", 0.0,1.0,10,10,300,20);
  threshSlide.setWindow(cwindow);
}

