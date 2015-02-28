
/* GUI */
// This is all of the sliders and checkboxes are made and handled
// Using controlP5

import controlP5.*;

ControlP5 controlP5;

boolean GUImode = false;

ColorPicker cp;

void createGUI () {
  controlP5 = new ControlP5(this);
  controlP5.hide(); // have it hidden until it's turned on

  // All of the scroll bars
  
  controlP5.addRange("X Rotation", 0, 2*PI, xRotMin, xRotMax, 10, 10, 300, 14).setId(1);  
  controlP5.addRange("Y Rotation", 0, 2*PI, yRotMin, xRotMax, 10, 30, 300, 14).setId(2);  
  controlP5.addRange("Z Rotation", 0, 2*PI, zRotMin, xRotMax, 10, 50, 300, 14).setId(3);  
  
  controlP5.addRange("Scale", 0.1, 20, sScaleMin,sScaleMax, 10, 70, 300, 14).setId(4);  
  controlP5.addRange("Initial Force", 0, 1000000, maxForceMin,maxForceMax, 10, 90, 300, 14).setId(5);  
  controlP5.addRange("Minimum Draw Speed", 0.01, 10, drawToleranceMin,drawToleranceMax, 10, 110, 300, 14).setId(6);  
  
  controlP5.addRange("Timestep Size", 1, 50, fixedDeltaTimeMin,fixedDeltaTimeMax, 10, 130, 300, 14).setId(7);  
  controlP5.addRange("Constraint Accuracy", 1, 10, constraintAccuracyMin,constraintAccuracyMax, 10, 150, 300, 14).setId(8);  
  controlP5.addRange("Transparency", 1, 255, transparencyMin,transparencyMax, 10, 170, 300, 14).setId(9);  
  controlP5.addRange("Hue Cycle Speed", 0, 5, hueSpeedMin,hueSpeedMax, 10, 190, 300, 14).setId(10);  
  controlP5.addRange("Fabric Width", 1, 150, curtainWidthMin,curtainWidthMax, 10, 210, 300, 14).setId(11);  
  controlP5.addRange("Fabric Height", 1, 150, curtainHeightMin,curtainHeightMax, 10, 230, 300, 14).setId(12);  
  
  
  // Checkboxes
  
  CheckBox checkbox;
  CheckBox checkbox2;
  checkbox = controlP5.addCheckBox("Use Points Box", 10,330);  
  checkbox2 = controlP5.addCheckBox("Rainbow Mode Box", 10,350);  
  
  checkbox.addItem("Use Points",188);
  checkbox2.addItem("Rainbow Mode",69);
  
  checkbox.getItem(0).setState(usePoints); // wtf? This sets rbMode to false!
  checkbox2.getItem(0).setState(rbMode);
 
  cp = controlP5.addColorPicker("BG Color",10,270,255,20);
  cp.setColorValue(bgCol);
}
/* controlEvent */
// Gets called everytime something changes (checkbox is checked, slider is slid)
// We change variables accordingly
void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isController()) {
    if (theControlEvent.controller().name().equals("X Rotation")) {
      xRotMin = theControlEvent.controller().arrayValue()[0];
      xRotMax = theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Y Rotation")) {
      yRotMin = theControlEvent.controller().arrayValue()[0];
      yRotMax = theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Z Rotation")) {
      zRotMin = theControlEvent.controller().arrayValue()[0];
      zRotMax = theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Scale")) {
      sScaleMin = theControlEvent.controller().arrayValue()[0];
      sScaleMax = theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Initial Force")) {
      maxForceMin = theControlEvent.controller().arrayValue()[0];
      maxForceMax = theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Timestep Size")) {
      fixedDeltaTimeMin = (int)theControlEvent.controller().arrayValue()[0];
      fixedDeltaTimeMax = (int)theControlEvent.controller().arrayValue()[1];
      fixedDeltaTimeSeconds = (float)fixedDeltaTime / 1000;
    }
    if (theControlEvent.controller().name().equals("Constraint Accuracy")) {
      constraintAccuracyMin = (int)theControlEvent.controller().arrayValue()[0];
      constraintAccuracyMax = (int)theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Transparency")) {
      transparencyMin = theControlEvent.controller().arrayValue()[0];
      transparencyMax = theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Hue Cycle Speed")) {
      hueSpeedMin = theControlEvent.controller().arrayValue()[0];
      hueSpeedMax = theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Fabric Width")) {
      curtainWidthMin = (int)theControlEvent.controller().arrayValue()[0];
      curtainWidthMax = (int)theControlEvent.controller().arrayValue()[1];
    }
    if (theControlEvent.controller().name().equals("Fabric Height")) {
      curtainHeightMin = (int)theControlEvent.controller().arrayValue()[0];
      curtainHeightMax = (int)theControlEvent.controller().arrayValue()[1];
    }
  }
  else {
    if (theControlEvent.group().name().equals("Use Points Box")) {
    if ((int)theControlEvent.group().arrayValue()[0] == 1)
      usePoints = true; //theControlEvent.group().getItem(0).getState();
    else
      usePoints = false;
    }
    else if (theControlEvent.group().name().equals("Rainbow Mode Box")) {
    if ((int)theControlEvent.group().arrayValue()[0] == 1)
      rbMode = true;
    else
      rbMode = false;
    }
  }
}


