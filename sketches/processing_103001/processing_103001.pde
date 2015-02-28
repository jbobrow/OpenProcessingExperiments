
float r, g, b, minVal, maxVal, k, c, l, redc, orangec, yellowc, greenc, bluec, purplec, d;
int switchIndex;

void setup() {
  size(700,750);
  r = 0;
  g = 0;
  b = 0;
  k = 0; //counter for printlns//
  c = 0; //indicates place in spectrum//
  l = 0; //indicates rate of change//
  redc = 0;
  orangec = 0;
  yellowc = 0;
  greenc = 0;
  bluec = 0;
  purplec = 0;
  d = 0;
  
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

l += 1;
if (l == 7) {
  l = 0;
  c += 1;
}

   if (l == 6) {
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
}


void keyPressed() {
  if (k == 0) {
      println("RED ONSET VALUE:       " + "red=" + r + "  " + "green=" + g + "  " + "blue=" + b + "      spectrum/2076: " + c);
      redc = c;
  }
  if (k == 1) {
    orangec = c;
    d = c - redc;
    println("    RED WIDTH:" + d);
     println("ORANGE ONSET VALUE:    " + "red=" + r + "  " + "green=" + g + "  " + "blue=" + b + "      spectrum/2076: " + c);
  }
  if (k == 2) {
    yellowc = c;
    d = c - orangec;
    println("    ORANGE WIDTH:" + d);
     println("YELLOW ONSET VALUE:    " + "red=" + r + "  " + "green=" + g + "  " + "blue=" + b + "      spectrum/2076: " + c);
  }
  if (k == 3) {
    greenc = c;
    d = c - yellowc;
    println("    YELLOW WIDTH:" + d);
     println("GREEN ONSET VALUE:    " + "red=" + r + "  " + "green=" + g + "  " + "blue=" + b + "      spectrum/2076: " + c);
  }
  if (k == 4) {
    bluec = c;
    d = c - greenc;
    println("    GREEN WIDTH:" + d);
     println("BLUE ONSET VALUE:    " + "red=" + r + "  " + "green=" + g + "  " + "blue=" + b + "      spectrum/2076: " + c);
  }
  if (k == 5) {
    purplec = c;
    d = c - bluec;
    println("    BLUE WIDTH:" + d);
     println("PURPLE ONSET VALUE:    " + "red=" + r + "  " + "green=" + g + "  " + "blue=" + b + "      spectrum/2076: " + c);
  }
      k+= 1;
     if (key == 's')  {
      setup();
  }
}
