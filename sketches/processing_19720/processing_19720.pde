
PFont font;

size(250, 250);
background(#262626);
font = loadFont ("CenturyGothic-50.vlw");
smooth();

//background lines 
stroke(#687061, 20);
strokeWeight(60);
line(0, 40, 270, 190);

stroke(#871E31, 50);
strokeWeight(20);
line (0, 0, 270, 150);
line (-20, 75, 270, 225);

//text parameters
for (int i = -20; i < 100; i += 01) {
  fill (#9E9D7B, 20);
  textFont(font);
  text ("K9A 5N7", random(0, 0), random(height));
}

fill(20);
text ("K9A 5N7", 0, 249);

