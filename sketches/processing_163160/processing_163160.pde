
/**
This sketch demonstrates how to create objects that can be 
controlled using QScript. Also how to create QScript functions 
and events can be used to control those objects.

The sketch creates 3 new operators and associated events

reset(id, x, y, angle)
move(id, dist)
turn(id, turn_angle)

id = the variable identifier for the helicopter
a, y are the absolute pixel positions of the helicopter
dist is the distance to travel in pixels
turn_angle the angle to turn through
 
In this demonstration the same id is used for both helicopters. 
Normally this might cause a problem but each helicopter has its 
own events. It does mean that a script written for one helicopter
will work with the other one.


created 2014 by Peter Lager
*/

import g4p_controls.*;

import org.qscript.eventsonfire.*;
import org.qscript.events.*;
import org.qscript.editor.*;
import org.qscript.*;
import org.qscript.operator.*;
import org.qscript.errors.*;

import java.awt.Font;
import java.util.LinkedList;

String ground = "ground.png";
String goldBody = "body1.png";
String blueBody = "body2.png";
String rotor = "rotor.png";
Helicopter blueHelo, goldHelo;

PImage backdrop;
int ctime, ltime;

// The initial code for the blue helicopter
String[] blueCode = new String[] {
  "reset(helo, 300,  500,  180)", 
  "n = 1E6", 
  "REPEAT", 
  "  move(helo, 3.5); turn(helo,1)", 
  "  IF(n % 257 == 0); turn(helo,360); ENDIF", 
  "  n = n - 1", 
  "UNTIL(n == 0) ",
};

public void setup() {
  size(600, 600);
  // Must be done before we attempt to use the scripts
  addOperators();
  // Create G4P GUI
  createGUI();
  backdrop = loadImage(ground);
  blueHelo = new Helicopter("helo", blueBody, rotor);
  blueHelo.setCode(blueCode);
  goldHelo = new Helicopter("helo", goldBody, rotor);
  // Initialise the timer
  ctime = ltime = millis();
}

// Add the new operators for controlling the helicopters
public void addOperators() {
  OperatorSet opSet = OperatorSet.get();
  // All operator constructors have 4 parameters
  // 1) the symbol to be used for this operator (must be unique)
  // 2) the number of parameters required by this operator
  // 3) the priority for this operator [30 for a FUNCTION and 40 for a CONSTANT]
  // 4) the operator type - Operator.FUNCTION or Operator.CONSTANT
  opSet.addOperator(new TurnFunction("turn", 2, 30, Operator.FUNCTION));
  opSet.addOperator(new MoveFunction("move", 2, 30, Operator.FUNCTION));
  opSet.addOperator(new ResetFunction("reset", 4, 30, Operator.FUNCTION));
}

public void draw() {
  background(240);
  image(backdrop, 0, 0);
  ctime = millis();
  // Calculate the time since last frame (seconds)
  float elapsedTime = 0.001f * (ctime - ltime);
  ltime = ctime;
  // Update helicopter state
  goldHelo.update(elapsedTime);
  blueHelo.update(elapsedTime);
  // Show activity
  blueActivity.setText(blueHelo.activity);
  goldActivity.setText(goldHelo.activity);
  // draw the helicopters
  goldHelo.draw();
  blueHelo.draw();
}

// show the code for the selected helicopter
public void handleToggleControlEvents(GToggleControl option, GEvent event) { 
  String[] code;
  if (option == heloGold)
    code = goldHelo.getCode();
  else
    code = blueHelo.getCode();
  editor.setText(code);
}

// If the script changes clear any applied styles
public void handleTextEvents(GEditableTextControl textcontrol, GEvent event) {
  if (textcontrol == editor && event == GEvent.CHANGED)
    editor.clearStyles();
}

// Apply the script to a helicopter
public void handleButtonEvents(GButton button, GEvent event) {
  if (event == GEvent.CLICKED) {
    if (button == btnBlue)
      blueHelo.setCode(editor.getTextAsArray());
    else if (button == btnGold)
      goldHelo.setCode(editor.getTextAsArray());
  }
}

// The script panel opens/closes depending on mouse position
public void mouseMoved() {
  if (panel.isCollapsed() && mouseY < panel.getHeight())
    panel.setCollapsed(false);
  else if (!panel.isCollapsed() && mouseY > panel.getHeight())
    panel.setCollapsed(true);
}

// A way out
public void keyTyped() {
  if (key == 'q')
    exit();
}


