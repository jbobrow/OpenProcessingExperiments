
/*
* PARTICELLE STATICHE POSIZIONATE NELLA PARTE SUPERIORE DELLA FINESTRA. 
 * PERMETTONO DI ATTIVARE I FILTRI.
 */


class ControlFilter {
  int x, y;
  float radius;
  color orColor;
  color c;
  boolean isClicked = false;

  ControlFilter(int xpos, int ypos, float r, color colore) {
    this.x = xpos;
    this.y = ypos;
    radius = r;
    c = colore;
    orColor = c;
  } 

  // ================================================================================================================

  void display() {
    smooth();
    fill(c);
    ellipse(x, y, radius*2, radius*2);
  }

  // ================================================================================================================

  /*
* SERVE A CAPIRE SE IL CLICK DEL MOUSE DA PARTE DELL'UTENTE AVVIENE ALL'INTERNO DEL CONTROL FILTER I-ESIMO
   */

  boolean isInside() {
    if ((mouseX >= x -radius) && (mouseX <= x+radius) && (mouseY >= y-radius) && (mouseY <= y+radius)) {
      if (isClicked) {
        isClicked = false;
      } 
      else {
        isClicked = true;
      } 
      return true;
    } 
    else {
      return false;
    }
  }

  // ================================================================================================================

  boolean isClicked() {
    return isClicked;
  }

  // ================================================================================================================

  void enable() {
    colorMode(HSB);
    c = orColor;
    display();
  }

  // ================================================================================================================

  void disable() {
    colorMode(HSB);
    c = color(20, 90, 40);
    display();
  }

  // ================================================================================================================

  boolean isDisabled() {
    return c != orColor;
  }

  // ================================================================================================================
}


