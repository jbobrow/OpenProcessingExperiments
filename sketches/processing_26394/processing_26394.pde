

PFont font;
int yloc = 36;

void setup () {
  int square = int (yloc*8);
  size (576, 360);
  noStroke ();
  smooth ();
}

void draw () {
  background (224);
  translate (width/2,0);
  font = loadFont ("232MKSDRoundMedium-18.vlw");
  textFont (font);
  clock (year(), 1, "Year");
  clock (month(), 2, "Month");
  clock (day(), 3, "Day");
  clock (hour(), 4, "Hour");
  clock (minute(), 5, "Minute");
  clock (second(), 6, "Second");
  clock (millis(), 7, "Milliseconds");
  fill (160);
  String ss = "since start";
  text (ss,5,yloc*7.5+3);
  textAlign (CENTER);
  String finalcountdown = binary (year())+binary (month())+binary (day())+binary (hour())+binary (minute())+binary (second());
  text (finalcountdown, 0,yloc*9);
}

void clock (int mainTime, int row, String title) {
  textAlign (RIGHT);
  fill (96);
  String time1 = binary (mainTime);
  text (time1, -5, yloc*row);
  textAlign (LEFT);
  fill (160);
  String time2 = title;
  text (time2, 5, yloc*row);
  float textwidth = textWidth (time2);
  fill (96);
  int time3 = int (mainTime);
  text (time3, textwidth+15, yloc*row);
}

