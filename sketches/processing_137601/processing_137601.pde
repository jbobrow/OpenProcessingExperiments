
int time = 100;
 
void setup() {
  size(800, 800);
}
 
void draw() {
  background(255);
  int Time = millis();
  if (Time >= time) {
    for (int i = 200; i < 600; i = i + 100) {
      noStroke ();
      fill (random(0,255),random(0,255),random(0,255));
      rect (random(0,800),random(0,800),random(0,800),random(0,800));;
    }
  }
}



