
class TimerText {
  //-----------------------------------------------------------------------------
  //properties
  //-----------------------------------------------------------------------------
  float x,y;
  PFont typeface;
  int sz;

  float start, end;
  String content;
  color textColor;

  //-----------------------------------------------------------------------------
  //constructor
  //-----------------------------------------------------------------------------
  TimerText(String typeName, int sz) {
    setTypeface(typeName, sz);
  } 

  TimerText(PFont typeface, int sz) {
    setTypeface(typeface, sz);
  } 

  //-----------------------------------------------------------------------------
  //methods
  //-----------------------------------------------------------------------------
  void start(int i_end) {
    start = millis();

    end = i_end*1000;
    end = start + end;
  }

  void display(float x, float y, String content, color textColor) {
    this.x = x;
    this.y = y;
    this.content = content;
    this.textColor = textColor;

    if(millis() < end) {
      fill(textColor);
    } else {
      //fade
    }

    textFont(typeface, sz);
    if(millis() < end) {
      text(content, x,y);
    }

  }

  //-----------------------------------------------------------------------------
  //sets
  //-----------------------------------------------------------------------------
  void setTypeface(String typeName, int sz) {
    typeface = createFont(typeName,sz);
    this.sz = sz;
  }

  void setTypeface(PFont typeface, int sz) {
    this.typeface = typeface;
    this.sz = sz;
  }

}

