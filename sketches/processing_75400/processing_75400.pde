
class Button {

  // general variables used accross class
  final int x = 0; final int y = 1;                                      // variables to use with matrix size array
  final int mouseControl = 0; final int serialControl = 1;
  boolean mouseOver = false;                                             // holds whether mouse is actually hovering over the button
  boolean buttonActive = false;                                          // holds whether button is currently active
  boolean previousState = false;                                         // holds the previous state of the button, used to determine when to send OSC messages
  int serialButtonState = 0;                                             // reading from switch connected via serial port
  boolean activeButtonEstablished = false;
  boolean inactiveButtonEstablished = false;
  boolean buttonPress = false;                                          // holds whether the button has been pressed
  
  // matrix and cell related variables
  float [] buttonSize = new float [2];                                   // width and height of each button       
  float [] buttonLoc = new float [2];                                    // location of the button
  float [] relativeMouseLoc = new float [2];                             // holds relative location of mouse on object (0,0 being top left hand corner)
  color activeColor = color (255,0,0);                                   // holds color of active cells
  color inactiveColor = color (255);                                     // holds color of inactive cells

  // variables for reading serial input
  int mainControl = mouseControl;                                        // sets the main control for the button (whether serial or mouse - used to determine signal sent to OSC)

 // define the button class constructor
 Button(int tXloc, int tYloc, int twidth, int theight) {
  buttonLoc[x] = tXloc;
  buttonLoc[y] = tYloc;
  buttonSize[x] = twidth;
  buttonSize[y] = theight;
 } 
  
 
 // function that draws the button on screen 
 void drawButton(){
   setButtonState ();   
   if (buttonActive) {
     fill(activeColor);
   } else {
     fill(inactiveColor);
   }
   rect(buttonLoc[x], buttonLoc[y], buttonSize[x], buttonSize[y]);  
 }
  
  
 // provides the Y location of the mouse in relation to the matrix and determines whether mouse is over the matrix
 void isMouseHovering() {
   relativeMouseLoc[y] = mouseY - buttonLoc[y];                                        // adjust variable to account for location of Matrix within window
   relativeMouseLoc[x] = mouseX - buttonLoc[x];                                        // adjust variable to account for location of Matrix within window

   // check to see if the mouse intersects the button from a vertical (Y) perspective
   if (relativeMouseLoc[y] >= 0 && relativeMouseLoc[y] < buttonSize[y]) { 
     mouseOver = true; } 
     else {
     mouseOver = false;
     }

   // check to see if the mouse also intersects the button from a horizontal (X) perspective, only sets state to true if mouse intersects object from y and x perspective  
   if (relativeMouseLoc[x] >= 0 && relativeMouseLoc[x] < buttonSize[x] && mouseOver) { 
     mouseOver = true;
   } else {
     mouseOver = false; 
   }
 }


 // callback/interupt function that captures when the mouse button has been pressed
 void activateButton() {
   if (mouseOver)  buttonPress = true;
 }

// function that calls the serial and mouse button state methods
void setButtonState () {
  setButtonStateMouse();
  setButtonStateSerial();
}

// reads in input that was taken from the serial monitor
void getSerialInput (int tSerialButtonState) {
 serialButtonState = tSerialButtonState; 
}

// sets the button state to be sent to OSC based on the state of the button connected serially
void setButtonStateSerial() {
  if (mainControl == serialControl) {
      if (serialButtonState == 1) {
        buttonActive = true;
      } else {
        buttonActive = false;
      }
  }
}

// function that checks if the mouse clicked the button
void setButtonStateMouse() {
  isMouseHovering(); 
  if (buttonPress && mouseOver && !buttonActive) {
     buttonActive = true; 
     buttonPress = false;
   }
  else if (buttonPress && mouseOver && buttonActive) {
     buttonActive = false;
     buttonPress = false; 
  }
}


// function that sends OSC messages to OSCulator to be translated into midi
void sendOscMessage(String tmsgName, OscP5 tOscComm, NetAddress tMyRemoteLoc) {
  float msgHigh = 0.25;
  float msgLow = 0.75;
  float counterMsg = 1;
  String msgName = tmsgName;
  String msgNameOn = msgName + "/butOn";
  String msgNameOff = msgName + "/butOff";

  // checks to make sure that state of the button has changed before sending out a message
  if (previousState != buttonActive) {
    // resets the previous state varialble
    previousState = buttonActive;

    // checks if button state is play or pause and sets the messages appropriately
    // msgHigh communicates to the "play clip" button on Ableton
    // msgLow communicates to the "stop clip" button on Ableton
    if (buttonActive) { 
      msgHigh = 1;
      msgLow = 0;
    } else {
      msgHigh = 0;
      msgLow = 1;
    }

    // open new OSC messages to transmit both types of buttonStates buttonState
    OscMessage myOscMessageOn = new OscMessage(msgNameOn);
    myOscMessageOn.add("butOn"); /* add an int to the osc message */
    OscMessage myOscMessageOff = new OscMessage(msgNameOff); 
    myOscMessageOff.add("butOff"); /* add an int to the osc message */
    myOscMessageOn.add(msgHigh); // add an int to the osc message 
    myOscMessageOff.add(msgLow); // add an int to the osc message 
    tOscComm.send(myOscMessageOff, tMyRemoteLoc); 
    tOscComm.send(myOscMessageOn, tMyRemoteLoc); 
    activeButtonEstablished = true;

    print("buttonVal: " + msgHigh);
    println("   buttonNeg:" + msgLow);
  }
}
}

