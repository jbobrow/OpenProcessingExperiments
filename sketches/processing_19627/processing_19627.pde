
size (250, 250);
background (0);
smooth ();
 
char[] charArr = {'M', '2', 'J', '2', 'H', '3'};//defining the list of chars
 
//defining the fonts
PFont font;
font = loadFont ("BodoniMTBlack-100.vlw");
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



 

PFont font2;
font2 = loadFont ("BodoniMTBlack-20.vlw");
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


