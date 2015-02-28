
// M_1_5_02_TOOL.pde
// Agent.pde, GUI.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

void setupGUI() {
  color activeColor = color(0, 130, 164);
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(false);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));

  ControlGroup ctrl = controlP5.addGroup("menu", 15, 25, 35);
  ctrl.setColorLabel(color(255));
  ctrl.close();

  sliders = new Slider[10];

  int left = 0;
  int top = 5;
  int len = 300;

  int si = 0;
  int posY = 0;

  sliders[si++] = controlP5.addSlider("agentsCount", 1, 10000, left, top+posY+0, len, 15);
  posY += 30;

  sliders[si++] = controlP5.addSlider("noiseScale", 1, 1000, left, top+posY+0, len, 15);
  sliders[si++] = controlP5.addSlider("noiseStrength", 0, 100, left, top+posY+20, len, 15);
  posY += 50;

  sliders[si++] = controlP5.addSlider("strokeWidth", 0, 10, left, top+posY+0, len, 15);
  posY += 30;

  sliders[si++] = controlP5.addSlider("agentsAlpha", 0, 255, left, top+posY+0, len, 15);
  sliders[si++] = controlP5.addSlider("overlayAlpha", 0, 255, left, top+posY+20, len, 15);

  for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].captionLabel().toUpperCase(true);
    sliders[i].captionLabel().style().padding(4, 0, 1, 3);
    sliders[i].captionLabel().style().marginTop = -4;
    sliders[i].captionLabel().style().marginLeft = 0;
    sliders[i].captionLabel().style().marginRight = -14;
    sliders[i].captionLabel().setColorBackground(0x99ffffff);
  }
}

void drawGUI() {
  controlP5.show();
  controlP5.draw();
}

void controlEvent(ControlEvent theEvent) {

  if (theEvent.isController()) {
    if (theEvent.controller().name()=="agentsCount") {
      agentsCount = int(theEvent.controller().value());
    }
    else if (theEvent.controller().name()=="noiseScale") {
      noiseScale = theEvent.controller().value();
    }
    else if (theEvent.controller().name()=="noiseStrength") {
      noiseStrength = theEvent.controller().value();
    }
    else if (theEvent.controller().name()=="strokeWidth") {
      strokeWidth = theEvent.controller().value();
    }
    else if (theEvent.controller().name()=="agentsAlpha") {
      agentsAlpha = theEvent.controller().value();
    }
    else if (theEvent.controller().name()=="overlayAlpha") {
      overlayAlpha = theEvent.controller().value();
    }
  }
}


