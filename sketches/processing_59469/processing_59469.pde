
class Button {
 int btnX;
 int btnY;
 int btnW;
 int btnH;

boolean pressed;

Button (int btnX, int btnY, int btnW, int btnH) {
    this.btnX = btnX;
    this.btnY = btnY;
    this.btnW = btnW;
    this.btnH = btnH;  
}
   void display() {
    noStroke();
    noFill();
    rect(btnX, btnY, btnW, btnH);
  } 
  
    void click() {
      if (mouseX > butt.btnX && mouseX < butt.btnX + butt.btnW && 
        mouseY > butt.btnY && mouseY < butt.btnY + butt.btnH) {
          gameStage = 4;
      }
      else { 
        pressed = false;
        
      }
    }
  
}

