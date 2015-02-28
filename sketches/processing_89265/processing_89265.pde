
/*
 *  Title: P08_01_Fonts
 *  By:    Barton Poulson (artbybart.org)
 *  Date:  13 February 2013
 *
 *  Assignment: 
 *    Create a sketch that uses at least three different fonts.
 *    (Note that because this sketch will have data files for the
 *    fonts, you cannot simply copy and paste it into OpenProcessing.
 *    Instead, you will need to follow the instructions on how to
 *    "upload from processing," which are on your portfolio page.
 */
 
int y = 100;
 
PFont font1;
PFont font2;
PFont font3;

String text1 = "The Procrustean Typesetter";
String text2 = "short fonts stretched to fit";
String text3 = "long fonts cut off to fit";

void setup() {
  size(600, 200);
  font1 = loadFont("BlackmoorLetPlain-48.vlw");
  font2 = loadFont("BirchStd-36.vlw");
  font3 = loadFont("Monospaced-36.vlw");
  cursor(TEXT);
}

void draw() {
  background(20);
  textFont(font1);
  fill(180);
  text(text1, 10, 40);

  textFont(font2);
  fill(#FFFF00);
  text(text2, 0, y, mouseX, 100);

  textFont(font3);
  fill(#FF0000);
  text(text3, mouseX, mouseY);  
}


