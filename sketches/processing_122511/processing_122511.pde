
/*
This code is a representation of a sky where a spaceship
 needs to discover the scorpio constellation.
 When stars are discovered a line connects it to the next ones
 revealing the constellation.
 
 Made by Valquiria de Castro on October/2013
 */

//load images: background and spaceship (with and without fire)
PImage img, ship, ship2;

//declaring the lines (begining and end of each one)
float st1X, st1Y, st1X2, st1Y2;
float st2X, st2Y, st2X2, st2Y2;
float st2_2X, st2_2Y, st2_2X2, st2_2Y2;
float st3X, st3Y, st3X2, st3Y2;
float st3_2X, st3_2Y, st3_2X2, st3_2Y2;
float st4X, st4Y, st4X2, st4Y2;
float st4_2X, st4_2Y, st4_2X2, st4_2Y2;
float st5X, st5Y, st5X2, st5Y2;
float st5_2X, st5_2Y, st5_2X2, st5_2Y2;
float st6X, st6Y, st6X2, st6Y2;
float st6_2X, st6_2Y, st6_2X2, st6_2Y2;
float st7X, st7Y, st7X2, st7Y2;
float st7_2X, st7_2Y, st7_2X2, st7_2Y2;
float st8X, st8Y, st8X2, st8Y2;
float st8_2X, st8_2Y, st8_2X2, st8_2Y2;
float st9X, st9Y, st9X2, st9Y2;
float st9_2X, st9_2Y, st9_2X2, st9_2Y2;
float st10X, st10Y, st10X2, st10Y2;
float st10_2X, st10_2Y, st10_2X2, st10_2Y2;
float st11X, st11Y, st11X2, st11Y2;
float st11_2X, st11_2Y, st11_2X2, st11_2Y2;
float st12X, st12Y, st12X2, st12Y2;
float st12_2X, st12_2Y, st12_2X2, st12_2Y2;
float st13X, st13Y, st13X2, st13Y2;
float st13_2X, st13_2Y, st13_2X2, st13_2Y2;
float st14X, st14Y, st14X2, st14Y2;
float st14_2X, st14_2Y, st14_2X2, st14_2Y2;
float st15_2X, st15_2Y, st15_2X2, st15_2Y2;

//this makes the lines not appear before you hover the stars
boolean line1=false;
boolean line1_2=false;
boolean line2=false;
boolean line2_2=false;
boolean line3=false;
boolean line3_2=false;
boolean line4=false;
boolean line4_2=false;
boolean line5=false;
boolean line5_2=false;
boolean line6=false;
boolean line6_2=false;
boolean line7=false;
boolean line7_2=false;
boolean line8=false;
boolean line8_2=false;
boolean line9=false;
boolean line9_2=false;
boolean line10=false;
boolean line10_2=false;
boolean line11=false;
boolean line11_2=false;
boolean line12=false;
boolean line12_2=false;
boolean line13=false;
boolean line13_2=false;
boolean line14=false;
boolean line14_2=false;

