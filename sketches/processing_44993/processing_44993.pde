
PFont fontA;
String phr = "E_PERIMENTAL _RT O_ANGE COUN_TY ";
int count = 0;
char ch = phr.charAt(0);
char c = 'A';
int xpos = 10;
int ypos = 50;
color r = color(204, 0, 0);
color b = color(16);
color bg = color (255);


void setup() {
  size(500, 500);
  background(bg);
  fontA = loadFont("DINNextLTPro-Condensed-24.vlw");
  fill(0);
  smooth();
  textFont(fontA, 24);
  rectMode(CORNERS);
  frameRate(50);
}



void draw() {
  /*
  if (c%10 == 0) {
   fill(r);
   }
   else if (c%3 == 0) {
   fill(168,106,178);
   }
   else {
   fill(b);
   }*/

  for (int i=0; i<width; i += 120) {
    for (int j = 50; j<height; j +=120) {
      //abShape(0,i, 150, 2);
      drawlogo(i, j, random(2,255), random(-1,1));
    }
  }
}



void drawlogo (float x, float y, float fillter,float felter /*float color*/) 
{
  filter(POSTERIZE, fillter);
  filter(BLUR, felter);

  pushMatrix();
  translate(x, y);
  if (c%10 == 0) {
    fill(b);
  }
  else if (c%3 == 0) {
    fill(b);
  }
  else {
    fill(b);
  }
  text (ch, xpos, ypos);
  ch = phr.charAt(count);
  count++;
  if (count >= 21) {
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
    //rect(-10, -10, width, height);
    xpos = 10;
    ypos += 40;
  }
  if (ypos >= 500) {


    ypos = 50;
  }
  popMatrix();
}


