
// How to make a timer

long startTime;

void setup() {  
  size(200, 200);
  startTime = millis(); // milliseconds since the program started
  textFont(createFont("Courier", 22));
}

void draw() {
  background(0);
  text("millis: " + millis(), 10, 40);
  text("start: " + startTime, 10, 80);  
  
  long elapsedTime = millis() - startTime;
  text("elapsed: " + elapsedTime, 10, 120);
  
  if (elapsedTime > 3000) {
    text("3 seconds!", 10, 165);  
  }
}

void mousePressed() {
  // reset the timer
  startTime = millis();
}
