
//Carlyn Maw, January 2014
//Week 3 Boundries, Example 6
//Set the size of the ball with the slider.

//WORKS DIFFERENTLY IN JAVA MODE AND JAVASCRIPT MODE.
//the slider handle works perfectly in Java mode but is
//not perfectly aligned in javascript mode.

//For a cooler example and the source for much of this
//code, please see
//http://processing.org/examples/scrollbar.html

HScrollbar hs1, hs2;  // Two scrollbars

void setup() {
  size(480, 320);
  noStroke();
  hs1 = new HScrollbar((width/2)-100, 7*height/8, 200, 16, 3);
}

void draw() {
  background(204);
  fill(255);
  ellipse(width/2, height/2, hs1.getPos(), hs1.getPos());
  hs1.update(); 
  hs1.display();
  stroke(0);
}


class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    //slider frame characteristics
    noStroke();
    fill(51);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    //line echoing physical slider format
    stroke(0);
    line(xpos+5, ypos+(sheight/2), swidth+xpos-5, ypos+(sheight/2));
    //handle characteristics
    stroke(0);
    fill(255);
    rect(spos, ypos-(sheight/4), sheight, sheight+(sheight/2));

  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}


