
class CheckBox {
  PFont schrift;
  String name;
  int x, y;                 // The x- and y-coordinates of the rect
  int size, crossSize;      // Dimension of square, cross
  color baseGray, dotGray;  // Circle gray value, inner gray value
  boolean checked = false;  // True when the button is selected
  int me;                   // ID number for this CheckBox object


  CheckBox(int xp, int yp, int s, color b, color d, int m, String label) {
    schrift = loadFont("SansSerif-14.vlw");
    textFont(schrift);
    name = label;
    x = xp;
    y = yp;
    size = s;
    crossSize = size - size / 3;
    baseGray = b;
    dotGray = d;
    this.checked = false;
    me = m;
  }

  // Updates the boolean value press, returns true or false
  boolean press(float mx, float my) {
    if ((dist(x, y, mx, my) < size / 2)) {
      if(checked==false){
        checked = true;
      } 
      else {
        checked = false;
      }
    }
    return checked;
  }

  // Draws the element to the display window
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(baseGray);
    stroke(dotGray);
    if (checked == true) {
      rect(x, y, size, size);
      line(x-crossSize/2, y-crossSize/2, x+crossSize/2, y+crossSize/2);
      line(x+crossSize/2, y-crossSize/2, x-crossSize/2, y+crossSize/2);
    }else{
      rect(x, y, size, size);
    }
    text(name,x+size,y+size/2);
    strokeWeight(1);
    rectMode(CORNER);
  }
}



