
void setup() {
  size(700, 300);
  smooth();
}

void draw() {


  int sec = second();
  int min = minute();
  int ho = hour();
  float secMap = map(sec, 0, 59, 0, 200);
  float minMap = map(min, 0, 59, 0, 200);
  float hoMap = map(ho, 0, 23, 0, 200);

  stroke(0, 0, 0, 50);
  line(2, 2, 800, hoMap); //hours
  
  stroke(3, 255, 177, 50);
  line(2, 2, 800, minMap); //minutes

  stroke(255, 235, 53, 50);
  line(2, 2, 800, secMap); //seconds

}
