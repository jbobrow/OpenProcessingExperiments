
//class for creating buttons
class Button {

  float w = 30;//width
  float h = 150;//height/length
  float locX = 100;//location in the x direction, default 100;
  float locY = 700;//location in the y direction, default 700
  String textOn;//the text for when the button is on
  String textOff;//the text for when the button is off
  float overways = 70;//shift of text to fit on button

  //constructors
  Button(float wi, float hi, float lX, float lY, String tOn, String tOff) {
    w = wi; 
    h = hi; 
    locX = lX; 
    locY = lY; 
    textOn = tOn; 
    textOff = tOff;
  }

  //you can set a shift over for longer buttons
  Button(float wi, float hi, float lX, float lY, String tOn, String tOff, float o) {
    w = wi; 
    h = hi; 
    locX = lX; 
    locY = lY; 
    textOn = tOn; 
    textOff = tOff; 
    overways = o;
  }

  //called in the draw 
  //called with its corresponding boolean (checker)
  void render(boolean checker) {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(locX, locY, h, w);
    fill(0);
    PFont font = loadFont("AlBayan-16.vlw");
    textFont(font);
    if ( checker ) {
      text(textOn, locX - overways, locY + 7);
    } 
    else {
      text(textOff, locX - overways, locY + 7);
    }
  }

  //checks to see if the mouse is clicking in the area
  //of the button
  boolean clicked() {
    if (mouseX < locX + h && mouseX > locX - h && mouseY < locY + w && mouseY > locY - w) {
      return true;
    } 
    else {
      return false;
    }
  }
}


