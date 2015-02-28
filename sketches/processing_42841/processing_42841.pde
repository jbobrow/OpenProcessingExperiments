
class Button{
  int bheight, bwidth, x, y;
  int value;
  String buttonText;
  
  
  Button(int x, int y, String buttonText){
    this.x = x;
    this.y = y;
    this.buttonText = buttonText;
    bheight = 20;
    bwidth = 70;
  }
  
  void drawButton(){
    if(mouseIsOver()){
      if(mousePressed)
        fill(200,30,10);
      else
        fill(255);
    }else
      fill(100);
    rect(x,y,bwidth,bheight);
    if(buttonText == null){
      fill(0);
      text(value,x+21,y+16);
    }else{
      fill(0);
      text(buttonText,x+35,y+16);
    }
  }
  
  boolean mouseIsOver(){
    if(mouseX >= x && mouseX <= x+bwidth){
      if(mouseY >= y && mouseY <= y + bheight){
        return true;
      }
    }
    return false;
  }
}

