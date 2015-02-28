


// Tab Buttons

void SetupButtons() {

  int CmdButtonsX = width-90; 
  int CmdButtonsAbstand = 40; 

  // Pre-Init: Alle AUS
  for(int i=0; i<btnLength; i++) {
    rectBt[i] = new RectButton( 1,1, 20,20, col1, col2, false);
  } 

  // Init Knöpfe im 1D-Array 
  rectBt[1] = new RectButton( CmdButtonsX, CmdButtonsAbstand *1+33, 79,28, col1, col2, true);  
  rectBt[1].Text ="New"; 

  /*  rectBt_1D[2] = new RectButton( CmdButtonsX, CmdButtonsAbstand *2+33, 79,28, col1, col2, true);  
   rectBt_1D[2].Text ="Reset";  */

  rectBt[2] = new RectButton( CmdButtonsX, CmdButtonsAbstand *2+33, 79,28, col1, col2, true);  
  rectBt[2].Text ="Quit";
}

// -----------------------------------------------------------------------------------------------

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

  void update() {
    if (over()    ) {
      currentcolor = highlightcolor;
    }
    else {
      currentcolor = basecolor;
    }
  } // update 

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
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    }
    else {
      return false;
    }
  }
}

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
    if( overRect(x, y, sizeX, sizeY) ) {
      over = true;
      return true;
    }
    else {
      over = false;
      return false;
    }
  }

  void display() {
    if (Exists ) {
      stroke(255);
      fill(currentcolor);
      rect(x, y, sizeX, sizeY);
      if (Text != "") { 
        fill(0, 102, 153);
        textAlign(CENTER);
        textSize(16) ;
        text(Text, (x + (sizeX / 2.0)), (y + (sizeY / 2.0))+5);
      }
    }
  }
} 


