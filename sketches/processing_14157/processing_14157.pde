
class Blank {
  //-----------------------------------------------------------------------------
  //properties
  //-----------------------------------------------------------------------------
  private String word = "HOLDER";
  color textColor;
  PFont typeface;
  float x,y,w;

  //-----------------------------------------------------------------------------
  //constructor
  //-----------------------------------------------------------------------------
  Blank() {
  } 

  Blank(PFont _typeface, color _textColor) {
    typeface = _typeface;
    textColor = _textColor;
  } 

  //-----------------------------------------------------------------------------
  //methods
  //-----------------------------------------------------------------------------
  void display() {
    textFont(typeface);
    
    fill(textColor);
    noStroke();
    text(word, x,y);
  
    noFill();
    stroke(textColor);
    strokeWeight(3.0);
    strokeCap(ROUND);
    line(x,y+3, x+(w-10),y+3);
  }

  //-----------------------------------------------------------------------------
  //sets
  //-----------------------------------------------------------------------------
  void setWord(String _word) {
    word = _word;
    w = textWidth(word)+10;
  }
  
  void setCoords(float _x, float _y) {
    x = _x;
    y = _y;
  }

  //-----------------------------------------------------------------------------
  //gets
  //-----------------------------------------------------------------------------
  PVector getCoords() {
    return new PVector(x,y,w);
  }
  
  float getWidth() {
    return w;
  }
  
}


