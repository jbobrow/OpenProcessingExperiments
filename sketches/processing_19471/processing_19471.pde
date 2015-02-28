
PFont font;

int num = 60;
int x[] = new int[num];
int y[] = new int[num];

void setup() {
  font = loadFont("AcademyEngravedLetPlain-60.vlw");//font in use
  textFont(font);
  size(250, 250);
  smooth();
  noStroke();
}

void draw() {
  background(100,0,125);
  for (int i = x.length-1; i > 0; i--) {
    x[i] = x[i-1];//when it moves it moves this amount
    y[i] = y[i-1];
  }
  x[0] = mouseX; //where it starts
  y[0] = mouseY; 
  for (int i = 0; i < x.length; i++) {
    fill(i * 4); //changes initial colour when it moves
    textSize(20);
    text("N",x[i], y[i], 40, 40);
    text(" 2",x[i], y[i], 40, 40);
    text("  K",x[i], y[i], 40, 40);
    text("   3",x[i], y[i], 40, 40);
    text("    V",x[i], y[i], 40, 40);
    text("     4",x[i], y[i], 40, 40);
  }
}

