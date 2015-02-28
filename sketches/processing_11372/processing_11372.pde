
void createControlPanel(){
  
  GComponent.globalFont = GFont.getFont(this, "Verdana", 11);
//------
//Window
//------
  ControlPanel = new GWindow(this, "Painel de Controle", 0, 0, 400, 250, false, P2D);
  ControlPanel.setBackground(color(200));
  ControlPanel.setResizable(false);

//------
//Labels
//------
  lblA = new GLabel(this, "a", 10, 20, 60);
  ControlPanel.add(lblA);

  lblB = new GLabel(this, "b", 10, 65, 60);
  ControlPanel.add(lblB);

  lblX0 = new GLabel(this, "x0", 10, 110, 60);
  ControlPanel.add(lblX0);

  lblDelta = new GLabel(this, "Delta: ", 10, 200, 100, 40);
  ControlPanel.add(lblDelta);

//------
//Sliders
//------
  sdrA = new GWSlider(this, 40, 20, 350);
  sdrA.setLimits(a, 0, 2);
  sdrA.setValueType(GWSlider.DECIMAL);
  ControlPanel.add(sdrA);

  sdrB = new GWSlider(this, 40, 65, 350);
  sdrB.setLimits(b, 0, 2);
  sdrB.setValueType(GWSlider.DECIMAL);
  ControlPanel.add(sdrB);

  sdrX0 = new GWSlider(this, 40, 110, 350);
  sdrX0.setLimits(x0, minX, maxX);
  sdrX0.setValueType(GWSlider.DECIMAL);
  ControlPanel.add(sdrX0);

//------
//Buttons
//------
  btnPause = new GButton(this, "Começar", 10, 150, 100, 40);
  btnPause.setColours(120, 160, 200);
  ControlPanel.add(btnPause);

  btnReset = new GButton(this, "Recomeçar", 120, 150, 100, 40);
  btnReset.setColours(120, 160, 200);
  ControlPanel.add(btnReset);

  btnClear = new GButton(this, "Limpar", 230, 150, 100, 40);
  btnClear.setColours(120, 160, 200);
  ControlPanel.add(btnClear);

}

void handleButtonEvents(GButton button){
  if ( button == btnPause){
    togglePause();
  }
  
  if ( button == btnReset){
    restart();
  }
  
  if ( button == btnClear){
    clear();
  }
}

void handleSliderEvents(GSlider slider){
  if ( slider == sdrA) {
    a = sdrA.getValuef();
    updateDelta();
  }
  else if ( slider == sdrB) {
    b = sdrB.getValuef(); 
    updateDelta();
  }
  else if ( slider == sdrX0) {
    x0 = sdrX0.getValuef(); 
    pause = true;
    restart();
  }
}



