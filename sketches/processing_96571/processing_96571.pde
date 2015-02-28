
int time1 = 6000;
int time2 = 2000;
int time3 = 10000;
int time4 = 10500;
int time5 = 15000;
int time6 = 16000;
int time7 = 0;

void setup() {
  size(120, 300);
  background(204);
  smooth();
  ellipse(60, 50, 80, 80);
  ellipse(60, 150, 80, 80);
  ellipse(60, 250, 80, 80);
}

void draw() {
  int currentTime = millis();
      //background(204) to refresh the screen after lights
  //red light
  
if (currentTime > time7) {
fill(255, 0, 0);
ellipse(60, 50, 80, 80);  
if (currentTime > time1) {
fill(255);
ellipse(60, 50, 80, 80);
}
if (currentTime > time2) {
fill(255, 129, 26);
ellipse(60, 150, 80, 80);
if (currentTime > time1) {
fill(255);
ellipse(60, 150, 80, 80);
}
if (currentTime >time1) {
fill(0, 255, 0);
ellipse(60, 250, 80, 80);
if (currentTime > time3) {
fill(255);
ellipse(60, 250, 80, 80);
}
if (currentTime >time3) {
fill(255, 129, 26);
ellipse(60, 150, 80, 80);
if (currentTime > time5) {
fill(255);
ellipse(60, 150, 80, 80);
}
if (currentTime >time5) {
fill(255, 0, 0);
ellipse(60, 50, 80, 80);
if (currentTime > time6) {
fill(255);
ellipse(60, 50, 80, 80);
}
}
}
}
}
{
loop();
}
}
}

