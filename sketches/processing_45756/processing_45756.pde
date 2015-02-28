
class Button{
  boolean over = false;
  boolean pressed = false;
  int x,y;
  int rectSize;
  color baseOr, overOr, pressOr;
  
  Button(int xp, int yp, int s, color b, color o, color p){
    x = xp;
    y = yp;
    rectSize = s;
    baseOr = b;
    overOr = o;
    pressOr = p;
  }
  
  void update(){
    if ((mouseX >= x) && (mouseX <= x+rectSize) &&
        (mouseY >= y) && (mouseY <= y+(rectSize/4))){
          over = true;
        } else {
          over = false;
        }
  }
  
  boolean press(){
    if(over == true){
      pressed = true;
      return true;
    } else {
      return false;
    }
  }
  
  void release(){
    pressed = false;
  }
  
  void display(){
    if (pressed == true){
      fill(pressOr);
    } else if(over==true){
      fill(overOr);
    } else {
      fill(baseOr);
    }
    strokeWeight(.5);
    stroke(50);
    rect(x,y,rectSize,rectSize/4);
  }
}

