
class Button {
  int x, y; // The x- and y-coordinates
  int size; // Dimension (width and height)
  color baseGray; // Default gray value
  color overGray; // Value when mouse is over the button
  color pressGray; // Value when mouse is over and pressed
  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed
  boolean beenPressed = false; // If this is true then it cannot add another character until button has been released
  String character = ""; //variable for the character displayed on the button as well as the character it will output
  String outputVal = "";
  String buttonLable = "";

  Button(String chr,String lbl, int xp, int yp, int s, color b, color o, color p) {
    x = xp;
    y = yp;
    size = s;
    baseGray = b;
    overGray = o;
    pressGray = p;
    character = chr;
    buttonLable = lbl;
  }

  // Updates the over field every frame
  void update() {
    if ((mouseX >= x) && (mouseX <= x + size) &&
      (mouseY >= y) && (mouseY <= y + size)) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  boolean press() {
    if (over == true) {
      pressed = true;
      return true;
    } 
    else {
      return false;
    }
  }

  void release() {
    pressed = false; // Set to false when the mouse is released
    beenPressed = false; // set beenPressed back to false when button released 
    outputVal = null; // set the outputVal to null when the button is released
  }

  void display() {
    if (pressed == true) {
      fill(pressGray);
    } 
    else if (over == true) {
      fill(overGray);
    } 
    else {
      fill(baseGray);
    }
    stroke(120);// stroke color for the button
    rect(x, y, size, size); //make the button shape
    fill(255); //color of the text in the button
    textSize(35); //text size = the size of the square button
    textAlign(CENTER); // means that x anchor point of the character is based on the center of the character alogn the x axis
    text(buttonLable,x+size/2,y+size/1.3); // the alignment of this text is arbitrary based on the font's design
  }

  // return function for the button. 
  String output(){
    if (pressed == true) {
      if (beenPressed == false){//these ifs make sure that only one character is drawn while button is held down.
        outputVal = character; 
        beenPressed = true;       
      }
      else outputVal = null; 
    }
    return outputVal;
  }
}






