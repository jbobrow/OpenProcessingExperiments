
class Button{
  String buttonText;
  int posX1, posX2, posY1, posY2, buttonWidth, buttonHeight;
  color bGround_idle = color(245);
  color fGround_idle = color(150);
  color bGround_hover = color(230); 
  color fGround_hover = color(100);
  color bGround_selected = color(150);
  color fGround_selected = color(245);
  boolean isSelected = false;
  
  public Button(int _posX1, int _posY1, int _buttonWidth, int _buttonHeight, String _buttonText){
    buttonText = _buttonText;
    buttonWidth = _buttonWidth;
    buttonHeight = _buttonHeight;
    posX1 = _posX1;
    posY1 = _posY1;
    posX2 = posX1 + buttonWidth;
    posY2 = posY1 + buttonHeight;
    
    display();
  }
  
  public Button(String _buttonText){
    buttonText = _buttonText;
  }
  
  void setPosition(int _posX1, int _posY1){
    posX1 = _posX1;
    posY1 = _posY1;
  }
  
  void setDimensions(int _buttonWidth, int _buttonHeight){
    buttonWidth = _buttonWidth;
    buttonHeight = _buttonHeight;
  }
  
  void display(){
    posX2 = posX1 + buttonWidth;
    posY2 = posY1 + buttonHeight;
    
    color bGround, fGround;
    
    if(isSelected){
      bGround = bGround_selected;
      fGround = fGround_selected;
    }
    else if(mouseX > posX1 && mouseX < posX2 && mouseY > posY1 && mouseY < posY2){ //hover
      bGround = bGround_hover;
      fGround = fGround_hover;
      if(mousePressed){
        deselectButtons();
        setIsSelected(true);
        doelgroep = buttonText;
      }
    }
    else{
      bGround = bGround_idle;
      fGround = fGround_idle;
    }
    
    fill(bGround);
    noStroke();
    rect(posX1, posY1, buttonWidth, buttonHeight);
    fill(fGround);
    textAlign(CENTER, CENTER);
    text(buttonText, posX1, posY1, buttonWidth, buttonHeight);
  }
  
  void setIsSelected(boolean _isSelected){
    isSelected = _isSelected;
  }
}


