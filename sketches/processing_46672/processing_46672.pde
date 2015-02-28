
class button {
  boolean clicked=false, hovered=false;
  int x, y;
  float w, h;
  String t;
   color c1 = color(248, 248, 248);
   color c2 = color(241, 241, 241);
  button(int x, int y, float w, float h, String t) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.t=t;
  }
  void rend() {
    stroke(198, 198, 198);
    noFill();
 
    setGradient(x, y, w, h, c1, c2, Y_AXIS);
    rect(x, y, w, h);
 
    PFont font = loadFont("BradleyHandITC-22.vlw");
    textFont(font);
    textAlign(CENTER);
    fill(50, 55, 55);
    text(t, x, y+2, w, h);
    textAlign(LEFT);
 
    if (mouseConstr(x, y, int(x+w), int(y+h))) {
      mOver();
      if (mousePressed && (mouseButton == LEFT)) {
        clicked();
      }
      else
        released();
    }
    else if (hovered==true)
      mOut();
  }
  void mOver() {
    this.hovered=true;
    c1 = color(248, 248, 248);
    c2 = color(221, 221, 221);
    cursor(HAND);
  }
  void mOut() {
    hovered=false;
    c1 = color(248, 248, 248);
    c2 = color(241, 241, 241);
    cursor(ARROW);
  }
  void clicked() {
    this.clicked=true;
  }
  void released() {
    this.clicked=false;
  }
}
 
 
// == gradient class for buttons was taken from here: http://processing.org/learning/basics/lineargradient.html
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  // calculate differences between color components
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
 
  // choose axis
  if (axis == Y_AXIS) {
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++) {
      // row
      for (int j = y; j<=(y+h); j++) {
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h))
          );
        set(i, j, c);
      }
    }
  } 
  else if (axis == X_AXIS) {
    // column
    for (int i=y; i<=(y+h); i++) {
      // row
      for (int j = x; j<=(x+w); j++) {
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h))
          );
        set(j, i, c);
      }
    }
  }
}
 
 
 
boolean mouseConstr(int x1, int y1, int x2, int y2) {
  if (mouseX>=x1&&mouseX<=x2&&mouseY>=y1&&mouseY<=y2)
    return true;
  else
    return false;
}

