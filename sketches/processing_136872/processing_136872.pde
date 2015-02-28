
class Border

{

  float x, y, w, h;
  boolean activateBlue, activateRed, turnOnRed, turnOnBlue, done;


  Border(float x0, float y0, float w0, float h0)
  {
    x = x0;
    y = y0;
    w = w0;
    h = h0;

    activateRed = false; //to see if mouse is in range and RED.
    activateBlue = false;  //to see if mouse is in range and BLUE.
    turnOnRed = false; //permanently turn on the border to RED
    turnOnBlue = false; // permanently turn on the border to BLUE
    done = false;  //let game know that border is turned off (color has already been activated).
  }

  //draw the border
  void draw()
  {

    strokeWeight(2.0);
    stroke(255);
    fill(255, 100);
    rect(x, y, w, h);

    if (activateBlue)
    {
      strokeWeight(2.0);
      stroke(255);
      fill(51, 153, 255);
      rect(x, y, w, h);
    }

    if (activateRed)
    {
      strokeWeight(2.0);
      stroke(255);
      fill(255, 102, 102);
      rect(x, y, w, h);
    }

    if (turnOnBlue)
    {
      strokeWeight(2.0);
      stroke(255);
      fill(51, 153, 255);
      rect(x, y, w, h);
    }

    if (turnOnRed)
    {
      strokeWeight(2.0);
      stroke(255);
      fill(255, 102, 102);
      rect(x, y, w, h);
    }
  }

  boolean inRange(float mx, float my)
  {
    if (mx >= x && mx <= x+w && my >= y && my <= y+h)
    {
      return true;
    }

    return false;
  }
}