void setup() {
  //window size
  size(800, 600);

  //load the images
  img = loadImage("sky.jpg");
  ship = loadImage("spaceship.png");
  ship2 = loadImage("spaceship2.png");

  //cursor disappears
  noCursor();

  //declaring the start and end point of each line (before the hover)
  st1X = 217;
  st1Y = 356;
  st1X2 = st1X;
  st1Y2 = st1Y;

  st2X = 268;
  st2Y = 350;
  st2X2 = st2X;
  st2Y2 = st2Y;
  st2_2X = 268;
  st2_2Y = 350;
  st2_2X2 = st2_2X;
  st2_2Y2 = st2_2Y;

  st3X = 245;
  st3Y = 386;
  st3X2 = st3X;
  st3Y2 = st3Y;
  st3_2X = 245;
  st3_2Y = 386;
  st3_2X2 = st3_2X;
  st3_2Y2 = st3_2Y;

  st4X = 232;
  st4Y = 406;
  st4X2 = st4X;
  st4Y2 = st4Y;
  st4_2X = 232;
  st4_2Y = 406;
  st4_2X2 = st4_2X;
  st4_2Y2 = st4_2Y;

  st5X = 271;
  st5Y = 448;
  st5X2 = st5X;
  st5Y2 = st5Y;
  st5_2X = 271;
  st5_2Y = 448;
  st5_2X2 = st5_2X;
  st5_2Y2 = st5_2Y;

  st6X = 345;
  st6Y = 445;
  st6X2 = st6X;
  st6Y2 = st6Y;
  st6_2X = 345;
  st6_2Y = 445;
  st6_2X2 = st6_2X;
  st6_2Y2 = st6_2Y;

  st7X = 397;
  st7Y = 429;
  st7X2 = st7X;
  st7Y2 = st7Y;
  st7_2X = 397;
  st7_2Y = 429;
  st7_2X2 = st7_2X;
  st7_2Y2 = st7_2Y;

  st8X = 403;
  st8Y = 355;
  st8X2 = st8X;
  st8Y2 = st8Y;
  st8_2X = 403;
  st8_2Y = 355;
  st8_2X2 = st8_2X;
  st8_2Y2 = st8_2Y;

  st9X = 407;
  st9Y = 295;
  st9X2 = st9X;
  st9Y2 = st9Y;
  st9_2X = 407;
  st9_2Y = 295;
  st9_2X2 = st9_2X;
  st9_2Y2 = st9_2Y;

  st10X = 457;
  st10Y = 197;
  st10X2 = st10X;
  st10Y2 = st10Y;
  st10_2X = 457;
  st10_2Y = 197;
  st10_2X2 = st10_2X;
  st10_2Y2 = st10_2Y;

  st11X = 481;
  st11Y = 168;
  st11X2 = st11X;
  st11Y2 = st11Y;
  st11_2X = 481;
  st11_2Y = 168;
  st11_2X2 = st11_2X;
  st11_2Y2 = st11_2Y;

  st12X = 512;
  st12Y = 156;
  st12X2 = st12X;
  st12Y2 = st12Y;
  st12_2X = 512;
  st12_2Y = 156;
  st12_2X2 = st12_2X;
  st12_2Y2 = st12_2Y;

  st13X = 512;
  st13Y = 156;
  st13X2 = st13X;
  st13Y2 = st13Y;

  st13_2X = 593;
  st13_2Y = 115;
  st13_2X2 = st13_2X;
  st13_2Y2 = st13_2Y;

  st14X = 512;
  st14Y = 156;
  st14X2 = st14X;
  st14Y2 = st14Y;

  st14_2X = 578;
  st14_2Y = 64;
  st14_2X2 = st14_2X;
  st14_2Y2 = st14_2Y;

  st15_2X = 592;
  st15_2Y = 171;
  st15_2X2 = st15_2X;
  st15_2Y2 = st15_2Y;
}

