
int i = 20;
 
PFont font;
 
 
size(700, 700);
noStroke();
font = loadFont ("MoonFlower-60.vlw");
textFont(font, 60);
 
 
while ( i <= width ) {
  int t = 10;
  while ( t <= height ) {
    fill (255, 50);
    ellipse( i, t, 30, 30);
     
    fill(i, 100, 100, 40);
    rect(i, t, 40, 40);
     
    fill(t, 60, 50, 80);
    text("TONES", t, t);
    t = t + 50;
  }
  i = i + 50;
}

