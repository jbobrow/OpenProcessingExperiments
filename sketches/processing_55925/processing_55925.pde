
class Country {
 
  String name;
  String code;
  String countLongTerm;
  boolean isHovered;
  PShape countrySvg; 
  float opacity;
  float endOpacity;
  float damping = 0.05;
  int count;
  int number;
  Label label;

  Country(String name_, String code_, PShape countrySvg_, String countLongTerm_) {
    
    name = name_;
    code = code_;
    countrySvg = countrySvg_;
    countLongTerm = countLongTerm_;
    
    // initialize label
    label = new Label(name);
  }
  
  
  void setCount() {
    count++;
    minMaxCount(count);
  }
  
  
  
  void display() {
    
    // map count to opacity
    float endOpacity = map(count, minCount, maxCount, 110, 4000);
    if ((endOpacity < 0) || (Float.isNaN(endOpacity))) {
      endOpacity = 0; 
    }
    
    // tween opacity for smooth transitions
    opacity = (endOpacity - opacity) * damping + opacity;
    
    fill(opacity);
    noStroke();
    
    try {
      shape(countrySvg, mapOffsetX, mapOffsetY);
    } catch(Exception e) {
      //println("Error with country code: " + code);
    }
  }
  
  void onMouseOver(float mx, float my) {
    
    isHovered = true;
    label.display(mx, my);
  } 
}

