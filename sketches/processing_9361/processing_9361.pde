
class Button { 
  int rectX;
  int rectY;
  int rectWidth;
  int rectHeight;
  String label;
  int fontSize;
  boolean rectOver = false;


  Button(int _rectX, int _rectY, int _rectWidth, int _rectHeight, String label, int fontSize) {
    rectX = _rectX;
    rectY = _rectY;
    rectWidth = _rectWidth;
    rectHeight = _rectHeight;
    this.label = label;
    this.fontSize = fontSize;
  }  

  void display() {
    stroke(0);
    fill(255,0,0);
    rect(rectX, rectY, rectWidth, rectHeight);  
    fill(0);
    textSize(fontSize);
    float labelW = textWidth(label);
    float textX = (rectWidth - labelW) / 2;    
    float textY = fontSize + (rectHeight - (fontSize+fontSize*1/7)) / 2.0;
    text(label, rectX + textX, rectY + textY);
  }

  void update (int xx, int yy) {
    if ( overRect(rectX, rectY, rectWidth, rectHeight) ) {
      rectOver = true;
    } 
    else {
      rectOver = false;
    }
  } // end update

    boolean overRect (int _rectX, int _rectY, int rectWidth, int rectheight) {
    if (mouseX >= _rectX && mouseX <= _rectX+rectWidth && mouseY >= _rectY && mouseY <= _rectY+rectHeight) {
      return true;
    } 
    return false;
  } // end overRect
}


