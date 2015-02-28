
class Button
{
  int x, y;
  int L, h;
  color basecolor, highlightcolor, selectcolor;
  color currentcolor, fcolor;
  String value;
  boolean over = false;
  boolean pressed = false;
  boolean select = false;

  void update() {
    if(over())
      currentcolor = highlightcolor;
    else if(select)
      currentcolor = selectcolor;
    else
      currentcolor = basecolor;
  }
  boolean pressed() {
    if(over) {
      locked = true;
      return true;
    } else {
      locked = false;
      return false;
    }
  }
  boolean over() {
    return true;
  }
  boolean overText(int x, int y, int width, int height) {
    if((mouseX >= x) && (mouseX <= x + width) &&
       (mouseY >= y - height / 2) && (mouseY <= y + height / 2))
      return true;
    else
      return false;
  }
}

class TextButton extends Button
{
  TextButton(int ix, int iy, int iL, int ih, color ifcolor, color icolor, color ihighlight, color iselect, String itext) {
    x = ix;
    y = iy;
    L = iL;
    h = ih;
    fcolor = ifcolor;
    basecolor = icolor;
    highlightcolor = ihighlight;
    selectcolor = iselect;
    currentcolor = basecolor;
    value = itext;
  }

  boolean over() {
    if(overText(x, y, L, h)) {
      over = true;
      return true;
    } else {
      over = false;
      return false;
    }
  }
  void display() {
    stroke(255);
    strokeWeight(1);

    fill(currentcolor);
    rect(x, y - int (h / 2 + h / 4), L, h);

    noStroke();
    fill(fcolor);
    textFont(f);

    text(value, x + (L - value.length() * 6) / 2, y);
  }
}


