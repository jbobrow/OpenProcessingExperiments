
int time;
int finalTime;
float s;
float m;
float h;
  
void setup(){
  size (200, 200);
  fill (255);
  smooth ();
  noStroke ();
  time = 0;

}

void draw(){
  time=millis();
  int timec = (time - finalTime);
  println(time - finalTime);
  
  background (0);

  float s = map (second(), 0, 60, 40, 160);
  float m = map (minute(), 0, 60, 40, 160);
  float h = map (hour(), 0, 24, 40, 160);

  // Three ellipse
  ellipse (width / 2, 35, 70, 70);
  ellipse (width / 2, height / 2, 70, 70);
  ellipse (width / 2, 165, 70, 70);

  // Seconds ellipse
  fill (0);
  ellipse (s, 35, 65, 65);

  // Minutes ellipse
  ellipse (m, height / 2, 65, 65);
  fill (255);

  // Hours ellipse
  ellipse (h, 165, 65, 65);
  fill (255);
}

void mousePressed() {
  finalTime = time;
  
}
