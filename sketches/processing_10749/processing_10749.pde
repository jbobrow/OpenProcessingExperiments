
// GUI for my Tests

void setupGUI() {
  controlP5 = new ControlP5(this);
  color activeColor = color(0,130,164);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));
  
  ControlGroup ctrl = controlP5.addGroup("menu",15,25,35);
  ctrl.setColorLabel(color(255));
  ctrl.close();

  sliders = new Slider[30];
  ranges = new Range[30];
  toggles = new Toggle[30];
  bangs = new Bang[30];
  
  int left = 0;
  int top = 5;
  int len = 300;
  int thick = 15;

  int si = 0;
  int ri = 0;
  int ti = 0;
  int ba = 0;
  int posY = 0;

  sliders[si++] = controlP5.addSlider("barSaturation",1,100,left,top+posY+0,len,thick);
  sliders[si++] = controlP5.addSlider("barBrightness",1,100,left,top+posY+20,len,thick);
  posY += 50;

  sliders[si++] = controlP5.addSlider("barHue",1,360,left,top+posY,len,thick);
 
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
    ranges[i].setId(i);
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

}

void drawGUI() {
  controlP5.show();
  controlP5.draw();
}

// called on every change of the gui
void controlEvent(ControlEvent theControlEvent) {
/* for range sliders
  if(theControlEvent.controller().name().equals("bar length range")) {
    float[] f = theControlEvent.controller().arrayValue();
    barLengthStart = f[0];
    barLengthEnd = f[1];
  }
*/  
}

