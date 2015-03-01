
//Assignent 2a: Media Arts & Practice 404 Tactical Media
//McKenzie Carlile

PImage elvis;
PImage grid;
PFont font;
int x = 850;
int savedTime;
int totalTime = 400;
int tickerCreep = 30;
int textX = 100;

void setup () {
  size (800, 150, P2D);
  elvis = loadImage ("elvis.png");
  grid = loadImage ("grid.png");
  font = loadFont("ChessType-100.vlw");
  textFont(font, 100);

  savedTime = millis();
}

void draw () {
  background (88, 117, 121);
  fill (88, 117, 121);
  image (grid, 150, 15);
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    x = x-tickerCreep;
    println(x);
    savedTime = millis();
  }
  text("elvis lives !  back from the dead one night only. venue : in the ghetto", x, 100);
  noStroke();
  rect(0, 0, 150, 150);
  image (elvis, 15, 4);

  if (x < -4000) {
    x = 850;
  }
}

//works cited

//Elvis Illustration copyright Miguel Gonzalez
//retrieved from http://www.m-lon.com/#!product/prd2/1395441641/pixel-art---elvis-presley-(vegas)



