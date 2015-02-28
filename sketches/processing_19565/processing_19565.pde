
size(250, 250);
background(229, 215, 245);
PFont font;
font = loadFont("GillSansMT-Condensed-48.vlw");
 
textFont(font);
 
fill(0);
text("M2J", 50, 100);
text("2H3", 0, 180);
 
fill(0, 90);
text("M2J", 60, 100);
text("2H3", 10, 180);
 
fill(0, 50);
text("M2J", 70, 100);
text("2H3", 20, 180);

char[] charArr = {'M', '2', 'J', '2', 'H', '3'};//defining the list of chars
 
//defining the fonts
PFont font2;
font2 = loadFont ("GillSansMT-Condensed-48.vlw");
textFont (font2, 24);
 
//generating random texts on the background
for (int i = 0; i < 80; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    //generating the random chars
    fill (255, 30);
    text (charArr[counter], random(width), random(height));
  };
};
 
//limiting the random text with colours
for (int i = 0; i < 2; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    fill (#FFB600, 100);
    textSize(48);
    text (charArr[counter], random(width), random(height));
  };
};
 
for (int i = 0; i < 2; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    fill (#A4BF51, 100);
    textSize(72);
    text (charArr[counter], random(width), random(height));
  };
};


