
class Button
{
  int x, y;
  int size;
  color basecolor, highlightcolor, selectcolor;
  color currentcolor;
  float value;
  boolean over = false;
  boolean pressed = false;   
  boolean select = false;

  void update() 
  {
    if(over()) {
      currentcolor = highlightcolor;
    } else if(select) {
      currentcolor = selectcolor;
    }
    else {
      currentcolor = basecolor;
    }
  }

  boolean pressed() 
  {
    if(over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }    
  }

  boolean over() 
  { 
    return true; 
  }

  boolean overText(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+30 && 
      mouseY >= y-15 && mouseY <= y+15) {
      return true;
    } 
    else {
      return false;
    }
  }


}

class TextButton extends Button
{
  TextButton(int ix, int iy, int isize, color icolor, color ihighlight, color iselect, float itext) 
  {
    x = ix;
    y = iy;
    size = isize;
    selectcolor = iselect;
    basecolor = icolor;
    highlightcolor = ihighlight;
    selectcolor = iselect;
    currentcolor = basecolor;
    value = itext;
  }

  boolean over() 
  {
    if( overText(x, y, size, size) ) {
      over = true;
      return true;
    } 
    else {
      over = false;
      return false;
    }
  }

  void display() 
  {
    stroke(255);
    strokeWeight(2);
    fill(currentcolor);

    textFont(myFont);
    if(size==100) text(" "+ (int)value, x, y);
    else text(" "+ value, x, y);
    noStroke();
  }
}


