
PFont font;

void setup() {
  size(480, 100);
  noStroke();
  smooth();
  font = loadFont("2551-dotgital-48.vlw");
  textFont(font);
}

void draw() {
  background (153, 25, 152);
  int x =0;
  for(int i=0; i <= 255; i += 30) {
    fill (0,255-i);
    rect(x,0,20,100);
    x+=20;
  }
  int y =260;
  for(int i=0; i <= 255; i += 20) {
    fill (0,i);
    rect(y,0,20,100);
    y+=20;
  }
  float s = map(second(), 0, 60, 20, 467);
  float m = map(minute(), 0, 60, 30, 457);
  float h = map(hour(), 0, 24, 40, 445);
  fill(255);
  textSize(38);
  text("7",270,25);
  fill(255,0 ,0,200);
  ellipse(h, 50,79,79);
  fill(255);
  textSize(28);
  text("1",45,50);
  textSize(48);
  text("3",113,100);
  textSize(18);
  text("6",235,70);
  textSize(18);
  text("9",348,45);
  textSize(20);
  text("11",427,80);
  fill(0, 0, 235,200);
  ellipse(m, 60,59,59);
  fill(255,255,0,200);
  ellipse(s, 45, 39,39);
}

