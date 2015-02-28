


// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="seedTop.jpg,seedBottom.jpg"; */ 


HScrollbar hs1, hs2;  // Two scrollbars
PImage img1, bg;  // Two image to load
PFont font;
String letter = "drag here";

void setup() {
  size(750, 398);
  noStroke();
  font = createFont("Arial", 10);
  textFont (font);
  textAlign(CENTER, CENTER);
  fill(255);
  
  hs1 = new HScrollbar(0, height/2-8, width, 16, 16);

  
  // Load images
  img1 = loadImage("recordalone.gif");
  bg = loadImage("hotelcali.jpg");
}

void draw() {
  background(255); 

  // Get the position of the img1 scrollbar
  // and convert to a value to display the img1 image 
  float img1Pos = hs1.getPos()-width/2;
  fill(50);
  image(img1, width/2-img1.width/2 + img1Pos*1.5, 0);
  image (bg, 0, 0);
  // Get the position of the img2 scrollbar
  // and convert to a value to display the img2 image

  fill(255);

 
  hs1.update();

  hs1.display();

  
 
 
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
    ypos = yp-sheight;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
  
    if(over || locked) {
      fill(0); /*rollover colour*/
    } else {
      fill(255); /*square colour*/
    }
    ellipse(spos, ypos, sheight, sheight);

  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}

/*Source: http://processing.org/learning/topics/scrollbar.html */

