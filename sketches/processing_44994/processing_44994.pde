
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
  size(800, 500);
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

  ch = phr.charAt(count);
  count++;

  float temp = random(100);

  if (((ch == 'A') || (ch =='R') || (ch == 'T')) &&  (temp<10)  )   //(frameCount%7 == 0))
  {
    fill(255, 0, 0);
  }
  else {
    fill(0);
  }
  text (ch, xpos, ypos);


  if (count >= 21) {
    count = 0;
  }
  print ("("+c+","+int(c)+")"+"-");
  xpos += 40;
  c++;
  if (c > 90) {
    c = 'A';
  }

  if (xpos >= 890) {
    fill(255, 18);
    rect(-10, -10, width, height);
    xpos = 10;
    ypos += 40;
  }
  if (ypos >= 500) {


    ypos = 50;
  }


  filter (BLUR, map(mouseX,0,width,5,0));
}


//void mousePressed()
{
 // saveFrame("scaling-##.tif");
}


