
boolean flip;
int thresh = 1;
//int prevSec = 0;
int prevMin = 0;

PFont fontA;
int count = 0;
String phr1 = "E_PERIMENTAL _RT O_ANGE COUN_Y";
String phr2 = "EXPERIMENTAL ART ORNAGE COUNTY";
char ch1= phr1.charAt(0);
char ch2= phr2.charAt(0);
char c = 'A';
int xpos = 0;
int ypos = 50;
color r= color(204, 0, 0);
color b = color(16);
color bg = color(255);








void setup() {
  size(500, 500);
  background(255);
  fontA = loadFont ("DINNextLTPro-Condensed-24.vlw");
  fill(0);
  smooth();
  textFont(fontA, 24);
  rectMode(CORNERS);
  frameRate(5);
}

void draw() {
  //TIME COUNTER//
  
  /*if (second() - prevSec >= thresh) {
   if (flip) {
   flip = false;
   } 
   else {
   flip = true;
   }
   prevSec = second();
   }*/

  if (minute() - prevMin >= thresh) {
    if (flip) {
      flip = false;
    } 
    else {
      flip = true;
    }
    prevMin = minute();
  }

  if (flip) {
    background(255);
    reveal();
    filter(OPAQUE);
  }
  else {
    background(255);
    conceal();
    filter(OPAQUE);
  }

  
  
  ////////////////////////////////////////////////////
  //STRING EVENT//
  
  
  
  if (count >= 30) {
    count = 0;
  }
  print ("("+c+","+int(c)+")"+"-");
  xpos += 40;
  c++;
  if (c > 90) {
    c = 'A';
  }

  if (xpos >= 460) {
    fill(255, 18);
    rect(-10, -10, width, height);
    xpos = 10;
    ypos += 40;
  }
  if (ypos >= 500) {

    ypos = 50;
  }

  filter (BLUR);
}


//////////////////////////////////////////////////////////////////////////////////////

void conceal() {
  fill (b);
  String phr1= "E_PERIMENTAL _RT O_ANGE COUN_Y";
  ch1 = phr1.charAt(count);
  count++;

  float temp = random(100);
  text (ch1, xpos, ypos);
}




/////////////////////////////////////////////////////////////////////////////////////


void reveal() {
  fill (r);
  String phr2 = "EXPERIMENTAL ART ORANGE COUNTY";
  ch2 = phr2.charAt(count);
  count++;

  float temp = random(100);
  text (ch2, xpos, ypos);
}



