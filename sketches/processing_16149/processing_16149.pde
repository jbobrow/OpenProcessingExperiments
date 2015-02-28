
class Button
{
  int x, y;
  int L, h;
  color basecolor, highlightcolor; // , selectcolor;
  color currentcolor, fcolor;
  String value;
  boolean over = false;
  boolean pressed = false;
  boolean select = false;

  void update() {
    if(over())
      currentcolor = highlightcolor;
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

class rectButton extends Button
{
  rectButton(int ix, int iy, int iL, int ih, color icolor) {
    x = ix;
    y = iy;
    L = iL;
    h = ih;
    value = "null";
    currentcolor = icolor;
  }

  void display() {
    noStroke();
    fill(currentcolor);
    rect(x, y - 17, L, h);
    if(!(value.equals("null"))) {
      fill(255);
      textFont(pfont);
      if(value.length() < 45)
        text(" " + value.substring(0, value.length()), x, y);
      else {
        textFont(pfont, 10);
        if(int (value.length() / 58) == 0)
          text(" " + value.substring(0, value.length()), x, y);
        else {
          int count = 0;
          for(int i = 0; i < int (value.length() / 58); i++) {
            text(" " + value.substring(i * 58, (i + 1) * 58 - 1), x, y + i * 15);
            count = i + 1;
          }
          text(" " + value.substring(count * 58, value.length()), x, y + count * 15);
        }
      }
    }
  }
  void setText(String iText) {
    value = iText;
  }
}

class TextButton extends Button
{
  TextButton(int ix, int iy, int iL, int ih, color ifcolor, color icolor, color ihighlight, String itext) {
    x = ix;
    y = iy;
    L = iL;
    h = ih;
    fcolor = ifcolor;
    highlightcolor = ihighlight;
    basecolor = icolor;
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
    if(x < width / 2)
      stroke(153);
    else
      stroke(190);
    strokeWeight(0.8);

    fill(currentcolor);
    rect(x, y - 17, L, h);

    fill(fcolor);
    textFont(pfont);

    text(value, x + 10, y);
    noStroke();
  }
}


