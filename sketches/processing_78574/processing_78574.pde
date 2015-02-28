
// M_2_5_02_TOOL.pde
// GUI.pde


void setupGUI(){
  color activeColor = color(0,130,164);
  controlP5 = new ControlP5(this);
  //controlP5.setAutoDraw(false);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));

  ControlGroup ctrl = controlP5.addGroup("menu",0,0,0);
  ctrl.activateEvent(true);
  ctrl.setColorLabel(color(0));
  ctrl.close();


  sliders = new Slider[30];
  ranges = new Range[30];
  toggles = new Toggle[30];
  bangs = new Bang[30];

  int left = 0;
  int top = 5;
  int len = 300;

  int si = 0;
  int ri = 0;
  int ti = 0;
  int bi = 0;
  int posY = 0;

  sliders[si++] = controlP5.addSlider("pointCount",1,8000,left,top+posY,len,15);
  posY += 30;

  sliders[si++] = controlP5.addSlider("freqX",1,50,left,top+posY,len,15);
  sliders[si++] = controlP5.addSlider("freqY",1,50,left,top+posY+20,len,15);
  sliders[si++] = controlP5.addSlider("phi",0,360,left,top+posY+40,len,15);
  posY += 70;

  sliders[si++] = controlP5.addSlider("modFreqX",0,50,left,top+posY,len,15);
  sliders[si++] = controlP5.addSlider("modFreqY",0,50,left,top+posY+20,len,15);
  posY += 50;

  sliders[si++] = controlP5.addSlider("modFreq2X",0,50,left,top+posY,len,15);
  sliders[si++] = controlP5.addSlider("modFreq2Y",0,50,left,top+posY+20,len,15);
  sliders[si++] = controlP5.addSlider("modFreq2Strength",0,1,left,top+posY+40,len,15);
  posY += 70;

  sliders[si++] = controlP5.addSlider("randomOffset",0,50,left,top+posY,len,15);
  posY += 30;

  toggles[ti] = controlP5.addToggle("invertBackground",invertBackground,left+0,top+posY,15,15);
  toggles[ti++].setLabel("Invert Background");
  sliders[si++] = controlP5.addSlider("lineWeight",1,50,left,top+posY+20,len,15);
  sliders[si++] = controlP5.addSlider("lineAlpha",0,100,left,top+posY+40,len,15);
  posY += 70;

  ranges[ri++] = controlP5.addRange("hueRange",0,720,minHueValue,maxHueValue,left,top+posY+0,len,15);
  sliders[si++] = controlP5.addSlider("saturationValue",0,100,left,top+posY+20,len,15);
  sliders[si++] = controlP5.addSlider("brightnessValue",0,100,left,top+posY+40,len,15);
  toggles[ti] = controlP5.addToggle("invertHue",invertHue,left+0,top+posY+60,15,15);
  toggles[ti++].setLabel("Invert Hue Range");
  posY += 90;

  sliders[si++] = controlP5.addSlider("connectionRadius",1,500,left,top+posY+0,len,15);
  //sliders[si++] = controlP5.addSlider("connectionRamp",1,20,left,top+posY+20,len,15);
  posY += 20;

  toggles[ti] = controlP5.addToggle("connectAllPoints",connectAllPoints,left+0,top+posY,15,15);
  toggles[ti++].setLabel("Connect All Points");


  for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].captionLabel().toUpperCase(true);
    sliders[i].captionLabel().style().padding(4,0,1,3);
    sliders[i].captionLabel().style().marginTop = -4;
    sliders[i].captionLabel().style().marginLeft = 0;
    sliders[i].captionLabel().style().marginRight = -14;
    sliders[i].captionLabel().setColorBackground(0x99ffffff);
  }
  for (int i = 0; i < ri; i++) {
    ranges[i].setGroup(ctrl);
    ranges[i].captionLabel().toUpperCase(true);
    ranges[i].captionLabel().style().padding(4,0,1,3);
    ranges[i].captionLabel().style().marginTop = -4;
    ranges[i].captionLabel().setColorBackground(0x99ffffff);
  }
  for (int i = 0; i < ti; i++) {
    toggles[i].setGroup(ctrl);
    toggles[i].setColorLabel(color(50));
    toggles[i].captionLabel().style().padding(4,3,1,3);
    toggles[i].captionLabel().style().marginTop = -19;
    toggles[i].captionLabel().style().marginLeft = 18;
    toggles[i].captionLabel().style().marginRight = 5;
    toggles[i].captionLabel().setColorBackground(0x99ffffff);
  }
  for (int i = 0; i < bi; i++) {
    bangs[i].setGroup(ctrl);
    bangs[i].setColorLabel(color(50));
    bangs[i].captionLabel().style().padding(4,3,1,3);
    bangs[i].captionLabel().style().marginTop = -19;
    bangs[i].captionLabel().style().marginLeft = 48;
    bangs[i].captionLabel().style().marginRight = 5;
    bangs[i].captionLabel().setColorBackground(0x99ffffff);
  }

}



void drawGUI(){
  controlP5.show();
  controlP5.draw();
}



void controlEvent(ControlEvent theControlEvent) {
  guiEvent = true;

  GUI = controlP5.group("menu").isOpen();

  if(theControlEvent.isController()) {
    if(theControlEvent.controller().name().equals("hueRange")) {
      float[] f = theControlEvent.controller().arrayValue();
      minHueValue = f[0];
      maxHueValue = f[1];
    }
  }
}

void invertBackground() {
  guiEvent = true;
  invertBackground = !invertBackground;
  updateColors(invertBackground);
}



void updateColors(boolean stat) {
  ControllerGroup ctrl = controlP5.getGroup("menu");

  for (int i = 0; i < sliders.length; i++) {
    if (sliders[i] == null) break;
    if (stat == false) {
      sliders[i].setColorLabel(color(50));
      sliders[i].captionLabel().setColorBackground(0x99ffffff);
    } 
    else {
      sliders[i].setColorLabel(color(200));
      sliders[i].captionLabel().setColorBackground(0x99000000);
    }
  }
  for (int i = 0; i < ranges.length; i++) {
    if (ranges[i] == null) break;
    if (stat == false) {
      ranges[i].setColorLabel(color(50));
      ranges[i].captionLabel().setColorBackground(0x99ffffff);
    } 
    else {
      ranges[i].setColorLabel(color(200));
      ranges[i].captionLabel().setColorBackground(0x99000000);
    }
  }
  for (int i = 0; i < toggles.length; i++) {
    if (toggles[i] == null) break;
    if (stat == false) {
      toggles[i].setColorLabel(color(50));
      toggles[i].captionLabel().setColorBackground(0x99ffffff);
    } 
    else {
      toggles[i].setColorLabel(color(200));
      toggles[i].captionLabel().setColorBackground(0x99000000);
    }
  }
  for (int i = 0; i < bangs.length; i++) {
    if (bangs[i] == null) break;
    if (stat == false) {
      bangs[i].setColorLabel(color(50));
      bangs[i].captionLabel().setColorBackground(0x99ffffff);
    } 
    else {
      bangs[i].setColorLabel(color(200));
      bangs[i].captionLabel().setColorBackground(0x99000000);
    }
  }
}



