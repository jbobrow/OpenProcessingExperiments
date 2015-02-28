
size(250, 250);
background(#242424);
PFont font;
font = loadFont ("CenturyGothic-Bold-140.vlw");
textFont(font);
fill(#E37867, 180);
text("L", 10, 110);
// loop for mini letters
for(int x = 0; x < 50; x++) {
  font = loadFont ("CenturyGothic-Bold-20.vlw");
  textFont(font);
  fill(#F0DDDA, 30);
  text("L", random (0, 70), random (0, 125));
}
for(int x = 0; x < 40; x++) {
  font = loadFont ("CenturyGothic-Bold-20.vlw");
  textFont(font);
  fill(#F0DDDA, 30);
  text("9", random (75, 150), random (0, 125));
}
for(int x = 0; x < 40; x++) {
  font = loadFont ("CenturyGothic-Bold-20.vlw");
  textFont(font);
  fill(#F0DDDA, 30);
  text("C", random (150, 250), random (0, 125));
}
for(int x = 0; x < 40; x++) {
  font = loadFont ("CenturyGothic-Bold-20.vlw");
  textFont(font);
  fill(#F0DDDA, 30);
  text("6", random (0,75), random (125, 250));
}
for(int x = 0; x < 30; x++) {
  font = loadFont ("CenturyGothic-Bold-20.vlw");
  textFont(font);
  fill(#F0DDDA, 30);
  text("W", random (75,150), random (125, 250));
}
for(int x = 0; x < 40; x++) {
  font = loadFont ("CenturyGothic-Bold-20.vlw");
  textFont(font);
  fill(#F0DDDA, 30);
  text("9", random (150,250), random (125, 250));
}
// large opaque translucent letters
font = loadFont ("CenturyGothic-Bold-140.vlw");
textFont(font);
fill(#E54931, 180);
text("9", 80, 110);
fill(#D81832, 180);
text("6", 3, 240);
fill(#E37867, 180);
text("9", 175, 240);
font = loadFont ("CenturyGothic-Bold-130.vlw");
textFont(font);
fill(#E54931, 180);
text("W", 67, 240);
fill(#D81832, 180);
text("C", 155, 110);








