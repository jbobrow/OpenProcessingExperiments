
PFont font;

String myString;

void setup() {
  frameRate(60);
  font = loadFont("Commodore_64_Angled-48.vlw");
  size(770,100);
  textFont (font);
}

void draw() {

  String cl;

  SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy/HH/mm/ss");

  Calendar date = Calendar.getInstance(); // the current date and time

  int numberOfDaysToAdd = (int) random(365);
  int numberOfHoursToAdd = (int) random(24);
  int numberOfMinutesToAdd = (int) random(60);
  int numberOfSecondsToAdd = (int) random(60);

  date.add(Calendar.DAY_OF_YEAR, numberOfDaysToAdd);
  date.add(Calendar.HOUR_OF_DAY, numberOfHoursToAdd);
  date.set(Calendar.MINUTE, numberOfMinutesToAdd);
  date.set(Calendar.SECOND, numberOfSecondsToAdd);

  cl = df.format(date.getTime());

  background(0);
  fill(114,234,183);
  text(cl,23,60);
  filter(DILATE);
  filter(BLUR,8);
  fill(176,242,215);
  text(cl,20,60);
  filter(BLUR,1);
  // horizontal lines
  for (int y = 0; y <= height; y+= 5) {
    strokeWeight(0.1);
    stroke(20,200,20,20);
    line (0, y, width, y);
  }
  //  saveFrame("fecha-####.png");

  if((keyCode == ENTER)) {
    noLoop();
  }
}


