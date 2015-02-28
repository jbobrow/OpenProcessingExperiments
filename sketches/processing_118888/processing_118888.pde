
void setup() {
  size(300,140);
}
void draw() {
  background(30, 100, 200);
  float secondMap = map(second(), 0, 59, 0, width );
  rect(secondMap, 20, 20, 20);
  float minuteMap = map( minute(), 0, 59, 0, width );
  rect(minuteMap, 60, 20, 20);  
  float hourmap = map( hour(), 0, 23, 0, width );
  rect(0, 100, hourmap, 20);
}
