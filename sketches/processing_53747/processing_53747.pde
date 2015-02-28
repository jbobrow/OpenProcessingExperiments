
class City {
  //instance variables
  float x;
  float y;
  float endX;
  float endY;
  String name;
  String state;
  
  // outbound relations
  Y1950 y1950;
  Y1960 y1960;
  Y1970 y1970;
  Y1980 y1980;
  Y1990 y1990;
  Y2000 y2000;
  Y2010 y2010;
  
  // constructor
  City(String name_, String state_, Y1950 y1950_, Y1960 y1960_, Y1970 y1970_, Y1980 y1980_, Y1990 y1990_, Y2000 y2000_, Y2010 y2010_, float x_, float y_) {
    name = name_;
    state = state_;
    x = x_;
    y = y_;
    Y1950 y1950 = y1950_;
    Y1960 y1960 = y1960_;
    Y1970 y1970 = y1970_;
    Y1980 y1980 = y1980_;
    Y1990 y1990 = y1990_;
    Y2000 y2000 = y2000_;
    Y2010 y2010 = y2010_;
  }
  
  void displayCities() {
    fill(255);
    String labels = name + state;
    textFont(content);
    text(labels, x, y);
    x = endX;
    y = endY;
  }
  
  void positionCities(float x_, float y_) {
    endX = x_;
    endY = y_;
  }
}

  

