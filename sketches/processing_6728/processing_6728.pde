
class Button {
  PImage BaseImage;
  PImage PressImage;
  int x, y; // The x- and y-coordinates
  int size; // Dimension (width and height)
  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed
  boolean beenPressed = false; // If this is true then it cannot add another character until button has been released
  String character = ""; //variable for the character displayed on the button as well as the character it will output
  String outputVal = "";
  String buttonLable = "";

  Button(String chr,String lbl, int xp, int yp, int s, PImage bi, PImage pi) {
  //Button(String chr,String lbl, int xp, int yp, int s, color b, color o, color p) {
    x = xp;
    y = yp;
    size = s;
    character = chr;
    buttonLable = lbl;
    BaseImage = bi;
    PressImage = pi;
    
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
    image(PressImage, x, y);
    } 
/*    else if (over == true) {
    //image(PressImage, x, y);
    }*/ 
    else{
    image(BaseImage,x,y);
    }
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






