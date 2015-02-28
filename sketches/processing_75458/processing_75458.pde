
class ColorCircle {
  float xpos, ypos;
  int dia;
  color fillColor;
  String pickedNumber;
  boolean picked;
  ColorCircle(float xp, float yp, int d, color c) {
    xpos = xp;
    ypos = yp;
    dia = d;
    fillColor = c;
    picked = false;
  }
  void draw() {
    //   fill(get(xpos, xpos));
    noStroke();
    fill(fillColor);
    text("1", xpos, ypos);
    ellipse(xpos, ypos, dia, dia);
  }
  boolean movePicker() {
    if (dia/2 <= dist(xpos, ypos, mouseX, mouseY) && mousePressed == true) {
      return true;
    }
    else {
      return false;
    }
  }
  void drunkenMove() {
    
    
    xpos = xpos + int(random(-2,2));
    ypos = ypos + int(random(-2,2));
 
  }
}


