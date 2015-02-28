

//---------------------------------------------------------------
// file:     Button.pde
//           button class for handle button input 
// class:    Button
//             Button       constructor
//             colorize     set button colors
//             update       update button state and draw button
//             mouseIsOver  check if mouse is over button
//             show         show button
//             hide         hide button
// modified: V1.0  2011-08-08
//           V1.1  2012-05-04  textColor added & corrections
//           V1.2  2012-06-07  added: enable / disable
//---------------------------------------------------------------
class Button 
{
  int locX, locY;      // left top position
  int dimX, dimY;      // dimension
  int midX, midY;      // center position
  color defaultColor   = color(244, 244, 244);  // light gray
  color frameColor     = color(177, 177, 177);  // gray  
  color selectColor    = color(255, 144,   0);  // orange  
  color highlightColor = color(200,  50,  60);  // wine red 
  color textColor      = color(0,0,0);          // black 
  boolean visible      = true;    // draw button ?
  boolean enabled      = true;    // button input enabled ?
  boolean active       = false;   // is mouse over button ?
  String buttonText    = "";      // button text
  
  //-------------------------------------------------------------
  // create a button
  //   int left, top;        left top button rectangle position
  //   int width, height;    button size
  //   String buttonText;    button text
  //-------------------------------------------------------------
  Button(int left, int top, int width, int height, String button_Text) 
  {
    locX = left;
    locY = top;
    dimX = width;
    dimY = height;
    midX = locX + width / 2;
    midY = locY + height/ 2;
    buttonText = button_Text;
  }
  
  //-------------------
  // set button colors
  //-------------------
  void colorize(color bar, color select, color high, color textColor)
  { 
    defaultColor   = bar;
    selectColor    = select;  
    highlightColor = high;
    textColor      = textColor;
  }

  //-------------------------------------
  // update button state and draw button
  // Important:  call   noLights();
  //             before you call xxxButton.update();
  //             if you use customized lightning!
  //-------------------------------------
  void update() 
  {
    active = (mouseX > locX) && (mouseX < (locX + dimX)) 
          && (mouseY > locY) && (mouseY < (locY + dimY));
    if (visible)
    {
      if (enabled && active && mousePressed)  
            fill(selectColor);
      else  fill(defaultColor);
      if (enabled && active)  
           stroke(highlightColor);
      else     stroke(frameColor);
      rectMode(CORNER);
      rect(locX, locY, dimX, dimY);
      textAlign(CENTER, CENTER);
      fill(textColor);
//      text(buttonText, locX, locY-dimY/10, dimX, dimY);
      text(buttonText, midX, midY-dimY/20);
      textAlign(LEFT);
    }
  }

  //-------------------------------------
  // return true if mouse is over button 
  //-------------------------------------
  boolean mouseIsOver() 
  { return enabled && active;  }
 
  //--------------------
  // draw button
  //--------------------
  void show() 
  { visible = true; }

  //--------------------
  // do not draw button
  //--------------------
  void hide()
  { visible = false; }

  //----------------------
  // turn on button input
  //----------------------
  void enable()
  { enabled = true; }

  //----------------------
  // turn on button input
  //----------------------
  void disable()
  { enabled = false; }
}


