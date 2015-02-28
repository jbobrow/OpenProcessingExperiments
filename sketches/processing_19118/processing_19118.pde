
size (250, 250);
background (30);
smooth ();

char[] charArr = {'M', '6', 'M', '5', 'K', '5'};//defining the list of chars

//defining the fonts
PFont font2;
font2 = loadFont ("CenturyGothic-72.vlw");
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


