
size(250,250);
background(162,206,81,100);
smooth();

PFont font;
font = loadFont ("HelveticaNeue-48.vlw");
textFont(font);

// loop for mini letters
for(int x = 0; x < 85; x++) {
  font = loadFont ("HelveticaNeue-48.vlw");
  textFont(font);
  textSize(25);
  fill(240, 80);
  text("M", random (20, 250), random (0, 250));
  text("2", random (-20, 250), random (-10, 240));
  text("H", random (-20, 250), random (10, 260));
  text("3", random (-20,250), random (0, 250));
  text("J", random (-20,260), random (-20, 250));
}

//large orange letters
fill(240,195,15,180);
textSize(60);
text("M",50,100);
text("M",55,100,100);

textSize(95);
text("J",170,90);

fill(255,193,59,190);
textSize(65);
text("2",65,170);
text("2",60,170);

fill(250,185,35,180);
textSize(105);
text("H",90,200);

fill(240,169,15,180);
textSize(85);
text("3",200,50);
text("3",205,50);
text("3",-10,250);

