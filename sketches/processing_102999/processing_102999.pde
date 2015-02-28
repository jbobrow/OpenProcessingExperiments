
float r, g, b, deltaR, deltaG, deltaB, minVal, maxVal, k, c;
int switchIndex;

void setup() {
  size(700,750);
  r = 0;
  g = 0;
  b = 0;
  deltaR = 0; //designates rate of change for r//
  deltaG = 0; //designates rate of change for g//
  deltaB = 0; //designates rate of change for b//
  k = 0; //counter for two printlns//
  c = 0; //indicates color chosen//
  
  switchIndex = int(random(1, 9.999));
  switch(switchIndex) {
    case 1: //Red//
      deltaR = 1;
      c = 1;
      break;
    case 2: //Green//
      deltaG = 1;
      c = 2;
      break;
    case 3: //Blue//
      deltaB = 1;
      c = 3;
      break;
    case 4: //Yellow//
      deltaR = 1;
      deltaG = 1;
      c = 4;
      break;
    case 5: //White//
      deltaR = 1;
      deltaG = 1;
      deltaB = 1;
      c = 5;
      break;
    case 6: //Cyan//
      deltaG = 1;
      deltaB = 1;
      c = 6;
      break;
    case 7: //Purple//
      deltaR = 1;
      deltaB = 1;
      c = 7;
      break;
    case 8: //Orange//
      deltaR = 1;
      deltaG = 0.45098;
      c = 8;
      break;
    case 9: //pink//
      deltaR = 1;
      deltaG = 0;
      deltaB = 0.45098;
      c = 9;
      break;
  }
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

void keyPressed() {
    if (keyCode == UP) {
      r+= deltaR;
      g+= deltaG;
      b+= deltaB;
      if (r > 255)  {
        r = 255;
      }
      if (g > 255)  {
        g = 255;
      }
      if (b > 255)  {
        b = 255;
   }  
      if (c == 8)  {
        if (g > 115) {
        g = 115;
        }
      } 
    }
    else if (keyCode == DOWN) {
      if (k > 0) {
        r-= deltaR;
        g-= deltaG;
        b-= deltaB;
          if (r < 0) {
            r = 0;
          }
          if (g < 0) {
            g = 0;
          }
          if (b < 0) {
            b = 0;
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
    else if (key == 'f')  {
      if (c == 1) {  //red//
        r = 255;
      }
      if (c == 2) {  //green//
        g = 255;
      }
      if (c == 3) {  //blue//
        b = 255;
      }
      if (c == 4) {  //yellow//
        r = 255;
        g = 255;
      }
      if (c == 5) {  //white//
        r = 255;
        g = 255;
        b = 255;
      }
      if (c == 6) {  //cyan//
        g = 255;
        b = 255;
        r = 0;
      }
      if (c == 7) {  //purple//
        r = 255;
        b = 255;
        g = 0;
      }
      if (c == 8) {  //orange//
        r = 255;
        g = 115;
        b = 0;
      }
      if (c == 9)  {  //pink//
        r = 255;
        g = 0;
        b = 115;
      }
}
}

void draw() {
  rect(0,0,700,700);
  stroke(0);
  fill(r,g,b);
  }
