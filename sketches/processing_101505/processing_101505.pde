


// command buttons on the screen 

// -----------------------------------------------------------------------------------------
// Init Buttons

void SetupButtons () {

  // for the command-buttons on the right side of the screen
  int CmdButtonsX = width-100; 
  int CmdButtonsAbstand = 40; 
  int j = 0;
  int NummerFeld = 0; 

  // Pre-Init: All Buttons OFF 
  for (int i=0; i<btnLength; i++) {
    rectButtons[i] = new RectButton( 1, 1, 20, 20, col1, col2, false);
  } 

  // Init Buttons 
  j=NummerFeld; 
  rectButtons[j] = new RectButton( CmdButtonsX, CmdButtonsAbstand *(j-NummerFeld)+33, 90, 28, col1, col2, true);  
  rectButtons[j].Text ="2";  
  rectButtons[j].ToolTipText = "Show Image 2"; 
  rectButtons[j].Tag2 = j;

  j=j+1;   
  rectButtons[j] = new RectButton( CmdButtonsX, CmdButtonsAbstand *(j-NummerFeld)+33, 90, 28, col1, col2, true);  
  rectButtons[j].Text ="3";
  rectButtons[j].ToolTipText = "Show Image 3";
  rectButtons[j].Tag2 = j;
  //
} // function 

void checkListOfButtons () {
  // List of Buttons 
  // draw buttons
  for (int i=0; i<btnLength; i++) {
    if (rectButtons[i].Exists) {
      // new color when Mouse over 
      rectButtons[i].update();
      // Buttons paint
      rectButtons[i].display();
    }
  }
  for (int i=0; i<btnLength; i++) {
    // show tool tip
    rectButtons[i].toolTip();
  }
} // function 

// ====================================================================================
// class Button and RectButton

class Button {
  int x, y;
  int sizeX;
  int sizeY;  
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;  
  boolean Exists = false;  
  String Text = "";
  String ToolTipText = ""; 
  String Tag = "";
  int Tag2 = 0;
  int TagMark = 0; 
  color ButtonStrokeColor = color (255, 255, 255);

  void update() {
    if (over()) {
      // Mouse over 
      currentcolor = highlightcolor;
    }
    else {
      // not Mouse over 
      currentcolor = basecolor;
    }
  } // update 

  void toolTip() {
    if (over()) {
      if (!ToolTipText.equals("")) {
        if (millis() - timeSinceLastMouseMoved > 800) {
          fill (242, 245, 75);
          noStroke();
          textSize (12);
          float tw = textWidth(ToolTipText);
          float xLeft = x-(tw/2); 
          float xRight = x-(tw/2) + tw; 
          float xLeftText = x; 
          if (xRight>=width) { 
            xLeft= width-tw-2;
            xLeftText= xLeft + tw/2;
          } 
          if (xLeft< 2) 
          { 
            xLeft=2;
            xLeftText= 2 + tw / 2;
          }
          rect (xLeft, y+32, tw, 20);
          textAlign(CENTER);
          fill(0);
          text(ToolTipText, xLeftText, y+sizeY+19);
        } //  if
      } // if
    } // if
  } // func 

  boolean pressed() {
    if ( over()) {
      locked = true;
      return true;
    }
    else {
      locked = false;
      return false;
    }
  }  // pressed; 

  boolean over() {
    return true;
  } // over 

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    }
    else {
      return false;
    }
  } // overRect
} // class

class RectButton extends Button {
  public RectButton(int ix, int iy, int isizeX, int isizeY, color icolor, color ihighlight, boolean iExist) {
    x = ix;
    y = iy;
    sizeX = isizeX;
    sizeY = isizeY;    
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
    Exists = iExist;
    Text = "";
  }

  boolean over() {
    if ( overRect(x, y, sizeX, sizeY) ) {
      over = true;
      return true;
    }
    else {
      over = false;
      return false;
    }
  }

  void display() {
    if (Exists) {
      if (Tag.equals("Spielfeld")) {
        // Spielfeld 
        // AusgabeEinFeld(Text);
      }
      else {
        // kein Spielfeld, sondern Befehlsbutton
        stroke (ButtonStrokeColor); 
        strokeWeight(0); 
        fill(currentcolor);
        rect(x, y, sizeX, sizeY);        
        if (Text != "") { 
          fill(0, 102, 153);
          textAlign(CENTER);
          textSize(16) ;
          text(Text, (x + (sizeX / 2.0)), (y + (sizeY / 2.0))+5);
        } // if (Text != "")
      } // else
    } // if exists
  } // method display
} // class
// =====================

