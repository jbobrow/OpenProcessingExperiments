
String oneName = "I'M";
String otherName = "DONE";
String displayed ="";

int interval = 2000; 
int time;

PFont font;

void setup() {
  size(300, 300);
  font = createFont("arial", 26);
  background(0);
  displayed = oneName;
  time = millis();
  textFont(font);
  fill(#F70C0C);
}

void draw() {
  background(0);
  text(displayed, width/2 - textWidth(displayed)/2, height/2);
  if (millis() - time > interval) {
    displayed = displayed.equals(oneName)? otherName:oneName;
    time  = millis();
  }
}

