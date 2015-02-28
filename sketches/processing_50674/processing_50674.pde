
float x1, y1, x2, y2;
float le1, le2, le3, le4, le5;
float re1, re2, re3, re4, re5;
float mx, my;
float lcx, lcy, rcx, rcy;
float leb1, leb2, leb3, leb4;
float reb1, reb2, reb3, reb4;

PShape leverSlit;
PShape lever;
PShape toasterSlit;
PShape toast;

void setup()
{
  size(500, 550);
  smooth();
  lever = loadShape("lever.svg");
  leverSlit = loadShape("lever slit.svg");
  toasterSlit = loadShape("toaster slit.svg");
  toast = loadShape("toast.svg");
}

void draw()
{
  background(#FAFFDE);
  strokeWeight(1);
  fill(230);
  rect(-1, 400, 501, 201);
  
  // Top of Toaster
  noSmooth();
  stroke(0);
  strokeWeight(.5);
  fill(#A6D7EA);
  quad(125, 330.0,  x1, 330.0,  x2, y2-153.85,  x2-200.0, y2-153.85);
  
  // Slit for Toaster
  noStroke();
  noFill();
  smooth();
  shape(toasterSlit, 148, 296, 200, 50);
  
  // Toast
  float tv = map(mouseX, 400, 500, 300, 50);
  float csv = constrain(tv, 50, 300);
  shape(toast, 160, csv, 175, 175);
  
  // Cover for Slit and Toast
  fill(#A6D7EA);
  rect(150, 326, 200, 100);
  
  // Basic Toaster Box
  noSmooth();
  stroke(0);
  strokeWeight(.5);
  x1 = 325.0;
  y1 = 483.85;
  x2 = x1 + 50;
  y2 = y1 - 14.29;
  rect(125, 330.0, 200, 153.84);
  quad(x1, 330.0,  x1, y1,  x2, y2,  x2, y2-153.84);
  
  // Left Cheek
  float cv = map(mouseX, 0, 500, 5, 45.45);
  float cfv = map(mouseX, 0, 500, 209, 15);
  float cfv2 = map(mouseX, 0, 500, 209, 19);
  noStroke();
  smooth();
  fill(255, cfv, cfv2);
  lcx = 164.0;
  lcy = 433.0;
  ellipse(lcx, lcy, cv, cv);
  
  // Right Cheek
  float rcfv = map(mouseX, 0, 500, 240, 140);
  rcx = 285.05;
  rcy = 433.0;
  ellipse(rcx, rcy, cv, cv);
  
  // Mouth
  float mv = map(mouseX, 0, 500, 4.55, 62.5);
  stroke(0);
  strokeWeight(.5);
  fill(250);
  mx = 224.0;
  my = 439.0;
  ellipse(mx, my, mv, mv);
   
  // Left Eye
  float esv = map(mouseX, 0, 500, .5, 10);
  stroke(0);
  strokeWeight(esv);
  le1 = 180.0;
  le2 = 401.0;
  le3 = 205.0;
  le4 = 411.0;
  le5 = 419.0;
  
  line(le1, le2, le3, le4);
  line(le3, le4, le1, le5);
  
  // Right Eye
  re1 = 269.05;
  re2 = 401.0;
  re3 = 244.05;
  re4 = 411.0;
  re5 = 419.0;
  
  line(re1, re2, re3, re4);
  line(re3, re4, re1, re5);
  
  // Left Eyebrow
  float ebsv = map(mouseX, 0, 500, .5, 7);
  float lev = map(mouseX, 0, 500, 382.63, 390);
  stroke(0);
  strokeWeight(ebsv);
  strokeCap(SQUARE);
  leb1 = 180.0;
  leb2 = 382.63;
  leb3 = 205.0;
  leb4 = 382.63;
  
  line(leb1, leb2, leb3, lev);
  
  // Right Eyebrow
  float rev = map(mouseX, 0, 500, 382.63, 390);
  reb1 = 269.05;
  reb2 = 382.63;
  reb3 = 244.05;
  reb4 = 382.63;
  
  line(reb1, reb2, reb3, rev);
  
  // Slit for Toaster Lever
  shape(leverSlit, 251.5, 300, 200, 200);
  
  // Lever
  float lv = map(mouseX, 400, 500, 410, 317);
  float cslv = constrain(lv, 317, 410);
  shape(lever, 321, cslv, 70, 70);
  
}