void draw() {
  //load the background
  image(img, 0, 0);


  fill(190, 190, 210);
  stroke(190, 190, 210);
  
  //if every line is draw, the constellation
  if ((line1 || line1_2) && (line2 || line2_2) && (line3 || line3_2) && (line4 || line4_2) && (line5 || line5_2) && (line6 || line6_2) && (line7 || line7_2) && (line8 || line8_2) && (line9 || line9_2) && (line10 || line10_2) && (line11 || line11_2) && (line12 || line12_2) && (line13 || line13_2) && (line14 || line14_2)) {
    stroke(60, 195, 255);
    fill(60, 195, 255);
  } 
  
  /*
  when mouse is on top of one of the two stars that connect
   a line is created from that point to the other stars around
   
   the code ahead creates the lines
   */

  line(st1X, st1Y, st1X2, st1Y2);
  if (dist(mouseX, mouseY, 217, 356)<30 && !line1_2) {
    line1 = true;
  }
  if (line1) {
    st1X2 = ease(st1X2, 268, 0.08);
    st1Y2 = ease(st1Y2, 350, 0.08);
  }

  line(st2X, st2Y, st2X2, st2Y2);
  if (dist(mouseX, mouseY, 268, 350)<30 && !line2_2) {
    line2 = true;
  }
  if (line2) {
    st2X2 = ease(st2X2, 245, 0.08);
    st2Y2 = ease(st2Y2, 386, 0.08);
  }

  line(st2_2X, st2_2Y, st2_2X2, st2_2Y2);
  if (dist(mouseX, mouseY, 268, 350)<30 && !line1) {
    line1_2 = true;
  }
  if (line1_2) {
    st2_2X2 = ease(st2_2X2, 217, 0.08);
    st2_2Y2 = ease(st2_2Y2, 356, 0.08);
  }

  line(st3X, st3Y, st3X2, st3Y2);
  if (dist(mouseX, mouseY, 245, 386)<30  && !line3_2) {
    line3 = true;
  }
  if (line3) {
    st3X2 = ease(st3X2, 232, 0.08);
    st3Y2 = ease(st3Y2, 406, 0.08);
  }

  line(st3_2X, st3_2Y, st3_2X2, st3_2Y2);
  if (dist(mouseX, mouseY, 245, 386)<30 && !line2) {
    line2_2 = true;
  }
  if (line2_2) {
    st3_2X2 = ease(st3_2X2, 268, 0.08);
    st3_2Y2 = ease(st3_2Y2, 350, 0.08);
  }

  line(st4X, st4Y, st4X2, st4Y2);
  if (dist(mouseX, mouseY, 232, 406)<30 && !line4_2) {
    line4 = true;
  }
  if (line4) {
    st4X2 = ease(st4X2, 271, 0.08);
    st4Y2 = ease(st4Y2, 448, 0.08);
  }

  line(st4_2X, st4_2Y, st4_2X2, st4_2Y2);
  if (dist(mouseX, mouseY, 232, 406)<30 && !line3) {
    line3_2 = true;
  }
  if (line3_2) {
    st4_2X2 = ease(st4_2X2, 245, 0.08);
    st4_2Y2 = ease(st4_2Y2, 386, 0.08);
  }

  line(st5X, st5Y, st5X2, st5Y2);
  if (dist(mouseX, mouseY, 271, 448)<30 && !line5_2) {
    line5 = true;
  }
  if (line5) {
    st5X2 = ease(st5X2, 345, 0.08);
    st5Y2 = ease(st5Y2, 445, 0.08);
  }

  line(st5_2X, st5_2Y, st5_2X2, st5_2Y2);
  if (dist(mouseX, mouseY, 271, 448)<30 && !line4) {
    line4_2 = true;
  }
  if (line4_2) {
    st5_2X2 = ease(st5_2X2, 232, 0.08);
    st5_2Y2 = ease(st5_2Y2, 406, 0.08);
  }

  line(st6X, st6Y, st6X2, st6Y2);
  if (dist(mouseX, mouseY, 345, 445)<30 && !line6_2) {
    line6 = true;
  }
  if (line6) {
    st6X2 = ease(st6X2, 397, 0.08);
    st6Y2 = ease(st6Y2, 429, 0.08);
  }

  line(st6_2X, st6_2Y, st6_2X2, st6_2Y2);
  if (dist(mouseX, mouseY, 345, 445)<30 && !line5) {
    line5_2 = true;
  }
  if (line5_2) {
    st6_2X2 = ease(st6_2X2, 271, 0.08);
    st6_2Y2 = ease(st6_2Y2, 448, 0.08);
  }

  line(st7X, st7Y, st7X2, st7Y2);
  if (dist(mouseX, mouseY, 397, 429)<30 && !line7_2) {
    line7 = true;
  }
  if (line7) {
    st7X2 = ease(st7X2, 403, 0.08);
    st7Y2 = ease(st7Y2, 355, 0.08);
  }

  line(st7_2X, st7_2Y, st7_2X2, st7_2Y2);
  if (dist(mouseX, mouseY, 397, 429)<30 && !line6) {
    line6_2 = true;
  }
  if (line6_2) {
    st7_2X2 = ease(st7_2X2, 345, 0.08);
    st7_2Y2 = ease(st7_2Y2, 445, 0.08);
  }

  line(st8X, st8Y, st8X2, st8Y2);
  if (dist(mouseX, mouseY, 403, 355)<30 && !line8_2) {
    line8 = true;
  }
  if (line8) {
    st8X2 = ease(st8X2, 407, 0.08);
    st8Y2 = ease(st8Y2, 295, 0.08);
  }

  line(st8_2X, st8_2Y, st8_2X2, st8_2Y2);
  if (dist(mouseX, mouseY, 403, 355)<30 && !line7) {
    line7_2 = true;
  }
  if (line7_2) {
    st8_2X2 = ease(st8_2X2, 397, 0.08);
    st8_2Y2 = ease(st8_2Y2, 429, 0.08);
  }

  line(st9X, st9Y, st9X2, st9Y2);
  if (dist(mouseX, mouseY, 407, 295)<30 && !line9_2) {
    line9 = true;
  }
  if (line9) {
    st9X2 = ease(st9X2, 457, 0.08);
    st9Y2 = ease(st9Y2, 197, 0.08);
  }

  line(st9_2X, st9_2Y, st9_2X2, st9_2Y2);
  if (dist(mouseX, mouseY, 407, 295)<30 && !line8) {
    line8_2 = true;
  }
  if (line8_2) {
    st9_2X2 = ease(st9_2X2, 403, 0.08);
    st9_2Y2 = ease(st9_2Y2, 355, 0.08);
  }

  line(st10X, st10Y, st10X2, st10Y2);
  if (dist(mouseX, mouseY, 457, 197)<30 && !line10_2) {
    line10 = true;
  }
  if (line10) {
    st10X2 = ease(st10X2, 481, 0.08);
    st10Y2 = ease(st10Y2, 168, 0.08);
  }

  line(st10_2X, st10_2Y, st10_2X2, st10_2Y2);
  if (dist(mouseX, mouseY, 457, 197)<30 && !line9) {
    line9_2 = true;
  }
  if (line9_2) {
    st10_2X2 = ease(st10_2X2, 407, 0.08);
    st10_2Y2 = ease(st10_2Y2, 295, 0.08);
  }

  line(st11X, st11Y, st11X2, st11Y2);
  if (dist(mouseX, mouseY, 481, 168)<30 && !line11_2) {
    line11 = true;
  }
  if (line11) {
    st11X2 = ease(st11X2, 512, 0.08);
    st11Y2 = ease(st11Y2, 156, 0.08);
  }

  line(st11_2X, st11_2Y, st11_2X2, st11_2Y2);
  if (dist(mouseX, mouseY, 481, 168)<30 && !line10) {
    line10_2 = true;
  }
  if (line10_2) {
    st11_2X2 = ease(st11_2X2, 457, 0.08);
    st11_2Y2 = ease(st11_2Y2, 197, 0.08);
  }

  line(st12X, st12Y, st12X2, st12Y2);
  if (dist(mouseX, mouseY, 512, 156)<30 && !line12_2) {
    line12 = true;
  }
  if (line12) {
    st12X2 = ease(st12X2, 593, 0.08);
    st12Y2 = ease(st12Y2, 115, 0.08);
  }

  line(st12_2X, st12_2Y, st12_2X2, st12_2Y2);
  if (dist(mouseX, mouseY, 512, 156)<30 && !line11) {
    line11_2 = true;
  }
  if (line11_2) {
    st12_2X2 = ease(st12_2X2, 481, 0.08);
    st12_2Y2 = ease(st12_2Y2, 168, 0.08);
  }

  line(st13X, st13Y, st13X2, st13Y2);
  if (dist(mouseX, mouseY, 512, 156)<30 && !line13_2) {
    line13 = true;
  }
  if (line13) {
    st13X2 = ease(st13X2, 578, 0.08);
    st13Y2 = ease(st13Y2, 64, 0.08);
  }

  line(st13_2X, st13_2Y, st13_2X2, st13_2Y2);
  if (dist(mouseX, mouseY, 593, 115)<30 && !line12) {
    line12_2 = true;
  }
  if (line12_2) {
    st13_2X2 = ease(st13_2X2, 512, 0.08);
    st13_2Y2 = ease(st13_2Y2, 156, 0.08);
  }

  line(st14X, st14Y, st14X2, st14Y2);
  if (dist(mouseX, mouseY, 512, 156)<30 && !line14_2) {
    line14 = true;
  }
  if (line14) {
    st14X2 = ease(st14X2, 592, 0.08);
    st14Y2 = ease(st14Y2, 171, 0.08);
  }

  line(st14_2X, st14_2Y, st14_2X2, st14_2Y2);
  if (dist(mouseX, mouseY, 578, 64)<30 && !line13) {
    line13_2 = true;
  }
  if (line13_2) {
    st14_2X2 = ease(st14_2X2, 512, 0.08);
    st14_2Y2 = ease(st14_2Y2, 156, 0.08);
  }

  line(st15_2X, st15_2Y, st15_2X2, st15_2Y2);
  if (dist(mouseX, mouseY, 592, 171)<30 && !line14) {
    line14_2 = true;
  }
  if (line14_2) {
    st15_2X2 = ease(st15_2X2, 512, 0.08);
    st15_2Y2 = ease(st15_2Y2, 156, 0.08);
  }


  ellipse(217, 356, 5, 5);
  ellipse(268, 350, 10, 10);
  ellipse(245, 386, 7, 7);
  ellipse(232, 406, 5, 5);
  ellipse(271, 448, 10, 10);
  ellipse(345, 445, 6, 6);
  ellipse(397, 429, 7, 7);
  ellipse(403, 355, 6, 6);
  ellipse(407, 295, 10, 10);
  ellipse(457, 197, 5, 5);
  ellipse(481, 168, 5, 5);
  ellipse(512, 156, 5, 5);
  ellipse(593, 115, 7, 7);
  ellipse(578, 64, 7, 7);
  ellipse(592, 171, 5, 5);

  rectMode(CENTER);
  image(ship, mouseX, mouseY);
}

//this code creates the easing effect to create the lines
float ease(float pos, float tar, float easing) {
  float dis = tar - pos;
  pos += dis*easing;
  return pos;
} 

/*
when mouse moves the spaceship image changes 
 for one with fire on the bottom  
 */
void mouseMoved() {
  image(ship2, mouseX, mouseY);
}



