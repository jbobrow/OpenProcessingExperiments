
float r, g, b, minVal, maxVal, k, c;

void setup() {
  size(700,750);
  r = 0;
  g = 0;
  b = 0;
  k = 0; //counter for two printlns//
  c = 0; //indicates color chosen//
  
  stroke(255,255,255);
  fill(255,255,255);
  rect(0,714,700,36);
  
  stroke(255,255,255);
  fill(215,215,215);
  rect(0,700,700,12);
  
  textSize(11);
  fill(0, 0, 0);
  text("UP = increase hue     DOWN = decrease hue     r = display RGB     f = max hue     s = restart program", 10, 711);
  
  stroke(0,0,0);
  strokeWeight(1);
  line(0, 713, 700, 713);
}

void draw() {
  rect(0,0,700,700);
  stroke(0);
  fill(r,g,b);
  }

void keyPressed() {
    if (keyCode == UP) {
      if (r < 255) {
        if (g == 0) {
          if (b == 0) {
        r+= 1;
          }
        }
      }
      if (r == 255) {
        if (g < 255) {
          if (b == 0) {
          g+= 1;
          }
        }
       }
      if (g == 255) {
        if (b == 0) {
         if (r > 0) {
           r-= 1;
        }
        }
      }
      if (r == 0) {
        if (g == 255) {
           if (b < 255) {
           b+= 1;
          }
        }
      }
      if (r == 0) {
        if (g > 0) {
          if (b == 255) {
            g-= 1;
          }
        }
      }
      if (b == 255) {
        if (g == 0) {
          if (r < 255) {
            r+= 1;
          }
        }
      }
      if (b == 255) {
        if (r == 255) {
          if (g < 255) {
            g+= 1;
          }
        }
      }
    }
    else if (keyCode == DOWN) {
      if (r == 255) {
        if (g > 0) {
          if (b == 255) {
        g-= 1;
          }
        }
      }
      if (r > 0) {
        if (g == 0) {
          if (b == 255) {
          r-= 1;
          }
        }
       }
      if (g < 255) {
        if (b == 255) {
         if (r == 0) {
           g+= 1;
        }
        }
      }
      if (r == 0) {
        if (g == 255) {
           if (b > 0) {
           b-= 1;
          }
        }
      }
      if (r < 255) {
        if (g == 255) {
          if (b == 0) {
            r+= 1;
          }
        }
      }
      if (b == 0) {
        if (g > 0) {
          if (r == 255) {
            g-= 1;
          }
        }
      }
      if (b == 0) {
        if (r > 0) {
          if (g == 0) {
            r-= 1;
          }
        }
      }
    }
     else if (key == 'r') {
       if (k < 2)  {
         if (k == 0) {
      println("Fade in:");
      fill(0,0,0);
      textSize(11);
      text("Fade in:     Red    " + r + "    Green    " + g + "    Blue    " + b, 10, 724);
      fill(0,0,0);
  }
          if (k == 1) {
      println("Fade out:");
      fill(0,0,0);
      textSize(11);
      text("Fade out:  Red    " + r + "    Green    " + g + "    Blue    " + b, 10, 736);
      fill(0,0,0);
  }
      println("red=" + r + "  " + "green=" + g + "  " + "blue=" + b);
      k+= 1;
    }
  }
    else if (key == 's')  {
      setup();
  }
}
