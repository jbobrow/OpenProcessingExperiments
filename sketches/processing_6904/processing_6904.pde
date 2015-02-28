
class Slider {
  float value = 0;
  float max = 1;
  float min = 0;
  boolean clicked = false;
  
  float yMin,yMax,xMin,xMax;
  
  Slider(float max, float min) {
    this.max = max;
    this.min = min;
    value = min;
  }
  
  void draw(float x, float y, float wd, float ht) {
    setMaxMin(x,y,wd,ht);
    //draw bar
    fill(175,175,222,50);
    noStroke();
    rect(x,y,wd,-ht);
    //draw slide
    fill(222,100,100);
    noStroke();
    float slideX = x;
    float slideY = map(value,min,max,yMax,yMin);
    rect(slideX,slideY,wd,-4); 
  }
  
  private float clamp(float val, float low, float up) {
    if (val > up) {
      return up;
    } else if (val < low) {
      return low;
    } else {
      return val;
    }
    
  }
  
  private void setMaxMin(float x, float y, float wd, float ht) {
    xMax = x + wd;
    xMin = x;
    yMax = y;
    yMin = y-ht;
  }
  
  private void slide() {
    if (clicked) value = clamp(map(mouseY,yMin,yMax,max,min),min,max);
  }
  
  void checkClick() {
    clicked = (((mouseX >= xMin) && (mouseX <= xMax)) && ((mouseY <= yMax) && (mouseY >= yMin)));
    slide();
    println(value);
  }
}

