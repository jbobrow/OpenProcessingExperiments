
size (250, 250);
background (30);
smooth ();

char[] charArr = {'M', '6', 'M', '5', 'K', '5'};//defining the list of chars

//defining the fonts
PFont font;
font = loadFont ("Arial-BoldMT-120.vlw");
textFont (font, 72);

//generating random texts on the background
for (int i = 0; i < 5; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    //generating the random chars
    fill (#C1272D, 30);
    text (charArr[counter], random(width)-20, 50);
  };
};

//generating random texts on the background
for (int i = 0; i < 5; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    //generating the random chars
    fill (#F15A24, 30);
    text (charArr[counter], random(width)-20, 100);
  };
};

//generating random texts on the background
for (int i = 0; i < 3; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    //generating the random chars
    fill (#FBB03B, 30);
    text (charArr[counter], random(width)-20, 150);
  };
};

//generating random texts on the background
for (int i = 0; i < 5; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    //generating the random chars
    fill (#F15A24, 30);
    text (charArr[counter], random(width)-20, 200);
  };
};

//generating random texts on the background
for (int i = 0; i < 5; i++) {
  for (int counter = 0; counter < charArr.length; counter++) {
    //generating the random chars
    fill (#C1272D, 30);
    text (charArr[counter], random(width)-20, 250);
  };
};



