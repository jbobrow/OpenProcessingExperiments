
int yloc = 75;
 
void setup () {
   size (600, 600);
  noStroke ();
  smooth ();
 
}
 
void draw () {
  background (random(255),random(255),random(255));
  translate (width/15,55);
  clock(month(),1,"Months");
  clock (day(), 2, "Days");
  clock (hour(), 3, "Hours");
  clock (minute(), 4, "Minutes");
  clock (second(), 5, "Seconds");
  clock (millis(), 6, "Milliseconds");
  fill (250);
  }
 
void clock (int mainTime, int row, String title) {
 
  fill(random(255),random(255),random(255));
  
  String time2 = title;
  textSize(25); 
  
  text (time2, 5, yloc* row);
  
  float textwidth = textWidth (time2);
  fill(random(255),random(255),random(255));
  
  int time1 = int (mainTime);
  textSize(70);
  
  text (time1, textwidth+50, yloc*row);

 
}
