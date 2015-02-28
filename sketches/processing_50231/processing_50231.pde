
float x1, y1, x2, y2;
float le1, le2, le3, le4, le5;
float re1, re2, re3, re4, re5;
float mx, my;
float lcx, lcy, rcx, rcy;
float leb1, leb2, leb3, leb4;
float reb1, reb2, reb3, reb4;

void setup()
{
  size(500, 500);
  background(235);
  smooth();
}

void draw()
{
  // Basic Toaster Box
  noSmooth();
  stroke(0);
  strokeWeight(.5);
  x1 = width/4 + width/2.5;
  y1 = height*.66 + height/3.25;
  x2 = x1 + width/10;
  y2 = y1 - height/35;
  fill(200);
  rect(width/4, height*.66, width/2.5, height/3.25);
  quad(x1, height*.66,  x1, y1,  x2, y2,  x2, y2-height/3.25);
  quad(width/4, height*.66,  x1, height*.66,  x2, y2-height/3.25,  x2-width/2.5, y2-height/3.25);
  
  // Left Cheek
  float cv = map(mouseX, 0, width, width/100, width/11);
  float cfv = map(mouseX, 0, width, 240, 50);
  noStroke();
  smooth();
  fill(cfv);
  lcx = le1-width/30;
  lcy = le5+height/35;
  ellipse(lcx, lcy, cv, cv);
  
  // Right Cheek
  float rcfv = map(mouseX, 0, width, 240, 140);
  rcx = re1+width/30;
  rcy = re5+height/35;
  ellipse(rcx, rcy, cv, cv);
  
  // Mouth
  float mv = map(mouseX, 0, width, width/110, width/8);
  stroke(0);
  strokeWeight(.5);
  fill(255);
  mx = le3+width/26;
  my = le5+height/25;
  ellipse(mx, my, mv, mv);
  
  // Left Eye
  float esv = map(mouseX, 0, width, .5, 10);
  stroke(0);
  strokeWeight(esv);
  le1 = width/4+width/9;
  le2 = height*.66+height/7;
  le3 = width/4+width/9+width/20;
  le4 = height*.66+height/7+height/50;
  le5 = height*.66+height/7+height/27;
  
  line(le1, le2, le3, le4);
  line(le3, le4, le1, le5);
  
  // Right Eye
  re1 = width/4+width/4.2+width/20;
  re2 = height*.66+height/7;
  re3 = width/4+width/4.2;
  re4 = height*.66+height/7+height/50;
  re5 = height*.66+height/7+height/27;
  
  line(re1, re2, re3, re4);
  line(re3, re4, re1, re5);
  
  // Left Eyebrow
  float ebsv = map(mouseX, 0, width, .5, 7);
  stroke(0);
  strokeWeight(ebsv);
  strokeCap(SQUARE);
  leb1 = width/4+width/9;
  leb2 = height*.66+height/9.5;
  leb3 = width/4+width/9+width/20;
  leb4 = height*.66+height/9.5;
  
  line(leb1, leb2, leb3, leb4);
  
  // Right Eyebrow
  reb1 = width/4+width/4.2+width/20;
  reb2 = height*.66+height/9.5;
  reb3 = width/4+width/4.2;
  reb4 = height*.66+height/9.5;
  
  line(reb1, reb2, reb3, reb4);
  
  // Slit for Toaster Lever
  noStroke();
  fill(50);
  quad(x1+width/23, height*.66+height/55,  x1+width/23, y1-height/25,  
  x2-width/23, y2-height/55,  x2-width/23, y2-height/3.25+height/25);
  
  // Lever
  stroke(0);
  fill(200);
  
  
  // Slit for Toast
  
  // Toast
  
  // Toast Face
  
}


