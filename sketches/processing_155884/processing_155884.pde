
Button b1,b2;

void setup(){
  size(256,256);
  b1 = new Button(25, 10, "b1");
  b2 = new Button(25, 30);
}

void draw(){
  background(104);
  b1.display();
  b2.display();
}

class Button{
  int x,y;
  int width,height;
  color buttonColor;
  color onColor;
  color clickedColor;
  String label;
  
  final int DEFAULT_WIDTH = 47;
  final int DEFAULT_HEIGHT = 14;
  final String DEFAULT_LABEL = "BUTTON";

  Button(int _x, int _y, int _width, int _height, color _c, String _label){
    this.x = _x;
    this.y = _y;
    this.width = _width;
    this.height = _height;
    this.buttonColor = _c;
    this.label = _label;
  }
  
  Button(int _x, int _y){
    this.x = _x;
    this.y = _y;
    this.buttonColor = color(150,100,255);
    this.onColor = color(red(this.buttonColor)-50,green(this.buttonColor)-50,255);
    this.label = DEFAULT_LABEL;
    this.width = (int)textWidth(DEFAULT_LABEL);
    this.height = DEFAULT_HEIGHT;
  }
  
  Button(int _x, int _y, String _label){
    this.x = _x;
    this.y = _y;
    this.buttonColor = color(150,100,255);
    this.onColor = color(red(this.buttonColor)+50,green(this.buttonColor)+50,255);
    this.label = _label;
    this.width = (int)textWidth(DEFAULT_LABEL);
    this.height = DEFAULT_HEIGHT;
  }
  
  void display(){
    rectMode(CORNER);
    if(mouseOn()){
      if(mousePressed){
        fill(this.clickedColor);
      }else{
        fill(this.onColor);
      }
    }else{
      fill(this.buttonColor); 
    }
    rect(this.x, this.y, this.width, this.height);
    
    fill(255);
    textSize(10);
    textAlign(LEFT);
    text(this.label, this.x+4, this.y+11);
  }
  
  boolean mouseOn(){
    if((this.x <= mouseX && mouseX <= this.x + this.width)
        && (this.y <= mouseY && mouseY <= this.y + this.height)){
      return true;
    } else {
      return false;
    }
  }
}


