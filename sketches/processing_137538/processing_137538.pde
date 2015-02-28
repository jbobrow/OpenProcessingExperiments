
int i = 20;
int t = 10;
PFont font;


size(700, 700);
noStroke();
font = loadFont ("MoonFlower-60.vlw");
textFont(font, 60);


while ( i <= width ) {
  fill(i,  100, 100, 80);
 rect(i, 0, 20, height);
  i = i + 50;
}

while ( t <= height ) {
  fill(t, 100, 100, 100);
   text("TONES", t, t);
  t = t + 50;
}








